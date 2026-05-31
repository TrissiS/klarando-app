import 'dart:async';
import 'dart:convert';
import 'dart:math' as math;
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import 'core/app_update_service.dart';
import 'core/klarando_api.dart';
import 'core/api_environment.dart';
import 'features/home/start_page.dart';
import 'features/order/order_page.dart';
import 'features/orders/orders_page.dart';
import 'features/profile/profile_page.dart';
import 'theme/klarando_theme.dart';
import 'utils/current_location.dart';

const _prefsKeyLegalAccepted = 'klarando_legal_accepted';
const _prefsKeyUserAddress = 'klarando_user_address';
const _prefsKeyUserZipCode = 'klarando_user_zip_code';
const _prefsKeyLanguageCode = 'klarando_language_code';
const _prefsKeyAppAuthToken = 'klarando_app_auth_token';
const _prefsKeyAppCustomer = 'klarando_app_customer';
const _prefsKeyUserLatitude = 'klarando_user_latitude';
const _prefsKeyUserLongitude = 'klarando_user_longitude';
const _prefsKeyLocationPromptCompleted = 'klarando_location_prompt_completed';
const _googleServerClientId =
    '198427463115-m6u039q4ive21u9gjrg9v61hk4nqkejn.apps.googleusercontent.com';
const _googleServicesConfigured = bool.fromEnvironment(
  'GOOGLE_SERVICES_CONFIGURED',
  defaultValue: true,
);
const _facebookAppId = String.fromEnvironment('FACEBOOK_APP_ID', defaultValue: '');
const _facebookClientToken = String.fromEnvironment(
  'FACEBOOK_CLIENT_TOKEN',
  defaultValue: '',
);
const _klarandoImpressumUrl = 'https://www.klarando.com/impressum';
const _klarandoPrivacyUrl = 'https://www.klarando.com/datenschutz';
const _klarandoTermsUrl = 'https://www.klarando.com/agb';
const _klarandoCookiesUrl = 'https://www.klarando.com/cookies';
const _klarandoJugendschutzUrl = 'https://www.klarando.com/jugendschutz';
const _klarandoSupportEmail = 'info@klarando.com';
const _klarandoAccountDeletionEmail = 'konto-loeschen@klarando.com';
final _googleMapsStaticApiKey = googleMapsApiKey;

class KlarandoApp extends StatelessWidget {
  const KlarandoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Klarando',
      debugShowCheckedModeBanner: false,
      theme: KlarandoTheme.materialTheme(),
      home: const _AppBootstrapGate(),
    );
  }
}

class _AppBootstrapGate extends StatefulWidget {
  const _AppBootstrapGate();

  @override
  State<_AppBootstrapGate> createState() => _AppBootstrapGateState();
}

class _AppBootstrapGateState extends State<_AppBootstrapGate> {
  final _api = const KlarandoApi();
  bool _loading = true;
  bool _legalAccepted = false;
  String? _userAddress;
  String? _userZipCode;
  double? _userLatitude;
  double? _userLongitude;
  String _languageCode = 'de';
  String _baseUrl = _defaultBaseUrl();
  String? _appAuthToken;
  AppCustomerUser? _appCustomer;
  bool _locationPromptCompleted = false;

  @override
  void initState() {
    super.initState();
    _loadBootstrapState();
  }

  Future<void> _loadBootstrapState() async {
    final prefs = await SharedPreferences.getInstance();
    if (!mounted) {
      return;
    }
    setState(() {
      _legalAccepted = prefs.getBool(_prefsKeyLegalAccepted) ?? false;
      _userAddress = prefs.getString(_prefsKeyUserAddress);
      _userZipCode = prefs.getString(_prefsKeyUserZipCode);
      _userLatitude = prefs.getDouble(_prefsKeyUserLatitude);
      _userLongitude = prefs.getDouble(_prefsKeyUserLongitude);
      _locationPromptCompleted = prefs.getBool(_prefsKeyLocationPromptCompleted) ?? false;
      _languageCode = _normalizedLanguageCode(prefs.getString(_prefsKeyLanguageCode));
      _baseUrl = _normalizedBaseUrl(defaultApiBaseUrl);
      _loading = false;
    });
    await _restoreAppAuth();
    await _maybePromptForStartupLocation();
  }

  Future<void> _maybePromptForStartupLocation() async {
    if (!mounted || !_legalAccepted || _locationPromptCompleted) {
      return;
    }
    _locationPromptCompleted = true;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_prefsKeyLocationPromptCompleted, true);
    if (!mounted) {
      return;
    }
    final allow = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Standort verwenden?'),
        content: const Text(
          'Darf Klarando deinen Standort verwenden, um passende Betriebe und Liefergebiete anzuzeigen?',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(false),
            child: const Text('Nicht jetzt'),
          ),
          FilledButton(
            onPressed: () => Navigator.of(dialogContext).pop(true),
            child: const Text('Erlauben'),
          ),
        ],
      ),
    );
    if (allow != true || !mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Standort wurde nicht freigegeben. Du kannst PLZ/Straße manuell eingeben.',
          ),
        ),
      );
      return;
    }
    try {
      final location = await fetchCurrentLocation();
      await _saveLocationCoordinates(location.latitude, location.longitude);
      final zip = (location.postalCode ?? '').trim();
      final address = (location.addressLine ?? '').trim();
      if (_isValidZipCode(zip) && address.isNotEmpty) {
        await _saveAddressData(address, zip);
      }
    } on CurrentLocationException catch (error) {
      if (!mounted) {
        return;
      }
      final lower = error.message.toLowerCase();
      final message = lower.contains('einstellungen') || lower.contains('denied')
          ? 'Standortberechtigung kann in den Systemeinstellungen aktiviert werden.'
          : error.message;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
    }
  }

  Future<void> _restoreAppAuth() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString(_prefsKeyAppAuthToken);
    final userRaw = prefs.getString(_prefsKeyAppCustomer);
    if (!mounted) {
      return;
    }
    if (token == null || token.trim().isEmpty || userRaw == null || userRaw.trim().isEmpty) {
      setState(() {
        _appAuthToken = null;
        _appCustomer = null;
      });
      return;
    }
    try {
      final parsed = jsonDecode(userRaw);
      if (parsed is! Map<String, dynamic>) {
        throw const FormatException('invalid');
      }
      setState(() {
        _appAuthToken = token;
        _appCustomer = AppCustomerUser.fromJson(parsed);
      });
    } catch (_) {
      await prefs.remove(_prefsKeyAppAuthToken);
      await prefs.remove(_prefsKeyAppCustomer);
      if (!mounted) {
        return;
      }
      setState(() {
        _appAuthToken = null;
        _appCustomer = null;
      });
    }
  }

  Future<void> _persistAppAuth({
    required String token,
    required AppCustomerUser user,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_prefsKeyAppAuthToken, token);
    await prefs.setString(
      _prefsKeyAppCustomer,
      jsonEncode({
        'id': user.id,
        'email': user.email,
        'fullName': user.fullName,
        'phone': user.phone,
        'street': user.street,
        'zipCode': user.zipCode,
        'city': user.city,
        'marketingOptIn': user.marketingOptIn,
        'deletionRequestedAt': user.deletionRequestedAt?.toIso8601String(),
      }),
    );
  }

  Future<void> _onAuthSuccess({
    required String token,
    required AppCustomerUser user,
  }) async {
    await _persistAppAuth(token: token, user: user);
    if (!mounted) {
      return;
    }
    setState(() {
      _appAuthToken = token;
      _appCustomer = user;
    });
    final profileZip = user.zipCode?.trim();
    final profileStreet = user.street?.trim();
    final profileCity = user.city?.trim();
    if (profileZip != null && _isValidZipCode(profileZip)) {
      final mergedAddress = [
        profileStreet ?? '',
        profileCity ?? '',
      ].where((entry) => entry.trim().isNotEmpty).join(', ');
      if (mergedAddress.trim().isNotEmpty) {
        await _saveAddressData(mergedAddress, profileZip);
      }
    }
  }

  Future<void> _loginFromAuth({
    required String email,
    required String password,
  }) async {
    final response = await _api.loginAppCustomer(
      baseUrl: _baseUrl,
      email: email,
      password: password,
    );
    await _onAuthSuccess(token: response.token, user: response.user);
  }

  Future<void> _registerFromAuth({
    required String email,
    required String fullName,
    required String password,
    String? phone,
    required String street,
    required String zipCode,
    required String city,
    required bool termsAccepted,
    required bool privacyAccepted,
  }) async {
    final response = await _api.registerAppCustomer(
      baseUrl: _baseUrl,
      email: email,
      fullName: fullName,
      password: password,
      phone: phone,
      street: street,
      zipCode: zipCode,
      city: city,
      termsAccepted: termsAccepted,
      privacyAccepted: privacyAccepted,
      marketingOptIn: false,
    );
    await _onAuthSuccess(token: response.token, user: response.user);
  }

  Future<AppCustomerEmailStatus> _checkEmailStatus(String email) async {
    try {
      return await _api.checkAppCustomerEmailStatus(
        baseUrl: _baseUrl,
        email: email,
      );
    } on ApiException catch (error) {
      if (error.statusCode == 404) {
        return const AppCustomerEmailStatus(exists: false, known: false);
      }
      rethrow;
    }
  }

  Future<void> _handleLogoutToAuthGate() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_prefsKeyAppAuthToken);
    await prefs.remove(_prefsKeyAppCustomer);
    if (!mounted) {
      return;
    }
    setState(() {
      _appAuthToken = null;
      _appCustomer = null;
    });
  }

  Future<void> _acceptLegal() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_prefsKeyLegalAccepted, true);
    if (!mounted) {
      return;
    }
    setState(() {
      _legalAccepted = true;
    });
  }

  Future<void> _saveAddressData(String address, String zipCode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_prefsKeyUserAddress, address);
    await prefs.setString(_prefsKeyUserZipCode, zipCode);
    if (!mounted) {
      return;
    }
    setState(() {
      _userAddress = address;
      _userZipCode = zipCode;
    });
  }

  Future<void> _saveLocationCoordinates(double latitude, double longitude) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setDouble(_prefsKeyUserLatitude, latitude);
    await prefs.setDouble(_prefsKeyUserLongitude, longitude);
    if (!mounted) {
      return;
    }
    setState(() {
      _userLatitude = latitude;
      _userLongitude = longitude;
    });
  }

  Future<void> _loginWithGoogle({
    required String idToken,
    String? email,
    String? name,
  }) async {
    final response = await _api.loginAppCustomerWithGoogle(
      baseUrl: _baseUrl,
      idToken: idToken,
      email: email,
      name: name,
    );
    await _onAuthSuccess(token: response.token, user: response.user);
  }

  Future<void> _loginWithFacebook({
    required String accessToken,
    String? email,
  }) async {
    final response = await _api.loginAppCustomerWithFacebook(
      baseUrl: _baseUrl,
      accessToken: accessToken,
      email: email,
    );
    await _onAuthSuccess(token: response.token, user: response.user);
  }

  Future<void> _saveLanguage(String languageCode) async {
    final normalized = _normalizedLanguageCode(languageCode);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_prefsKeyLanguageCode, normalized);
    if (!mounted) {
      return;
    }
    setState(() {
      _languageCode = normalized;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    if (!_legalAccepted) {
      return _LegalConsentPage(onAccepted: _acceptLegal);
    }

    if (_appAuthToken == null || _appCustomer == null) {
      return _CustomerAuthStartPage(
        onCheckEmailStatus: _checkEmailStatus,
        onLogin: _loginFromAuth,
        onRegister: _registerFromAuth,
        onGoogleLogin: _loginWithGoogle,
        onFacebookLogin: _loginWithFacebook,
      );
    }

    final address = _userAddress?.trim();
    final zipCode = _userZipCode?.trim();
    if (address == null || address.isEmpty || zipCode == null || !_isValidZipCode(zipCode)) {
      return _AddressCapturePage(
        initialLanguageCode: _languageCode,
        onAddressSaved: _saveAddressData,
        onCoordinatesSaved: _saveLocationCoordinates,
      );
    }

    return HomeShell(
      userAddress: address,
      userZipCode: zipCode,
      userLatitude: _userLatitude,
      userLongitude: _userLongitude,
      languageCode: _languageCode,
      onLanguageChanged: _saveLanguage,
      onRequireAuth: _handleLogoutToAuthGate,
    );
  }
}

class HomeShell extends StatefulWidget {
  const HomeShell({
    required this.userAddress,
    required this.userZipCode,
    this.userLatitude,
    this.userLongitude,
    required this.languageCode,
    required this.onLanguageChanged,
    required this.onRequireAuth,
    super.key,
  });

  final String userAddress;
  final String userZipCode;
  final double? userLatitude;
  final double? userLongitude;
  final String languageCode;
  final Future<void> Function(String languageCode) onLanguageChanged;
  final Future<void> Function() onRequireAuth;

  @override
  State<HomeShell> createState() => _HomeShellState();
}

enum _AuthEmailMode { undecided, login, register }

class _CustomerAuthStartPage extends StatefulWidget {
  const _CustomerAuthStartPage({
    required this.onCheckEmailStatus,
    required this.onLogin,
    required this.onRegister,
    required this.onGoogleLogin,
    required this.onFacebookLogin,
  });

  final Future<AppCustomerEmailStatus> Function(String email) onCheckEmailStatus;
  final Future<void> Function({
    required String email,
    required String password,
  })
  onLogin;
  final Future<void> Function({
    required String email,
    required String fullName,
    required String password,
    String? phone,
    required String street,
    required String zipCode,
    required String city,
    required bool termsAccepted,
    required bool privacyAccepted,
  })
  onRegister;
  final Future<void> Function({
    required String idToken,
    String? email,
    String? name,
  })
  onGoogleLogin;
  final Future<void> Function({
    required String accessToken,
    String? email,
  })
  onFacebookLogin;

  @override
  State<_CustomerAuthStartPage> createState() => _CustomerAuthStartPageState();
}

class _CustomerAuthStartPageState extends State<_CustomerAuthStartPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordRepeatController = TextEditingController();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _streetController = TextEditingController();
  final _zipController = TextEditingController();
  final _cityController = TextEditingController();

  _AuthEmailMode _mode = _AuthEmailMode.login;
  bool _busy = false;
  bool _privacyAccepted = false;
  bool _termsAccepted = false;
  bool _passwordVisible = false;
  String? _infoMessage;

  Future<String> _packageName() async {
    final info = await PackageInfo.fromPlatform();
    return info.packageName;
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _passwordRepeatController.dispose();
    _nameController.dispose();
    _phoneController.dispose();
    _streetController.dispose();
    _zipController.dispose();
    _cityController.dispose();
    super.dispose();
  }

  Future<void> _submitGoogleLogin() async {
    if (_busy) {
      return;
    }
    setState(() {
      _busy = true;
    });
    try {
      if (!_googleServicesConfigured) {
        _showMessage(
          'Google Login ist deaktiviert: google-services.json fehlt oder Firebase '
          'ist noch nicht vollständig konfiguriert.',
        );
        return;
      }
      final packageName = await _packageName();
      debugPrint(
        'GOOGLE_SIGN_IN_CONFIG {'
        'packageName: $packageName, '
        'clientIdPresent: ${_googleServerClientId.trim().isNotEmpty}, '
        'serverClientIdPresent: ${_googleServerClientId.trim().isNotEmpty}, '
        'buildMode: ${kReleaseMode ? 'release' : 'debug'}, '
        "flavor: ${const String.fromEnvironment('FLAVOR', defaultValue: 'customer')}"
        '}',
      );
      final signIn = GoogleSignIn(
        serverClientId: _googleServerClientId,
      );
      final account = await signIn.signIn();
      if (account == null) {
        _showMessage('Google-Anmeldung wurde abgebrochen.');
        return;
      }
      final auth = await account.authentication;
      final idToken = auth.idToken;
      if (idToken == null || idToken.trim().isEmpty) {
        _showMessage('Google-ID-Token fehlt. Bitte Google Client ID / SHA-1 prüfen.');
        return;
      }
      await widget.onGoogleLogin(
        idToken: idToken,
        email: account.email,
        name: account.displayName,
      );
    } on ApiException catch (error) {
      debugPrint('GOOGLE LOGIN API ERROR: ${error.message} (status=${error.statusCode})');
      _showMessage('Google Login vom Server abgelehnt: ${error.message}');
    } catch (error, stackTrace) {
      debugPrint('GOOGLE LOGIN ERROR: $error');
      debugPrint(stackTrace.toString());
      _showMessage(
        'Google Login fehlgeschlagen. Bitte Google OAuth für com.klarando.customer '
        '(SHA-1/SHA-256 Debug+Release) in Firebase prüfen.',
      );
    } finally {
      if (mounted) {
        setState(() {
          _busy = false;
        });
      }
    }
  }

  Future<void> _submitFacebookLogin() async {
    if (_busy) {
      return;
    }
    setState(() {
      _busy = true;
    });
    try {
      final packageName = await _packageName();
      debugPrint(
        'FACEBOOK_LOGIN_CONFIG {'
        'appIdPresent: ${_facebookAppId.trim().isNotEmpty}, '
        'clientTokenPresent: ${_facebookClientToken.trim().isNotEmpty}, '
        'packageName: $packageName, '
        "flavor: ${const String.fromEnvironment('FLAVOR', defaultValue: 'customer')}"
        '}',
      );
      if (_facebookAppId.trim().isEmpty || _facebookClientToken.trim().isEmpty) {
        _showMessage(
          'Facebook Login ist noch nicht vollständig konfiguriert '
          '(App ID / Client Token fehlt).',
        );
        return;
      }
      final result = await FacebookAuth.instance.login();
      if (result.status != LoginStatus.success || result.accessToken == null) {
        _showMessage('Facebook-Anmeldung wurde abgebrochen.');
        return;
      }
      final userData = await FacebookAuth.instance.getUserData(fields: 'email,name');
      await widget.onFacebookLogin(
        accessToken: result.accessToken!.tokenString,
        email: userData['email'] is String ? userData['email'] as String : null,
      );
    } on ApiException catch (error) {
      _showMessage(error.message);
    } catch (error) {
      _showMessage(
        'Facebook Login fehlgeschlagen. Bitte App-ID, Client-Token und KeyHash '
        'für com.klarando.customer in der Facebook Console prüfen.',
      );
      debugPrint('FACEBOOK LOGIN ERROR: $error');
    } finally {
      if (mounted) {
        setState(() {
          _busy = false;
        });
      }
    }
  }

  Future<void> _continueWithEmail() async {
    final email = _emailController.text.trim();
    if (email.isEmpty || !email.contains('@')) {
      _showMessage('Bitte eine gültige E-Mail-Adresse eingeben.');
      return;
    }
    setState(() {
      _busy = true;
      _infoMessage = null;
    });
    try {
      final status = await widget.onCheckEmailStatus(email);
      if (!mounted) {
        return;
      }
      setState(() {
        if (status.known) {
          _mode = status.exists ? _AuthEmailMode.login : _AuthEmailMode.register;
        } else {
          _mode = _AuthEmailMode.login;
          _infoMessage =
              'E-Mail-Prüfung wird vorbereitet. Du kannst dich einloggen oder unten registrieren.';
        }
      });
    } on ApiException catch (error) {
      _showMessage(error.message);
    } finally {
      if (mounted) {
        setState(() {
          _busy = false;
        });
      }
    }
  }

  Future<void> _submit() async {
    final email = _emailController.text.trim();
    final password = _passwordController.text;
    if (email.isEmpty || password.isEmpty) {
      _showMessage('Bitte E-Mail-Adresse und Passwort eingeben.');
      return;
    }

    if (_mode == _AuthEmailMode.login) {
      setState(() => _busy = true);
      try {
        await widget.onLogin(email: email, password: password);
      } on ApiException catch (error) {
        _showMessage(error.message);
      } finally {
        if (mounted) {
          setState(() => _busy = false);
        }
      }
      return;
    }

    final fullName = _nameController.text.trim();
    final repeat = _passwordRepeatController.text;
    final street = _streetController.text.trim();
    final zip = _zipController.text.trim();
    final city = _cityController.text.trim();

    if (fullName.isEmpty) {
      _showMessage('Bitte deinen Namen eingeben.');
      return;
    }
    if (password.length < 6) {
      _showMessage('Passwort muss mindestens 6 Zeichen haben.');
      return;
    }
    if (password != repeat) {
      _showMessage('Passwörter stimmen nicht überein.');
      return;
    }
    if (!_looksLikeStreetWithHouseNumber(street) || !_isValidZipCode(zip) || city.length < 2) {
      _showMessage('Bitte eine vollständige Standard-Lieferadresse eingeben.');
      return;
    }
    if (!_privacyAccepted || !_termsAccepted) {
      _showMessage('Bitte Datenschutz und AGB akzeptieren.');
      return;
    }

    setState(() => _busy = true);
    try {
      await widget.onRegister(
        email: email,
        fullName: fullName,
        password: password,
        phone: _phoneController.text.trim().isEmpty ? null : _phoneController.text.trim(),
        street: street,
        zipCode: zip,
        city: city,
        termsAccepted: _termsAccepted,
        privacyAccepted: _privacyAccepted,
      );
    } on ApiException catch (error) {
      _showMessage(error.message);
    } finally {
      if (mounted) {
        setState(() => _busy = false);
      }
    }
  }

  Future<void> _openLink(String url) async {
    final uri = Uri.tryParse(url);
    if (uri == null) {
      return;
    }
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }

  void _showMessage(String message) {
    if (!mounted) {
      return;
    }
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    final isRegister = _mode == _AuthEmailMode.register;
    final canSubmit = _mode == _AuthEmailMode.login || _mode == _AuthEmailMode.register;

    return Scaffold(
      backgroundColor: const Color(0xFFFFF7ED),
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 420),
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    children: [
                      const SizedBox(width: 4),
                      Expanded(
                        child: Image.asset(
                          'assets/klarando_logo.png',
                          height: 56,
                          fit: BoxFit.contain,
                          errorBuilder: (_, __, ___) => const Text(
                            'Klarando',
                            style: TextStyle(fontSize: 28, fontWeight: FontWeight.w800),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'Einloggen oder Konto erstellen',
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.w800, height: 1.15),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton.icon(
                    onPressed: _busy ? null : _submitGoogleLogin,
                    icon: const Icon(Icons.g_mobiledata, size: 26),
                    label: const Text('Mit Google fortfahren'),
                  ),
                  if (!_googleServicesConfigured) ...[
                    const SizedBox(height: 6),
                    const Text(
                      'Google Login ist aktuell deaktiviert (Firebase-Konfiguration fehlt).',
                      style: TextStyle(fontSize: 12, color: Color(0xFF7C2D12)),
                    ),
                  ],
                  const SizedBox(height: 10),
                  ElevatedButton.icon(
                    onPressed: _busy ? null : _submitFacebookLogin,
                    icon: const Icon(Icons.facebook),
                    label: const Text('Mit Facebook fortfahren'),
                  ),
                  const SizedBox(height: 16),
                  const Row(
                    children: [
                      Expanded(child: Divider()),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Text('oder'),
                      ),
                      Expanded(child: Divider()),
                    ],
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      labelText: 'E-Mail-Adresse',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  if (canSubmit) ...[
                    const SizedBox(height: 10),
                    TextField(
                      controller: _passwordController,
                      obscureText: !_passwordVisible,
                      decoration: InputDecoration(
                        labelText: 'Passwort',
                        border: OutlineInputBorder(),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _passwordVisible = !_passwordVisible;
                            });
                          },
                          icon: Icon(
                            _passwordVisible ? Icons.visibility_off : Icons.visibility,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    OutlinedButton(
                      onPressed: _busy
                          ? null
                          : (_mode == _AuthEmailMode.login ? _submit : _continueWithEmail),
                      child: Text(
                        _busy
                            ? 'Bitte warten...'
                            : (_mode == _AuthEmailMode.login
                                  ? 'Login mit E-Mail'
                                  : 'Mit E-Mail fortfahren'),
                      ),
                    ),
                  ],
                  if (_infoMessage != null) ...[
                    const SizedBox(height: 10),
                    Text(
                      _infoMessage!,
                      style: const TextStyle(color: Colors.black54, fontSize: 12.5),
                    ),
                  ],
                  if (_mode == _AuthEmailMode.login) ...[
                    const SizedBox(height: 8),
                    TextButton(
                      onPressed: _busy
                          ? null
                          : () => setState(() {
                              _mode = _AuthEmailMode.register;
                            }),
                      child: const Text('Noch kein Konto? Registrierung starten'),
                    ),
                  ],
                  if (isRegister) ...[
                    const SizedBox(height: 10),
                    TextField(
                      controller: _nameController,
                      decoration: const InputDecoration(
                        labelText: 'Name',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextField(
                      controller: _passwordRepeatController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        labelText: 'Passwort wiederholen',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextField(
                      controller: _phoneController,
                      keyboardType: TextInputType.phone,
                      decoration: const InputDecoration(
                        labelText: 'Telefon (optional)',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextField(
                      controller: _streetController,
                      decoration: const InputDecoration(
                        labelText: 'Straße und Hausnummer',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _zipController,
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              labelText: 'PLZ',
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: TextField(
                            controller: _cityController,
                            decoration: const InputDecoration(
                              labelText: 'Ort',
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    CheckboxListTile(
                      value: _privacyAccepted,
                      onChanged: _busy
                          ? null
                          : (value) => setState(() => _privacyAccepted = value ?? false),
                      contentPadding: EdgeInsets.zero,
                      title: const Text('Datenschutz akzeptieren'),
                      controlAffinity: ListTileControlAffinity.leading,
                    ),
                    CheckboxListTile(
                      value: _termsAccepted,
                      onChanged: _busy
                          ? null
                          : (value) => setState(() => _termsAccepted = value ?? false),
                      contentPadding: EdgeInsets.zero,
                      title: const Text('AGB akzeptieren'),
                      controlAffinity: ListTileControlAffinity.leading,
                    ),
                  ],
                  if (isRegister) ...[
                    const SizedBox(height: 8),
                    ElevatedButton(
                      onPressed: _busy ? null : _submit,
                      child: Text(
                        _busy ? 'Bitte warten...' : 'Konto erstellen',
                      ),
                    ),
                  ],
                  const SizedBox(height: 22),
                  Wrap(
                    alignment: WrapAlignment.center,
                    children: [
                      const Text(
                        'Wenn du fortfährst, stimmst du unseren ',
                        style: TextStyle(fontSize: 12.5, color: Colors.black54),
                      ),
                      InkWell(
                        onTap: () => _openLink(_klarandoTermsUrl),
                        child: const Text(
                          'AGB',
                          style: TextStyle(fontSize: 12.5, fontWeight: FontWeight.w700),
                        ),
                      ),
                      const Text(' und ', style: TextStyle(fontSize: 12.5, color: Colors.black54)),
                      InkWell(
                        onTap: () => _openLink(_klarandoPrivacyUrl),
                        child: const Text(
                          'Datenschutzerklärung',
                          style: TextStyle(fontSize: 12.5, fontWeight: FontWeight.w700),
                        ),
                      ),
                      const Text('. ', style: TextStyle(fontSize: 12.5, color: Colors.black54)),
                      InkWell(
                        onTap: () => _openLink(_klarandoCookiesUrl),
                        child: const Text(
                          'Cookies',
                          style: TextStyle(fontSize: 12.5, fontWeight: FontWeight.w700),
                        ),
                      ),
                      const Text(' | ', style: TextStyle(fontSize: 12.5, color: Colors.black54)),
                      InkWell(
                        onTap: () => _openLink(_klarandoJugendschutzUrl),
                        child: const Text(
                          'Jugendschutz',
                          style: TextStyle(fontSize: 12.5, fontWeight: FontWeight.w700),
                        ),
                      ),
                      const Text(' | ', style: TextStyle(fontSize: 12.5, color: Colors.black54)),
                      InkWell(
                        onTap: () => _openLink(_klarandoImpressumUrl),
                        child: const Text(
                          'Impressum',
                          style: TextStyle(fontSize: 12.5, fontWeight: FontWeight.w700),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _HomeShellState extends State<HomeShell> {
  final _api = const KlarandoApi();
  final _appUpdateService = AppUpdateService();

  int _currentIndex = 0;
  String _baseUrl = _defaultBaseUrl();
  late String _languageCode = widget.languageCode;
  late String _activeAddress = widget.userAddress;
  late String _activeZipCode = widget.userZipCode;
  double? _activeLatitude;
  double? _activeLongitude;

  bool _discoveryLoading = false;
  String _discoveryMessage = 'Wir laden passende Filialen für dich.';
  List<TenantDiscoveryTenant> _tenantResults = const [];
  TenantDiscoveryTenant? _selectedTenant;

  bool _catalogLoading = false;
  String _catalogMessage = 'Wähle eine Filiale aus, um Produkte zu sehen.';
  List<TenantCatalogProduct> _catalogProducts = const [];
  TenantCatalog? _selectedCatalog;

  final Set<String> _favoriteTenantIds = <String>{};
  final Map<String, _CartLine> _cart = {};
  final List<_SubmittedOrder> _submittedOrders = [];
  AppCustomerUser? _appCustomer;
  String? _appAuthToken;
  bool _appAuthBusy = false;
  Timer? _ordersSyncTimer;
  Timer? _tenantStatusSyncTimer;
  Timer? _checkoutBarCollapseTimer;
  bool _checkoutBarCollapsed = false;
  bool _ordersSyncInFlight = false;
  bool _customerUpdateBusy = false;
  String? _customerUpdateInfo;

  String _streetForDiscovery() {
    final raw = _activeAddress.trim();
    if (raw.isEmpty) {
      return '';
    }
    final firstPart = raw.split(',').first.trim();
    return firstPart;
  }

  String _cityForDiscovery() {
    final raw = _activeAddress.trim();
    if (raw.isEmpty) {
      return '';
    }
    final parts = raw.split(',');
    if (parts.length < 2) {
      return _appCustomer?.city?.trim() ?? '';
    }
    return parts.sublist(1).join(',').trim();
  }

  Future<void> _persistDiscoveryAddress({
    required String address,
    required String zipCode,
    double? latitude,
    double? longitude,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_prefsKeyUserAddress, address);
    await prefs.setString(_prefsKeyUserZipCode, zipCode);
    if (latitude != null && longitude != null) {
      await prefs.setDouble(_prefsKeyUserLatitude, latitude);
      await prefs.setDouble(_prefsKeyUserLongitude, longitude);
    }
    if (!mounted) {
      return;
    }
    setState(() {
      _activeAddress = address;
      _activeZipCode = zipCode;
      _activeLatitude = latitude;
      _activeLongitude = longitude;
    });
  }

  Future<void> _saveLocationCoordinates(double latitude, double longitude) async {
    await _persistDiscoveryAddress(
      address: _activeAddress,
      zipCode: _activeZipCode,
      latitude: latitude,
      longitude: longitude,
    );
  }

  @override
  void initState() {
    super.initState();
    _activeLatitude = widget.userLatitude;
    _activeLongitude = widget.userLongitude;
    _restoreAppAuthFromPrefs();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _searchTenants(_activeZipCode, DiscoveryMode.delivery);
      unawaited(_checkForCustomerAppUpdate(silentWhenCurrent: true));
      _startTenantStatusSyncTicker();
    });
  }

  @override
  void dispose() {
    _stopOrdersSyncTicker();
    _tenantStatusSyncTimer?.cancel();
    _checkoutBarCollapseTimer?.cancel();
    super.dispose();
  }

  void _cancelCheckoutBarAutoCollapse() {
    _checkoutBarCollapseTimer?.cancel();
    _checkoutBarCollapseTimer = null;
  }

  void _scheduleCheckoutBarAutoCollapse() {
    _cancelCheckoutBarAutoCollapse();
    _checkoutBarCollapseTimer = Timer(const Duration(seconds: 3), () {
      if (!mounted || _cart.isEmpty || _checkoutBarCollapsed) {
        return;
      }
      setState(() {
        _checkoutBarCollapsed = true;
      });
    });
  }

  int get _cartItemsCount =>
      _cart.values.fold<int>(0, (sum, line) => sum + line.quantity);

  double get _cartTotal =>
      _cart.values.fold<double>(0, (sum, line) => sum + line.lineTotal);

  Map<String, int> get _orderRatings {
    final map = <String, int>{};
    for (final entry in _submittedOrders) {
      if (entry.rating != null) {
        map[entry.order.id] = entry.rating!;
      }
    }
    return map;
  }

  Map<String, TenantRatingInfo> get _tenantRatings {
    final sums = <String, int>{};
    final counts = <String, int>{};
    for (final entry in _submittedOrders) {
      final rating = entry.rating;
      if (rating == null) {
        continue;
      }
      sums[entry.tenantId] = (sums[entry.tenantId] ?? 0) + rating;
      counts[entry.tenantId] = (counts[entry.tenantId] ?? 0) + 1;
    }

    final map = <String, TenantRatingInfo>{};
    for (final tenantId in sums.keys) {
      final count = counts[tenantId] ?? 0;
      if (count <= 0) {
        continue;
      }
      map[tenantId] = TenantRatingInfo(
        average: (sums[tenantId] ?? 0) / count,
        count: count,
      );
    }
    return map;
  }

  Future<void> _restoreAppAuthFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString(_prefsKeyAppAuthToken);
    final userRaw = prefs.getString(_prefsKeyAppCustomer);

    if (!mounted) {
      return;
    }

    if (token == null || token.trim().isEmpty || userRaw == null || userRaw.trim().isEmpty) {
      setState(() {
        _appAuthToken = null;
        _appCustomer = null;
      });
      return;
    }

    try {
      final parsed = jsonDecode(userRaw);
      if (parsed is! Map<String, dynamic>) {
        throw const FormatException('invalid user json');
      }
      setState(() {
        _appAuthToken = token;
        _appCustomer = AppCustomerUser.fromJson(parsed);
      });
      final profile = _appCustomer;
      final profileStreet = profile?.street?.trim();
      final profileZip = profile?.zipCode?.trim();
      final profileCity = profile?.city?.trim();
      if (profileStreet != null &&
          profileStreet.isNotEmpty &&
          profileZip != null &&
          _isValidZipCode(profileZip)) {
        final merged = [profileStreet, if (profileCity != null && profileCity.isNotEmpty) profileCity]
            .join(', ');
        await _persistDiscoveryAddress(address: merged, zipCode: profileZip);
      }
      unawaited(_syncSubmittedOrdersFromServer(force: true));
    } catch (_) {
      await prefs.remove(_prefsKeyAppAuthToken);
      await prefs.remove(_prefsKeyAppCustomer);
      if (!mounted) {
        return;
      }
      setState(() {
        _appAuthToken = null;
        _appCustomer = null;
      });
    }
  }

  Future<void> _persistAppAuth({
    required String token,
    required AppCustomerUser user,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_prefsKeyAppAuthToken, token);
    await prefs.setString(
      _prefsKeyAppCustomer,
      jsonEncode({
        'id': user.id,
        'email': user.email,
        'fullName': user.fullName,
        'phone': user.phone,
        'street': user.street,
        'zipCode': user.zipCode,
        'city': user.city,
        'marketingOptIn': user.marketingOptIn,
        'deletionRequestedAt': user.deletionRequestedAt?.toIso8601String(),
      }),
    );
  }

  Future<void> _clearAppAuth() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_prefsKeyAppAuthToken);
    await prefs.remove(_prefsKeyAppCustomer);
  }

  Future<void> _loginAppCustomer({
    required String email,
    required String password,
  }) async {
    if (_appAuthBusy) {
      return;
    }
    setState(() {
      _appAuthBusy = true;
    });

    try {
      final response = await _api.loginAppCustomer(
        baseUrl: _baseUrl,
        email: email,
        password: password,
      );
      await _persistAppAuth(token: response.token, user: response.user);
      if (!mounted) {
        return;
      }
      setState(() {
        _appAuthToken = response.token;
        _appCustomer = response.user;
      });
    } on ApiException catch (error) {
      if (!mounted) {
        return;
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(error.message)),
      );
      rethrow;
    } finally {
      if (mounted) {
        setState(() {
          _appAuthBusy = false;
        });
      }
    }
  }

  Future<void> _registerAppCustomer({
    required String email,
    required String fullName,
    required String password,
    String? phone,
    required String street,
    required String zipCode,
    required String city,
    bool marketingOptIn = false,
    bool privacyAccepted = false,
    bool termsAccepted = false,
  }) async {
    if (_appAuthBusy) {
      return;
    }
    setState(() {
      _appAuthBusy = true;
    });

    try {
      final response = await _api.registerAppCustomer(
        baseUrl: _baseUrl,
        email: email,
        fullName: fullName,
        password: password,
        phone: phone,
        street: street,
        zipCode: zipCode,
        city: city,
        marketingOptIn: marketingOptIn,
        privacyAccepted: privacyAccepted,
        termsAccepted: termsAccepted,
      );
      await _persistAppAuth(token: response.token, user: response.user);
      if (!mounted) {
        return;
      }
      setState(() {
        _appAuthToken = response.token;
        _appCustomer = response.user;
      });
    } on ApiException catch (error) {
      if (!mounted) {
        return;
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(error.message)),
      );
      rethrow;
    } finally {
      if (mounted) {
        setState(() {
          _appAuthBusy = false;
        });
      }
    }
  }

  Future<void> _logoutAppCustomer() async {
    await _clearAppAuth();
    await widget.onRequireAuth();
  }

  Future<void> _socialQuickstartAppCustomer({
    required String provider,
    required String email,
    required String fullName,
    String? phone,
    required String street,
    required String zipCode,
    required String city,
    bool marketingOptIn = false,
    required bool privacyAccepted,
    required bool termsAccepted,
  }) async {
    if (_appAuthBusy) {
      return;
    }
    setState(() {
      _appAuthBusy = true;
    });

    try {
      final response = await _api.socialQuickstartAppCustomer(
        baseUrl: _baseUrl,
        provider: provider,
        email: email,
        fullName: fullName,
        phone: phone,
        street: street,
        zipCode: zipCode,
        city: city,
        marketingOptIn: marketingOptIn,
        privacyAccepted: privacyAccepted,
        termsAccepted: termsAccepted,
      );
      await _persistAppAuth(token: response.token, user: response.user);
      if (!mounted) {
        return;
      }
      setState(() {
        _appAuthToken = response.token;
        _appCustomer = response.user;
      });
    } on ApiException catch (error) {
      if (!mounted) {
        return;
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(error.message)),
      );
      rethrow;
    } finally {
      if (mounted) {
        setState(() {
          _appAuthBusy = false;
        });
      }
    }
  }

  Future<void> _updateAppCustomerProfile({
    required String fullName,
    String? phone,
    String? street,
    String? zipCode,
    String? city,
    bool marketingOptIn = false,
  }) async {
    final token = _appAuthToken;
    if (token == null || token.trim().isEmpty) {
      throw const ApiException('Bitte zuerst einloggen.');
    }

    final updated = await _api.updateCurrentAppCustomer(
      baseUrl: _baseUrl,
      appAuthToken: token,
      fullName: fullName,
      phone: phone,
      street: street,
      zipCode: zipCode,
      city: city,
      marketingOptIn: marketingOptIn,
    );
    await _persistAppAuth(token: token, user: updated);
    if (!mounted) {
      return;
    }
    setState(() {
      _appCustomer = updated;
    });
  }

  Future<void> _requestAppCustomerDeletion({
    String? note,
  }) async {
    final token = _appAuthToken;
    if (token == null || token.trim().isEmpty) {
      throw const ApiException('Bitte zuerst einloggen.');
    }
    final deletionAt = await _api.requestAppAccountDeletion(
      baseUrl: _baseUrl,
      appAuthToken: token,
      note: note,
    );
    if (_appCustomer == null) {
      return;
    }
    final updated = AppCustomerUser(
      id: _appCustomer!.id,
      email: _appCustomer!.email,
      fullName: _appCustomer!.fullName,
      phone: _appCustomer!.phone,
      street: _appCustomer!.street,
      zipCode: _appCustomer!.zipCode,
      city: _appCustomer!.city,
      marketingOptIn: _appCustomer!.marketingOptIn,
      deletionRequestedAt: deletionAt,
    );
    await _persistAppAuth(token: token, user: updated);
    if (!mounted) {
      return;
    }
    setState(() {
      _appCustomer = updated;
    });
  }

  double? _parseMoneyValue(String? raw) {
    if (raw == null || raw.trim().isEmpty) {
      return null;
    }
    final normalized = raw.replaceAll(',', '.');
    final match = RegExp(r'-?\d+(?:\.\d+)?').firstMatch(normalized);
    if (match == null) {
      return null;
    }
    return double.tryParse(match.group(0) ?? '');
  }

  double _subtotalForLines(List<_CartLine> lines) {
    return lines.fold<double>(0, (sum, line) => sum + line.lineTotal);
  }

  String _formatCurrency(double amount) {
    final normalized = amount.toStringAsFixed(2).replaceAll('.', ',');
    return '$normalized €';
  }

  String _articleCountLabel(int count) {
    return count == 1 ? '1 Artikel' : '$count Artikel';
  }

  Widget? _buildCartMinimumOrderHint() {
    if (_cart.isEmpty) {
      return null;
    }
    final tenant = _selectedTenant;
    if (tenant == null || !tenant.deliveryAvailable) {
      return null;
    }
    final minOrderValue = _parseMoneyValue(tenant.minOrderValue);
    if (minOrderValue == null || minOrderValue <= 0) {
      return null;
    }
    final remaining = minOrderValue - _cartTotal;
    final reached = remaining <= 0;

    return Container(
      width: double.infinity,
      color: reached ? const Color(0xFFD1FAE5) : const Color(0xFFFEF3C7),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Text(
        reached
            ? '✓ Mindestbestellwert erreicht'
            : 'Noch ${_formatCurrency(remaining)} bis Mindestbestellwert',
        style: TextStyle(
          color: reached ? const Color(0xFF065F46) : const Color(0xFF92400E),
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

  Future<void> _useCurrentLocationForDiscovery() async {
    final location = await fetchCurrentLocation();
    final resolvedAddress = (location.addressLine ?? '').trim();
    final resolvedZip = (location.postalCode ?? '').trim();
    final fallbackAddress =
        'Standort ${location.latitude.toStringAsFixed(5)}, ${location.longitude.toStringAsFixed(5)}';
    final addressToStore = resolvedAddress.isNotEmpty ? resolvedAddress : fallbackAddress;
    final zipToStore = _isValidZipCode(resolvedZip) ? resolvedZip : _activeZipCode;
    await _persistDiscoveryAddress(
      address: addressToStore,
      zipCode: zipToStore,
      latitude: location.latitude,
      longitude: location.longitude,
    );
    await _searchTenants(_activeZipCode, DiscoveryMode.delivery);
  }

  Future<void> _promptAndSaveManualAddress() async {
    final addressController = TextEditingController(text: _activeAddress);
    final zipController = TextEditingController(text: _activeZipCode);
    final cityController = TextEditingController(
      text: _appCustomer?.city?.trim() ?? '',
    );
    final formKey = GlobalKey<FormState>();
    final accepted = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Adresse ändern'),
        content: Form(
          key: formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: addressController,
                decoration: const InputDecoration(labelText: 'Straße + Hausnummer'),
                validator: (value) {
                  final text = (value ?? '').trim();
                  if (!_looksLikeStreetWithHouseNumber(text)) {
                    return 'Bitte Straße und Hausnummer eingeben.';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: zipController,
                decoration: const InputDecoration(labelText: 'PLZ'),
                keyboardType: TextInputType.number,
                validator: (value) =>
                    _isValidZipCode((value ?? '').trim()) ? null : 'Ungültige PLZ.',
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: cityController,
                decoration: const InputDecoration(labelText: 'Ort'),
                validator: (value) =>
                    (value ?? '').trim().length >= 2 ? null : 'Bitte Ort eingeben.',
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(false),
            child: const Text('Abbrechen'),
          ),
          FilledButton(
            onPressed: () {
              if (formKey.currentState?.validate() != true) {
                return;
              }
              Navigator.of(dialogContext).pop(true);
            },
            child: const Text('Übernehmen'),
          ),
        ],
      ),
    );
    if (accepted != true) {
      return;
    }
    final street = addressController.text.trim();
    final zip = zipController.text.trim();
    final city = cityController.text.trim();
    final mergedAddress = '$street, $city';
    await _persistDiscoveryAddress(address: mergedAddress, zipCode: zip);
    await _searchTenants(zip, DiscoveryMode.delivery);
  }

  Future<void> _openAddressManager() async {
    await showModalBottomSheet<void>(
      context: context,
      showDragHandle: true,
      builder: (sheetContext) {
        final profileStreet = _appCustomer?.street?.trim();
        final profileZip = _appCustomer?.zipCode?.trim();
        final profileCity = _appCustomer?.city?.trim();
        final hasProfileAddress =
            profileStreet != null && profileStreet.isNotEmpty && profileZip != null && _isValidZipCode(profileZip);
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Adresse auswählen',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
                ),
                const SizedBox(height: 12),
                if (hasProfileAddress)
                  ListTile(
                    leading: const Icon(Icons.person_pin_circle_outlined),
                    title: const Text('Profil-Hauptadresse verwenden'),
                    subtitle: Text('$profileStreet, ${profileZip!} ${profileCity ?? ''}'.trim()),
                    onTap: () async {
                      Navigator.of(sheetContext).pop();
                      await _persistDiscoveryAddress(
                        address: '$profileStreet${(profileCity ?? '').isEmpty ? '' : ', $profileCity'}',
                        zipCode: profileZip,
                      );
                      await _searchTenants(profileZip, DiscoveryMode.delivery);
                    },
                  ),
                ListTile(
                  leading: const Icon(Icons.my_location),
                  title: const Text('Standort verwenden'),
                  subtitle: const Text('Standortberechtigung wird bei Bedarf abgefragt'),
                  onTap: () async {
                    Navigator.of(sheetContext).pop();
                    try {
                      await _useCurrentLocationForDiscovery();
                    } on CurrentLocationException catch (error) {
                      if (!mounted) return;
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(error.message)),
                      );
                    }
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.edit_location_alt_outlined),
                  title: const Text('Neue Adresse eingeben'),
                  subtitle: const Text('Adresse wird validiert und für die Suche verwendet'),
                  onTap: () async {
                    Navigator.of(sheetContext).pop();
                    await _promptAndSaveManualAddress();
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> _searchTenants(String zipCode, DiscoveryMode mode) async {
    final normalizedZip = zipCode.trim();
    if (!_isValidZipCode(normalizedZip)) {
      setState(() {
        _discoveryMessage = 'Bitte eine 5-stellige PLZ eingeben.';
      });
      return;
    }

    setState(() {
      _activeZipCode = normalizedZip;
      _discoveryLoading = true;
      _discoveryMessage = 'Suche laeuft...';
    });

    try {
      final baseCandidates = <String>[
        _normalizedBaseUrl(_baseUrl),
        normalizeApiBaseUrl(defaultApiBaseUrl),
      ];
      final uniqueCandidates = <String>[];
      for (final entry in baseCandidates) {
        final normalized = _normalizedBaseUrl(entry);
        if (!uniqueCandidates.contains(normalized)) {
          uniqueCandidates.add(normalized);
        }
      }

      List<TenantDiscoveryTenant> rows = const [];
      String? resolvedBaseUrl;
      String? lastErrorMessage;

      for (final candidate in uniqueCandidates) {
        try {
          final street = _streetForDiscovery();
          final city = _cityForDiscovery();
          debugPrint(
            'CUSTOMER_APP_DISCOVERY_REQUEST {endpoint: $candidate/api/tenants/public/discovery, zipCode: $normalizedZip, street: ${street.isEmpty ? 'null' : street}, city: ${city.isEmpty ? 'null' : city}, latitude: ${_activeLatitude ?? 'null'}, longitude: ${_activeLongitude ?? 'null'}, mode: ${DiscoveryMode.all.name}}',
          );
          final candidateRows = await _api.discoverTenants(
            baseUrl: candidate,
            zipCode: normalizedZip,
            mode: DiscoveryMode.all,
            street: street.isEmpty ? null : street,
            city: city.isEmpty ? null : city,
            latitude: _activeLatitude,
            longitude: _activeLongitude,
            includeOutOfArea: true,
          );
          debugPrint(
            'CUSTOMER_APP_DISCOVERY_RESPONSE {endpoint: $candidate/api/tenants/public/discovery, tenants: ${candidateRows.length}, deliveryAvailableCount: ${candidateRows.where((entry) => entry.deliveryAvailable).length}, pickupAvailableCount: ${candidateRows.where((entry) => entry.pickupAvailable).length}}',
          );

          if (resolvedBaseUrl == null) {
            rows = candidateRows;
            resolvedBaseUrl = candidate;
          }

          if (candidateRows.isNotEmpty) {
            rows = candidateRows;
            resolvedBaseUrl = candidate;
            break;
          }
        } on ApiException catch (error) {
          lastErrorMessage = error.message;
        }
      }

      if (resolvedBaseUrl == null) {
        throw ApiException(lastErrorMessage ?? 'Filialsuche konnte nicht geladen werden.');
      }

      final nextBaseUrl = resolvedBaseUrl;
      final availableForMode = rows.where((entry) {
        if (!entry.orderingEnabled) {
          return false;
        }
        if (mode == DiscoveryMode.delivery) {
          return entry.deliveryAvailable;
        }
        if (mode == DiscoveryMode.pickup) {
          return entry.pickupAvailable;
        }
        return entry.deliveryAvailable || entry.pickupAvailable;
      }).length;

      final coreMessage = rows.isEmpty
          ? 'Keine freigegebenen Filialen für diese PLZ gefunden.'
          : '${rows.length} freigegebene Filialen gefunden, davon $availableForMode für ${mode == DiscoveryMode.delivery ? 'Lieferung' : mode == DiscoveryMode.pickup ? 'Abholung' : 'Bestellung'}.';
      final resolvedMessage = coreMessage;

      setState(() {
        _baseUrl = nextBaseUrl;
        _tenantResults = rows;
        _discoveryMessage = resolvedMessage;

        if (_selectedTenant != null &&
            !rows.any((entry) => entry.tenantId == _selectedTenant!.tenantId)) {
          _selectedTenant = null;
          _catalogProducts = const [];
          _selectedCatalog = null;
          _catalogMessage = 'Wähle eine Filiale aus, um Produkte zu sehen.';
          _currentIndex = 0;
          _cart.clear();
          _checkoutBarCollapsed = false;
        }
      });
      for (final tenant in rows) {
        debugPrint(
          'CUSTOMER_ORDER_INTAKE_STATUS {tenantId: ${tenant.tenantId}, branchId: ${tenant.tenantId}, backendStatus: ${tenant.orderIntake.enabled}, paused: ${tenant.orderIntake.paused}, source: discovery}',
        );
      }
    } on ApiException catch (error) {
      setState(() {
        _tenantResults = const [];
        _discoveryMessage = error.message;
      });
    } finally {
      if (mounted) {
        setState(() {
          _discoveryLoading = false;
        });
      }
    }
  }

  void _startTenantStatusSyncTicker() {
    _tenantStatusSyncTimer?.cancel();
    _tenantStatusSyncTimer = Timer.periodic(const Duration(seconds: 30), (_) {
      if (!mounted || _discoveryLoading || _activeZipCode.trim().isEmpty) {
        return;
      }
      unawaited(_refreshTenantStatuses());
    });
  }

  Future<void> _refreshTenantStatuses() async {
    try {
      final rows = await _api.discoverTenants(
        baseUrl: _baseUrl,
        zipCode: _activeZipCode,
        mode: DiscoveryMode.all,
        street: _streetForDiscovery().isEmpty ? null : _streetForDiscovery(),
        city: _cityForDiscovery().isEmpty ? null : _cityForDiscovery(),
        latitude: _activeLatitude,
        longitude: _activeLongitude,
        includeOutOfArea: true,
      );
      if (!mounted) {
        return;
      }
      setState(() {
        _tenantResults = rows;
        if (_selectedTenant != null) {
          for (final tenant in rows) {
            if (tenant.tenantId == _selectedTenant!.tenantId) {
              _selectedTenant = tenant;
              break;
            }
          }
        }
      });
    } catch (_) {
      // Silent polling failure to avoid noisy UX.
    }
  }

  Future<void> _selectUnavailableTenant(TenantDiscoveryTenant tenant) async {
    final proceed = await _showOrderIntakePausedDialog(tenant);
    if (proceed != true) {
      return;
    }
    await _selectTenant(tenant);
  }

  Future<bool?> _showOrderIntakePausedDialog(TenantDiscoveryTenant tenant) {
    final defaultMessage =
        'Dieses Lokal nimmt aktuell aufgrund hoher Auslastung keine neuen Online-Bestellungen an. Du kannst dir die Speisekarte ansehen, aber eine Bestellung ist derzeit eventuell nicht möglich.';
    final pauseReason = tenant.orderIntake.reason?.trim();
    final message = (pauseReason != null && pauseReason.isNotEmpty)
        ? 'Dieses Lokal nimmt aktuell keine neuen Online-Bestellungen an.\n\nGrund: $pauseReason\n\nDu kannst die Speisekarte ansehen, aber derzeit keine Bestellung abschicken.'
        : (tenant.orderIntake.customerMessage?.trim().isNotEmpty == true
            ? tenant.orderIntake.customerMessage!.trim()
            : defaultMessage);
    return showDialog<bool>(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: const Text('Bestellannahme aktuell pausiert'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(dialogContext).pop(false),
              child: const Text('OK'),
            ),
            FilledButton(
              onPressed: () => Navigator.of(dialogContext).pop(true),
              child: const Text('Speisekarte trotzdem ansehen'),
            ),
          ],
        );
      },
    );
  }

  Future<void> _selectTenant(TenantDiscoveryTenant tenant) async {
    debugPrint(
      'CUSTOMER_ORDER_INTAKE_STATUS {tenantId: ${tenant.tenantId}, branchId: ${tenant.tenantId}, backendStatus: ${tenant.orderIntake.enabled}, paused: ${tenant.orderIntake.paused}, source: selected-tenant}',
    );
    setState(() {
      _selectedTenant = tenant;
      _currentIndex = 1;
      _catalogProducts = const [];
      _selectedCatalog = null;
      _catalogLoading = true;
      _catalogMessage = 'Produkte werden geladen...';
      _cart.clear();
      _checkoutBarCollapsed = false;
    });
    _cancelCheckoutBarAutoCollapse();
    _stopOrdersSyncTicker();

    try {
      final catalog = await _api.fetchTenantCatalog(
        baseUrl: _baseUrl,
        tenantId: tenant.tenantId,
      );

      setState(() {
        _selectedCatalog = catalog;
        _catalogProducts = catalog.products;
        _catalogMessage = catalog.products.isEmpty
            ? 'Keine Produkte für diese Filiale freigegeben.'
            : '${catalog.products.length} Produkte geladen.';
      });
    } on ApiException catch (error) {
      setState(() {
        _selectedCatalog = null;
        _catalogProducts = const [];
        _catalogMessage = error.message;
      });
    } finally {
      if (mounted) {
        setState(() {
          _catalogLoading = false;
        });
      }
    }
  }

  void _applyBaseUrl(String value) {
    _stopOrdersSyncTicker();
    setState(() {
      _baseUrl = _normalizedBaseUrl(value);
      _selectedTenant = null;
      _tenantResults = const [];
      _catalogProducts = const [];
      _selectedCatalog = null;
      _cart.clear();
      _checkoutBarCollapsed = false;
      _submittedOrders.clear();
      _discoveryMessage = 'API-URL gespeichert. Bitte neue Suche starten.';
      _catalogMessage = 'Wähle eine Filiale aus, um Produkte zu sehen.';
      _currentIndex = 0;
    });
  }

  Future<void> _checkForCustomerAppUpdate({bool silentWhenCurrent = false}) async {
    setState(() {
      _customerUpdateBusy = true;
      if (!silentWhenCurrent) {
        _customerUpdateInfo = 'Prüfe Update...';
      }
    });

    try {
      final result = await _appUpdateService.checkForUpdate(
        baseUrl: _baseUrl,
        expectedFlavor: MobileAppFlavor.customer,
      );
      if (!result.updateAvailable) {
        setState(() {
          if (!silentWhenCurrent) {
            _customerUpdateInfo =
                'App ist aktuell (${result.currentVersion}+${result.currentBuildNumber}).';
          }
        });
        return;
      }

      final mode = result.forceUpdate ? 'Pflichtupdate' : 'Optionales Update';
      setState(() {
        _customerUpdateInfo =
            '$mode verfügbar: ${result.manifest.latestVersion}+${result.manifest.buildNumber}';
      });
      if (mounted) {
        await _showCustomerUpdateDialog(result);
      }
    } on ApiException catch (error) {
      setState(() {
        _customerUpdateInfo = 'Update-Check fehlgeschlagen: ${error.message}';
      });
    } catch (error) {
      setState(() {
        _customerUpdateInfo = 'Update-Check fehlgeschlagen: $error';
      });
    } finally {
      if (mounted) {
        setState(() {
          _customerUpdateBusy = false;
        });
      }
    }
  }

  Future<void> _showCustomerUpdateDialog(UpdateCheckResult result) async {
    final manifest = result.manifest;
    final installNow = await showDialog<bool>(
      context: context,
      barrierDismissible: !result.forceUpdate,
      builder: (context) => AlertDialog(
        title: Text(result.forceUpdate ? 'Pflichtupdate verfügbar' : 'Update verfügbar'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Neue Version: ${manifest.latestVersion}+${manifest.buildNumber}'),
            const SizedBox(height: 8),
            Text(_appUpdateService.formatReleaseNotes(manifest.releaseNotes)),
          ],
        ),
        actions: [
          if (!result.forceUpdate)
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: const Text('Später'),
            ),
          FilledButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('Jetzt aktualisieren'),
          ),
        ],
      ),
    );

    if (installNow != true) {
      return;
    }

    final apkUri = Uri.tryParse(manifest.apkUrl);
    if (apkUri == null) {
      setState(() {
        _customerUpdateInfo = 'Update-Link ist ungültig.';
      });
      return;
    }

    try {
      final apkFile = await _appUpdateService.downloadAndVerifyApk(
        apkUri: apkUri,
        sha256Hex: manifest.sha256,
      );
      await _appUpdateService.startApkInstallation(apkFile);
      if (!mounted) {
        return;
      }
      setState(() {
        _customerUpdateInfo = 'Installationsdialog wurde geöffnet.';
      });
    } on ApiException catch (error) {
      if (!mounted) {
        return;
      }
      setState(() {
        _customerUpdateInfo = 'Installation fehlgeschlagen: ${error.message}';
      });
    } catch (error) {
      if (!mounted) {
        return;
      }
      setState(() {
        _customerUpdateInfo = 'Installation fehlgeschlagen: $error';
      });
    }
  }

  void _toggleFavorite(String tenantId) {
    setState(() {
      if (_favoriteTenantIds.contains(tenantId)) {
        _favoriteTenantIds.remove(tenantId);
      } else {
        _favoriteTenantIds.add(tenantId);
      }
    });
  }

  Future<void> _rateOrder(String orderId, int stars) async {
    final index = _submittedOrders.indexWhere((entry) => entry.order.id == orderId);
    if (index < 0) {
      return;
    }

    if (_submittedOrders[index].rating != null) {
      if (!mounted) {
        return;
      }
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Diese Bestellung wurde bereits bewertet.')),
      );
      return;
    }

    try {
      await _api.submitOrderRating(
        baseUrl: _baseUrl,
        orderId: orderId,
        stars: stars,
      );

      if (!mounted) {
        return;
      }

      setState(() {
        _submittedOrders[index] = _submittedOrders[index].copyWith(rating: stars);
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Bewertung mit $stars Stern(en) gespeichert.')),
      );
    } on ApiException catch (error) {
      if (!mounted) {
        return;
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(error.message)),
      );
    }
  }

  void _addToCart(
    TenantCatalogProduct product,
    List<TenantCatalogModifier> selectedModifiers,
  ) {
    setState(() {
      _checkoutBarCollapsed = false;
      final lineId = _cartLineId(product.id, selectedModifiers);
      final existing = _cart[lineId];
      if (existing != null) {
        _cart[lineId] = existing.copyWith(quantity: existing.quantity + 1);
      } else {
        _cart[lineId] = _CartLine(
          id: lineId,
          product: product,
          selectedModifiers: selectedModifiers,
          quantity: 1,
        );
      }
    });
    _scheduleCheckoutBarAutoCollapse();
  }

  String _buildDriverMapImageUrl(
    DriverLocationPoint location, {
    int width = 640,
    int height = 320,
    int zoom = 15,
  }) {
    final safeWidth = width.clamp(240, 640);
    final safeHeight = height.clamp(180, 640);
    return Uri.https('maps.googleapis.com', '/maps/api/staticmap', {
      'center':
          '${location.latitude.toStringAsFixed(6)},${location.longitude.toStringAsFixed(6)}',
      'zoom': '$zoom',
      'size': '${safeWidth}x${safeHeight}',
      'maptype': 'roadmap',
      'markers':
          'color:red|label:F|${location.latitude.toStringAsFixed(6)},${location.longitude.toStringAsFixed(6)}',
      if (_googleMapsStaticApiKey.isNotEmpty) 'key': _googleMapsStaticApiKey,
    }).toString();
  }

  String _buildDriverMapFallbackImageUrl(
    DriverLocationPoint location, {
    int width = 640,
    int height = 320,
    int zoom = 15,
  }) {
    final safeWidth = width.clamp(240, 1280);
    final safeHeight = height.clamp(180, 1280);
    return Uri.https('staticmap.openstreetmap.de', '/staticmap.php', {
      'center':
          '${location.latitude.toStringAsFixed(6)},${location.longitude.toStringAsFixed(6)}',
      'zoom': '$zoom',
      'size': '${safeWidth}x${safeHeight}',
      'markers':
          '${location.latitude.toStringAsFixed(6)},${location.longitude.toStringAsFixed(6)},red-pushpin',
    }).toString();
  }

  String _mimeTypeForPickedImage(PlatformFile file) {
    final extension = (file.extension ?? '').toLowerCase().trim();
    switch (extension) {
      case 'jpg':
      case 'jpeg':
        return 'image/jpeg';
      case 'webp':
        return 'image/webp';
      case 'gif':
        return 'image/gif';
      case 'bmp':
        return 'image/bmp';
      case 'svg':
      case 'svgz':
        return 'image/svg+xml';
      default:
        return 'image/png';
    }
  }

  Future<String?> _pickComplaintImageDataUrl() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: false,
      withData: true,
    );
    if (result == null || result.files.isEmpty) {
      return null;
    }

    final file = result.files.first;
    final Uint8List? bytes = file.bytes;
    if (bytes == null || bytes.isEmpty) {
      return null;
    }

    final mimeType = _mimeTypeForPickedImage(file);
    final encoded = base64Encode(bytes);
    return 'data:$mimeType;base64,$encoded';
  }

  Future<void> _openComplaintDialog(PublicOrderSummary order) async {
    final token = _appAuthToken;
    if (token == null || token.trim().isEmpty) {
      if (!mounted) {
        return;
      }
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Bitte erst im Profil einloggen.')),
      );
      return;
    }

    final textController = TextEditingController();
    final imageDataUrls = <String>[];
    var submitting = false;
    var pickingImage = false;
    String? inlineError;

    final submitted = await showDialog<bool>(
      context: context,
      barrierDismissible: !submitting,
      builder: (dialogContext) {
        return StatefulBuilder(
          builder: (context, setDialogState) {
            return AlertDialog(
              title: const Text('Reklamation melden'),
              content: SizedBox(
                width: 520,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Beschreibe bitte kurz das Problem. Optional kannst du Bilder anhängen.',
                      style: TextStyle(fontSize: 13, color: Color(0xFF52525B)),
                    ),
                    const SizedBox(height: 12),
                    TextField(
                      controller: textController,
                      maxLines: 4,
                      maxLength: 2000,
                      decoration: const InputDecoration(
                        labelText: 'Reklamationstext',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: [
                        OutlinedButton.icon(
                          onPressed: submitting || pickingImage
                              ? null
                              : () async {
                                  setDialogState(() {
                                    pickingImage = true;
                                    inlineError = null;
                                  });
                                  try {
                                    final imageDataUrl =
                                        await _pickComplaintImageDataUrl();
                                    if (!context.mounted) {
                                      return;
                                    }
                                    if (imageDataUrl != null) {
                                      setDialogState(() {
                                        if (imageDataUrls.length < 5) {
                                          imageDataUrls.add(imageDataUrl);
                                        } else {
                                          inlineError =
                                              'Maximal 5 Bilder pro Reklamation.';
                                        }
                                      });
                                    }
                                  } finally {
                                    if (context.mounted) {
                                      setDialogState(() {
                                        pickingImage = false;
                                      });
                                    }
                                  }
                                },
                          icon: const Icon(Icons.image_outlined),
                          label: Text(
                            pickingImage ? 'Lädt...' : 'Bild hinzufügen',
                          ),
                        ),
                        if (imageDataUrls.isNotEmpty)
                          Text(
                            '${imageDataUrls.length} Bild(er) ausgewählt',
                            style: const TextStyle(
                              fontSize: 12,
                              color: Color(0xFF52525B),
                            ),
                          ),
                      ],
                    ),
                    if (imageDataUrls.isNotEmpty) ...[
                      const SizedBox(height: 8),
                      SizedBox(
                        height: 78,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: imageDataUrls.length,
                          separatorBuilder: (_, __) => const SizedBox(width: 8),
                          itemBuilder: (context, index) {
                            final image = imageDataUrls[index];
                            return Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.memory(
                                    base64Decode(image.split(',').last),
                                    width: 74,
                                    height: 74,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Positioned(
                                  right: 0,
                                  top: 0,
                                  child: InkWell(
                                    onTap: submitting
                                        ? null
                                        : () {
                                            setDialogState(() {
                                              imageDataUrls.removeAt(index);
                                            });
                                          },
                                    child: Container(
                                      padding: const EdgeInsets.all(2),
                                      decoration: const BoxDecoration(
                                        color: Colors.black54,
                                        shape: BoxShape.circle,
                                      ),
                                      child: const Icon(
                                        Icons.close,
                                        size: 14,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ],
                    if (inlineError != null) ...[
                      const SizedBox(height: 8),
                      Text(
                        inlineError!,
                        style: const TextStyle(
                          color: Color(0xFFB91C1C),
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
              actions: [
                TextButton(
                  onPressed: submitting
                      ? null
                      : () {
                          Navigator.of(dialogContext).pop(false);
                        },
                  child: const Text('Abbrechen'),
                ),
                FilledButton(
                  onPressed: submitting
                      ? null
                      : () async {
                          final message = textController.text.trim();
                          if (message.isEmpty) {
                            setDialogState(() {
                              inlineError = 'Bitte einen Text eingeben.';
                            });
                            return;
                          }
                          setDialogState(() {
                            submitting = true;
                            inlineError = null;
                          });
                          try {
                            await _api.submitOrderComplaint(
                              baseUrl: _baseUrl,
                              orderId: order.id,
                              appAuthToken: token,
                              message: message,
                              images: imageDataUrls,
                            );
                            if (!dialogContext.mounted) {
                              return;
                            }
                            Navigator.of(dialogContext).pop(true);
                          } on ApiException catch (error) {
                            if (!dialogContext.mounted) {
                              return;
                            }
                            setDialogState(() {
                              inlineError = error.message;
                              submitting = false;
                            });
                          }
                        },
                  child: Text(submitting ? 'Wird gesendet...' : 'Reklamation senden'),
                ),
              ],
            );
          },
        );
      },
    );

    textController.dispose();

    if (submitted == true) {
      if (!mounted) {
        return;
      }
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Reklamation erfolgreich gesendet.')),
      );
      await _syncSubmittedOrdersFromServer(force: true);
    }
  }

  Future<void> _openOrderDetails(PublicOrderSummary order) async {
    if (!mounted) {
      return;
    }

    await showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      showDragHandle: true,
      builder: (sheetContext) => _CustomerOrderTrackingSheet(
        initialOrder: order,
        api: _api,
        baseUrl: _baseUrl,
        appAuthToken: _appAuthToken,
        tenantId: _selectedTenant?.tenantId,
        onReorder: (entry) async {
          Navigator.of(sheetContext).pop();
          await _reorderFromOrder(entry);
        },
        onComplaint: (entry) async {
          Navigator.of(sheetContext).pop();
          await _openComplaintDialog(entry);
        },
      ),
    );
  }

  Future<void> _reorderFromOrder(PublicOrderSummary order) async {
    final tenant = _selectedTenant;
    if (tenant == null || tenant.tenantId != order.tenantId) {
      if (!mounted) {
        return;
      }
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
      content: Text('Bitte zuerst die passende Filiale auswählen.'),
        ),
      );
      return;
    }

    TenantCatalog catalog;
    try {
      catalog = await _api.fetchTenantCatalog(
        baseUrl: _baseUrl,
        tenantId: tenant.tenantId,
      );
    } on ApiException catch (error) {
      if (!mounted) {
        return;
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(error.message)),
      );
      return;
    }

    final productsById = <String, TenantCatalogProduct>{
      for (final product in catalog.products) product.id: product,
    };
    final productsByName = <String, TenantCatalogProduct>{
      for (final product in catalog.products) _normalizedProductKey(product.name): product,
    };

    final unavailableItems = <String>[];
    final repricedItems = <String>[];
    final nextCart = <String, _CartLine>{};

    for (final item in order.items) {
      if (item.quantity <= 0) {
        continue;
      }

      TenantCatalogProduct? product;
      if (item.productId != null) {
        product = productsById[item.productId!];
      }
      product ??= productsByName[_normalizedProductKey(item.productName)];

      if (product == null) {
        unavailableItems.add(item.productName);
        continue;
      }

      final modifierById = <String, TenantCatalogModifier>{
        for (final modifier in product.modifiers) modifier.id: modifier,
      };
      final selectedModifiers = _normalizeModifierSelection(
        item.modifierIds
            .map((modifierId) => modifierById[modifierId])
            .whereType<TenantCatalogModifier>(),
      );

      final unitPriceNow =
          product.price +
          product.depositAmount +
          selectedModifiers.fold<double>(0, (sum, entry) => sum + entry.priceDelta);
      if ((unitPriceNow - item.price).abs() >= 0.01) {
        repricedItems.add(
          '${product.name}: ${_formatCurrency(item.price)} -> ${_formatCurrency(unitPriceNow)}',
        );
      }

      final lineId = _cartLineId(product.id, selectedModifiers);
      final existing = nextCart[lineId];
      if (existing != null) {
        nextCart[lineId] = existing.copyWith(quantity: existing.quantity + item.quantity);
      } else {
        nextCart[lineId] = _CartLine(
          id: lineId,
          product: product,
          selectedModifiers: selectedModifiers,
          quantity: item.quantity,
        );
      }
    }

    if (nextCart.isEmpty) {
      if (!mounted) {
        return;
      }
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Keine Position konnte übernommen werden (nicht verfügbar).'),
        ),
      );
      return;
    }

    final lineCount = nextCart.values.fold<int>(0, (sum, line) => sum + line.quantity);

    setState(() {
      _selectedCatalog = catalog;
      _catalogProducts = catalog.products;
      _catalogMessage = catalog.products.isEmpty
          ? 'Keine Produkte für diese Filiale freigegeben.'
          : '${catalog.products.length} Produkte geladen.';
      _cart
        ..clear()
        ..addAll(nextCart);
      _checkoutBarCollapsed = false;
      _currentIndex = 1;
    });
    _scheduleCheckoutBarAutoCollapse();

    if (!mounted) {
      return;
    }

    final notes = <String>['$lineCount Artikel wurden in den Warenkorb übernommen.'];
    if (unavailableItems.isNotEmpty) {
      notes.add('Nicht verfügbar: ${unavailableItems.take(4).join(', ')}');
    }
    if (repricedItems.isNotEmpty) {
      notes.add('Preise wurden mit aktuellen Werten aktualisiert.');
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(notes.join('\n'))),
    );
  }

  Future<void> _openCheckoutFlow() async {
    if (_cart.isEmpty || _selectedTenant == null) {
      return;
    }
    await _refreshTenantStatuses();
    if (_appAuthToken == null || _appCustomer == null) {
      if (!mounted) {
        return;
      }
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Bitte zuerst im Profil einloggen, um eine Bestellung aufzugeben.'),
        ),
      );
      setState(() {
        _currentIndex = 3;
      });
      return;
    }

    final tenant = _selectedTenant!;
    final allowDelivery = tenant.deliveryAvailable;
    final allowPickup = tenant.pickupAvailable;

    if (!allowDelivery && !allowPickup) {
      if (!mounted) {
        return;
      }
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Für diese Filiale ist aktuell weder Lieferung noch Abholung verfügbar.'),
        ),
      );
      return;
    }

    final placedOrder = await Navigator.of(context).push<PublicOrderSummary>(
      MaterialPageRoute(
        builder: (_) => _CheckoutFlowPage(
          tenantId: tenant.tenantId,
          tenantName: tenant.tenantName,
          initialLines: _cart.values.toList(growable: false),
          allowDelivery: allowDelivery,
          allowPickup: allowPickup,
          minOrderValueAmount: _parseMoneyValue(tenant.minOrderValue),
          deliveryFeeAmount: _parseMoneyValue(tenant.deliveryFeeNote) ?? 0,
          serviceFeeSettings: tenant.serviceFee,
          initialAddress:
              (_appCustomer?.street?.trim().isNotEmpty ?? false)
                  ? _appCustomer!.street!.trim()
                  : _activeAddress,
          initialZipCode:
              (_appCustomer?.zipCode?.trim().isNotEmpty ?? false)
                  ? _appCustomer!.zipCode!.trim()
                  : _activeZipCode,
          initialCity: _appCustomer?.city?.trim(),
          appCustomerName: _appCustomer?.fullName,
          appCustomerPhone: _appCustomer?.phone,
          requireCustomerLogin: true,
          customerLoggedIn: _appAuthToken != null,
          orderIntakeEnabled: tenant.orderIntake.enabled,
          orderIntakeMessage: tenant.orderIntake.customerMessage,
          requiresDeliveryCoordinates: tenant.deliveryStrategy.toUpperCase() == 'POLYGON',
          initialDeliveryLatitude: _activeLatitude,
          initialDeliveryLongitude: _activeLongitude,
          submitOrder: _submitOrder,
          validateCoupon: _validateCouponForCheckout,
        ),
      ),
    );

    if (placedOrder == null || !mounted) {
      return;
    }

    setState(() {
      _submittedOrders.insert(
        0,
        _SubmittedOrder(
          tenantId: tenant.tenantId,
          tenantName: tenant.tenantName,
          order: placedOrder,
        ),
      );
      _cart.clear();
      _checkoutBarCollapsed = false;
    });
    _cancelCheckoutBarAutoCollapse();
    _setCurrentIndex(2);
  }

  Future<PublicOrderSummary> _submitOrder({
    required List<_CartLine> lines,
    required _CheckoutServiceType serviceType,
    required _CheckoutPaymentType paymentType,
    required String? customerName,
    required String? customerPhone,
    required String? deliveryAddress,
    required String? deliveryZipCode,
    required String? deliveryCity,
    double? deliveryLatitude,
    double? deliveryLongitude,
    double? tipAmount,
    String? couponCode,
  }) async {
    final tenant = _selectedTenant;
    if (tenant == null) {
      throw const ApiException('Keine Filiale ausgewählt.');
    }

    if (serviceType == _CheckoutServiceType.delivery && !tenant.deliveryAvailable) {
      throw const ApiException('Lieferung ist für diese Filiale aktuell nicht verfügbar.');
    }

    if (serviceType == _CheckoutServiceType.pickup && !tenant.pickupAvailable) {
      throw const ApiException('Abholung ist für diese Filiale aktuell nicht verfügbar.');
    }

    final orderItems = lines
        .where((line) => line.quantity > 0)
        .map(
          (line) => CreateOrderItem(
            productId: line.product.id,
            quantity: line.quantity,
            modifierIds: line.selectedModifierIds,
          ),
        )
        .toList(growable: false);

    if (orderItems.isEmpty) {
      throw const ApiException('Warenkorb ist leer.');
    }

    final subtotal = _subtotalForLines(lines);
    final minOrderValue = _parseMoneyValue(tenant.minOrderValue);

    if (_appAuthToken == null || _appCustomer == null) {
      throw const ApiException(
        'Bitte zuerst im Profil mit einem Kundenkonto einloggen.',
      );
    }

    if (serviceType == _CheckoutServiceType.delivery &&
        minOrderValue != null &&
        subtotal < minOrderValue) {
      throw ApiException(
        'Mindestbestellwert nicht erreicht. Aktuell ${_formatCurrency(subtotal)}, benötigt ${_formatCurrency(minOrderValue)}.',
      );
    }

    String? resolvedAddress;
    String? resolvedZipCode;
    String? resolvedCity;
    double? resolvedCustomerLatitude = deliveryLatitude ?? _activeLatitude;
    double? resolvedCustomerLongitude = deliveryLongitude ?? _activeLongitude;

    if (serviceType == _CheckoutServiceType.delivery) {
      resolvedAddress = deliveryAddress?.trim();
      resolvedZipCode = deliveryZipCode?.trim();
      resolvedCity = deliveryCity?.trim();

      if (!_isCompleteDeliveryAddress(
        address: resolvedAddress,
        zipCode: resolvedZipCode,
        city: resolvedCity,
      )) {
        throw const ApiException(
          'Für Lieferung bitte eine vollständige Adresse mit Straße, Hausnummer, PLZ und Ort eingeben.',
        );
      }

      if (resolvedCustomerLatitude == null || resolvedCustomerLongitude == null) {
        try {
          final location = await fetchCurrentLocation();
          resolvedCustomerLatitude = location.latitude;
          resolvedCustomerLongitude = location.longitude;
          await _persistDiscoveryAddress(
            address: _activeAddress,
            zipCode: _activeZipCode,
            latitude: location.latitude,
            longitude: location.longitude,
          );
        } catch (_) {
          // Leave values null; backend can geocode from address as fallback.
        }
      }
    }

    final paymentMethod = switch (paymentType) {
      _CheckoutPaymentType.cash => 'CASH',
      _CheckoutPaymentType.card => 'CARD',
      _CheckoutPaymentType.paypal => 'PAYPAL',
      _CheckoutPaymentType.klarna => 'KLARNA',
    };
    final autoPaid = paymentType != _CheckoutPaymentType.cash;

    return _api.createOrder(
      baseUrl: _baseUrl,
      tenantId: tenant.tenantId,
      items: orderItems,
      sourceChannel: serviceType == _CheckoutServiceType.delivery ? 'DELIVERY' : 'APP',
      paymentMethod: paymentMethod,
      markPaid: autoPaid,
      serviceType: serviceType == _CheckoutServiceType.delivery ? 'DELIVERY' : 'PICKUP',
      customerName: customerName ?? _appCustomer?.fullName ?? 'Gastkunde',
      customerPhone: customerPhone ?? _appCustomer?.phone,
      customerAddress: resolvedAddress,
      customerZipCode: resolvedZipCode,
      customerCity: resolvedCity,
      customerLat: resolvedCustomerLatitude,
      customerLng: resolvedCustomerLongitude,
      customerLatitude: resolvedCustomerLatitude,
      customerLongitude: resolvedCustomerLongitude,
      tipAmount: tipAmount,
      couponCode: couponCode,
      appAuthToken: _appAuthToken,
    );
  }

  Future<CouponValidationResult> _validateCouponForCheckout({
    required String code,
    required String orderType,
    required int subtotalCents,
    required int deliveryFeeCents,
  }) async {
    final tenant = _selectedTenant;
    if (tenant == null) {
      throw const ApiException('Keine Filiale ausgewählt.');
    }
    final customerOrdersCount = _submittedOrders.length;
    return _api.validateCoupon(
      baseUrl: _baseUrl,
      tenantId: tenant.tenantId,
      code: code,
      orderType: orderType,
      subtotalCents: subtotalCents,
      deliveryFeeCents: deliveryFeeCents,
      customerOrderCount: customerOrdersCount,
    );
  }

  Future<void> _syncSubmittedOrdersFromServer({bool force = false}) async {
    if (_ordersSyncInFlight) {
      return;
    }

    if (!force && _currentIndex != 2) {
      return;
    }

    _ordersSyncInFlight = true;
    if (mounted) {
      setState(() {});
    }

    try {
      final tenantId = _selectedTenant?.tenantId;
      final serverOrders = await _api.fetchOrders(
        baseUrl: _baseUrl,
        tenantId: tenantId,
        appAuthToken: _appAuthToken,
      );
      final notifications = <String>[];

      if (!mounted) {
        return;
      }

      setState(() {
        final previousById = <String, _SubmittedOrder>{
          for (final entry in _submittedOrders) entry.order.id: entry,
        };
        final merged = serverOrders
            .map((order) {
              final previous = previousById[order.id];
              if (previous != null && previous.order.status != order.status) {
                notifications.add(
                  'Bestellung #${_displayOrderNumber(order)}: ${_statusLabel(order.status)}',
                );
              }
              return _SubmittedOrder(
                tenantId: order.tenantId,
                tenantName:
                    order.tenantName ?? previous?.tenantName ?? 'Filiale',
                order: order,
                rating: previous?.rating,
              );
            })
            .toList(growable: true);

        merged.sort((a, b) {
          final left = a.order.createdAt?.millisecondsSinceEpoch ?? 0;
          final right = b.order.createdAt?.millisecondsSinceEpoch ?? 0;
          return right.compareTo(left);
        });

        _submittedOrders
          ..clear()
          ..addAll(merged);
      });

      if (notifications.isNotEmpty && mounted) {
        final preview = notifications.take(2).toList(growable: false);
        final suffix = notifications.length > 2 ? '\n+${notifications.length - 2} weitere' : '';
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            duration: const Duration(seconds: 3),
            content: Text('Status-Update:\n${preview.join('\n')}$suffix'),
          ),
        );
      }
    } on ApiException {
      // Intentionally silent during periodic sync to keep the UX calm.
    } finally {
      _ordersSyncInFlight = false;
      if (mounted) {
        setState(() {});
      }
    }
  }

  void _ensureOrdersSyncTicker() {
    _ordersSyncTimer ??= Timer.periodic(const Duration(seconds: 20), (_) {
      _syncSubmittedOrdersFromServer();
    });
  }

  void _stopOrdersSyncTicker() {
    _ordersSyncTimer?.cancel();
    _ordersSyncTimer = null;
  }

  void _setCurrentIndex(int index) {
    setState(() {
      _currentIndex = index;
    });

    if (index == 2) {
      _ensureOrdersSyncTicker();
      unawaited(_syncSubmittedOrdersFromServer(force: true));
      return;
    }

    if (index != 2) {
      _stopOrdersSyncTicker();
    }
  }

  @override
  Widget build(BuildContext context) {
    final labels = _labelsForLanguage(_languageCode);
    final cartMinOrderHint = _buildCartMinimumOrderHint();

    return Scaffold(
      appBar: AppBar(
        titleSpacing: 8,
        title: Align(
          alignment: Alignment.centerLeft,
          child: Image.asset(
            'assets/klarando_logo_wordmark.png',
            height: 34,
            fit: BoxFit.contain,
          ),
        ),
        actions: [
          IconButton(
            onPressed: _cart.isEmpty ? null : _openCheckoutFlow,
            icon: Badge.count(
              count: _cartItemsCount,
              isLabelVisible: _cartItemsCount > 0,
              child: const Icon(Icons.shopping_cart_outlined),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: IndexedStack(
            index: _currentIndex,
            children: [
              StartPage(
                loading: _discoveryLoading,
                message: _discoveryMessage,
                results: _tenantResults,
                selectedTenantId: _selectedTenant?.tenantId,
                userAddress: _activeAddress,
                activeZipCode: _activeZipCode,
                languageCode: _languageCode,
                favoriteTenantIds: _favoriteTenantIds,
                tenantRatings: _tenantRatings,
                onSearchByZip: _searchTenants,
                onEditAddress: _openAddressManager,
                onSelectTenant: _selectTenant,
                onSelectUnavailableTenant: _selectUnavailableTenant,
                onToggleFavorite: _toggleFavorite,
              ),
              OrderPage(
                tenant: _selectedTenant,
                catalog: _selectedCatalog,
                loading: _catalogLoading,
                message: _catalogMessage,
                products: _catalogProducts,
                onAddToCart: _addToCart,
              ),
              OrdersPage(
                hasCartItems: _cart.isNotEmpty,
                orders: _submittedOrders.map((entry) => entry.order).toList(growable: false),
                orderRatings: _orderRatings,
                onRateOrder: _rateOrder,
                onOpenOrder: _openOrderDetails,
              ),
              ProfilePage(
                baseUrl: _baseUrl,
                onApplyBaseUrl: _applyBaseUrl,
                appUpdateBusy: _customerUpdateBusy,
                appUpdateInfo: _customerUpdateInfo,
                onCheckAppUpdate: _checkForCustomerAppUpdate,
                languageCode: _languageCode,
                onLanguageChanged: (languageCode) async {
                  await widget.onLanguageChanged(languageCode);
                  if (!mounted) {
                    return;
                  }
                  setState(() {
                    _languageCode = _normalizedLanguageCode(languageCode);
                  });
                },
                appCustomer: _appCustomer,
                appAuthBusy: _appAuthBusy,
                onAppLogin: ({
                  required String email,
                  required String password,
                }) {
                  return _loginAppCustomer(email: email, password: password);
                },
                onAppRegister: ({
                  required String email,
                  required String fullName,
                  required String password,
                  String? phone,
                  required String street,
                  required String zipCode,
                  required String city,
                  bool marketingOptIn = false,
                  bool privacyAccepted = false,
                  bool termsAccepted = false,
                }) {
                  return _registerAppCustomer(
                    email: email,
                    fullName: fullName,
                    password: password,
                    phone: phone,
                    street: street,
                    zipCode: zipCode,
                    city: city,
                    marketingOptIn: marketingOptIn,
                    privacyAccepted: privacyAccepted,
                    termsAccepted: termsAccepted,
                  );
                },
                onAppSocialQuickstart: ({
                  required String provider,
                  required String email,
                  required String fullName,
                  String? phone,
                  required String street,
                  required String zipCode,
                  required String city,
                  bool marketingOptIn = false,
                  required bool privacyAccepted,
                  required bool termsAccepted,
                }) {
                  return _socialQuickstartAppCustomer(
                    provider: provider,
                    email: email,
                    fullName: fullName,
                    phone: phone,
                    street: street,
                    zipCode: zipCode,
                    city: city,
                    marketingOptIn: marketingOptIn,
                    privacyAccepted: privacyAccepted,
                    termsAccepted: termsAccepted,
                  );
                },
                onAppProfileUpdate: ({
                  required String fullName,
                  String? phone,
                  String? street,
                  String? zipCode,
                  String? city,
                  bool marketingOptIn = false,
                }) {
                  return _updateAppCustomerProfile(
                    fullName: fullName,
                    phone: phone,
                    street: street,
                    zipCode: zipCode,
                    city: city,
                    marketingOptIn: marketingOptIn,
                  );
                },
                onAppRequestDeletion: ({
                  String? note,
                }) {
                  return _requestAppCustomerDeletion(
                    note: note,
                  );
                },
                onAppLogout: _logoutAppCustomer,
                imprintUrl: _klarandoImpressumUrl,
                privacyUrl: _klarandoPrivacyUrl,
                termsUrl: _klarandoTermsUrl,
                supportEmail: _klarandoSupportEmail,
                accountDeletionEmail: _klarandoAccountDeletionEmail,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (cartMinOrderHint != null) cartMinOrderHint,
          if (_cart.isNotEmpty)
            Material(
              color: const Color(0xFFFF5A1F),
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 220),
                switchInCurve: Curves.easeOutCubic,
                switchOutCurve: Curves.easeOutCubic,
                child: _checkoutBarCollapsed
                    ? InkWell(
                        key: const ValueKey('checkout-bar-collapsed'),
                        onTap: () {
                          setState(() {
                            _checkoutBarCollapsed = false;
                          });
                          _openCheckoutFlow();
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          child: Row(
                            children: [
                              const Icon(Icons.shopping_cart_checkout, color: Colors.white),
                              const SizedBox(width: 10),
                              Text(
                                '$_cartItemsCount',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              const SizedBox(width: 8),
                              Text(
                                _formatCurrency(_cartTotal),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const Spacer(),
                              const Icon(Icons.expand_less_rounded, color: Colors.white),
                            ],
                          ),
                        ),
                      )
                    : InkWell(
                        key: const ValueKey('checkout-bar-expanded'),
                        onTap: _openCheckoutFlow,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                          child: Row(
                            children: [
                              Text(
                                '${_articleCountLabel(_cartItemsCount)} • ${_formatCurrency(_cartTotal)} • Zur Kasse',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const Spacer(),
                              const SizedBox(width: 4),
                              const Icon(Icons.chevron_right_rounded, color: Colors.white),
                            ],
                          ),
                        ),
                      ),
              ),
            ),
          NavigationBarTheme(
            data: NavigationBarThemeData(
              indicatorColor: const Color(0xFFFFE0D1),
              labelTextStyle: WidgetStateProperty.resolveWith((states) {
                final selected = states.contains(WidgetState.selected);
                return TextStyle(
                  fontWeight: selected ? FontWeight.w800 : FontWeight.w600,
                  color: selected ? const Color(0xFFD9480F) : const Color(0xFF6B7280),
                );
              }),
              iconTheme: WidgetStateProperty.resolveWith((states) {
                final selected = states.contains(WidgetState.selected);
                return IconThemeData(
                  color: selected ? const Color(0xFFD9480F) : const Color(0xFF6B7280),
                );
              }),
            ),
            child: NavigationBar(
              selectedIndex: _currentIndex,
              onDestinationSelected: _setCurrentIndex,
              destinations: [
                NavigationDestination(
                  icon: Icon(Icons.home_outlined),
                  selectedIcon: Icon(Icons.home),
                  label: labels.start,
                ),
                NavigationDestination(
                  icon: Icon(Icons.restaurant_menu_outlined),
                  selectedIcon: Icon(Icons.restaurant_menu),
                  label: labels.order,
                ),
                NavigationDestination(
                  icon: Icon(Icons.receipt_long_outlined),
                  selectedIcon: Icon(Icons.receipt_long),
                  label: labels.orders,
                ),
                NavigationDestination(
                  icon: Icon(Icons.person_outline),
                  selectedIcon: Icon(Icons.person),
                  label: labels.profile,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _LegalConsentPage extends StatefulWidget {
  const _LegalConsentPage({
    required this.onAccepted,
  });

  final Future<void> Function() onAccepted;

  @override
  State<_LegalConsentPage> createState() => _LegalConsentPageState();
}

class _LegalConsentPageState extends State<_LegalConsentPage> {
  bool _cookies = false;
  bool _agb = false;
  bool _privacy = false;
  bool _notices = false;
  bool _saving = false;

  bool get _allAccepted => _cookies && _agb && _privacy && _notices;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Rechtliche Hinweise')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  'assets/klarando_logo_wordmark.png',
                  width: 220,
                  height: 72,
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Vor der Nutzung musst du diese Punkte bestätigen.',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 8),
              const Text(
                'Standort wird nur für Lieferfunktionen genutzt. Push-Nachrichten und Social-Login sind optional.',
                style: TextStyle(fontSize: 13, color: Colors.black54),
              ),
              const SizedBox(height: 12),
              CheckboxListTile(
                value: _cookies,
                onChanged: (value) => setState(() => _cookies = value ?? false),
                title: const Text('Cookie-Richtlinien gelesen und akzeptiert'),
              ),
              CheckboxListTile(
                value: _agb,
                onChanged: (value) => setState(() => _agb = value ?? false),
                title: const Text('Allgemeine Geschäftsbedingungen akzeptiert'),
              ),
              CheckboxListTile(
                value: _privacy,
                onChanged: (value) => setState(() => _privacy = value ?? false),
                title: const Text('Datenschutzrichtlinien akzeptiert'),
              ),
              CheckboxListTile(
                value: _notices,
                onChanged: (value) => setState(() => _notices = value ?? false),
                title: const Text('Sonstige Hinweise zur Kenntnis genommen'),
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: !_allAccepted || _saving
                      ? null
                      : () async {
                          setState(() {
                            _saving = true;
                          });
                          await widget.onAccepted();
                          if (!mounted) {
                            return;
                          }
                          setState(() {
                            _saving = false;
                          });
                        },
                  child: Text(_saving ? 'Wird gespeichert...' : 'Fortfahren'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _AddressCapturePage extends StatefulWidget {
  const _AddressCapturePage({
    required this.initialLanguageCode,
    required this.onAddressSaved,
    required this.onCoordinatesSaved,
  });

  final String initialLanguageCode;
  final Future<void> Function(String address, String zipCode) onAddressSaved;
  final Future<void> Function(double latitude, double longitude) onCoordinatesSaved;

  @override
  State<_AddressCapturePage> createState() => _AddressCapturePageState();
}

class _AddressCapturePageState extends State<_AddressCapturePage> {
  final _addressController = TextEditingController();
  final _zipController = TextEditingController();
  bool _saving = false;
  bool _locationBusy = false;

  @override
  void dispose() {
    _addressController.dispose();
    _zipController.dispose();
    super.dispose();
  }

  Future<void> _saveAddress(String address, String zipCode) async {
    setState(() {
      _saving = true;
    });
    await widget.onAddressSaved(address, zipCode);
    if (!mounted) {
      return;
    }
    setState(() {
      _saving = false;
    });
  }

  Future<void> _fillAddressFromCurrentLocation() async {
    if (_saving || _locationBusy) {
      return;
    }

    setState(() {
      _locationBusy = true;
    });

    try {
      final location = await fetchCurrentLocation();
      if (!mounted) {
        return;
      }

      final resolvedAddress = (location.addressLine ?? '').trim();
      final resolvedZip = (location.postalCode ?? '').trim();
      final resolvedCity = (location.city ?? '').trim();

      if (resolvedAddress.isNotEmpty) {
        if (resolvedCity.isNotEmpty && !resolvedAddress.toLowerCase().contains(resolvedCity.toLowerCase())) {
          _addressController.text = '$resolvedAddress, $resolvedCity';
        } else {
          _addressController.text = resolvedAddress;
        }
      } else {
        _addressController.text =
            'Standort ${location.latitude.toStringAsFixed(5)}, ${location.longitude.toStringAsFixed(5)}';
      }

      if (_isValidZipCode(resolvedZip)) {
        _zipController.text = resolvedZip;
      }

      await widget.onCoordinatesSaved(location.latitude, location.longitude);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            _isValidZipCode(_zipController.text)
                ? 'Standort erfolgreich übernommen.'
                : 'Standort übernommen. Bitte PLZ prüfen oder eintragen.',
          ),
        ),
      );
    } on CurrentLocationException catch (error) {
      if (!mounted) {
        return;
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(error.message)),
      );
    } catch (_) {
      if (!mounted) {
        return;
      }
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Standort konnte nicht übernommen werden.'),
        ),
      );
    } finally {
      if (mounted) {
        setState(() {
          _locationBusy = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Adresse bestätigen')),
      body: SafeArea(
        child: ListView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          padding: EdgeInsets.fromLTRB(
            16,
            16,
            16,
            16 + MediaQuery.of(context).viewInsets.bottom,
          ),
          children: [
            Center(
              child: Image.asset(
                'assets/klarando_logo_wordmark.png',
                width: 260,
                height: 84,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Bitte gib deine Adresse und PLZ ein oder erlaube den Standortzugriff.',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _addressController,
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(
                labelText: 'Adresse',
                hintText: 'Straße, Hausnummer, Ort',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _zipController,
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.done,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(5),
              ],
              decoration: const InputDecoration(
                labelText: 'PLZ',
                hintText: '5-stellige PLZ',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: _saving || _locationBusy ? null : _fillAddressFromCurrentLocation,
                icon: _locationBusy
                    ? const SizedBox(
                        width: 16,
                        height: 16,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Icon(Icons.my_location),
                label: Text(_locationBusy ? 'Standort wird ermittelt...' : 'Standort erlauben'),
              ),
            ),
            const SizedBox(height: 4),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: _saving || _locationBusy
                    ? null
                    : () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Du kannst später jederzeit den Standort freigeben.'),
                          ),
                        );
                      },
                child: const Text('Später'),
              ),
            ),
            const SizedBox(height: 18),
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: _saving
                    ? null
                    : () async {
                        final address = _addressController.text.trim();
                        final zipCode = _zipController.text.trim();
                        if (address.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Bitte zuerst eine Adresse eingeben.'),
                            ),
                          );
                          return;
                        }
                        if (!_isValidZipCode(zipCode)) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Bitte eine gültige 5-stellige PLZ eingeben.'),
                            ),
                          );
                          return;
                        }
                        await _saveAddress(address, zipCode);
                      },
                child: Text(_saving ? 'Wird gespeichert...' : 'Zur Startseite'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
class _CheckoutFlowPage extends StatefulWidget {
  const _CheckoutFlowPage({
    required this.tenantId,
    required this.tenantName,
    required this.initialLines,
    required this.allowDelivery,
    required this.allowPickup,
    required this.minOrderValueAmount,
    required this.deliveryFeeAmount,
    required this.serviceFeeSettings,
    required this.initialAddress,
    required this.initialZipCode,
    required this.initialCity,
    required this.appCustomerName,
    required this.appCustomerPhone,
    required this.requireCustomerLogin,
    required this.customerLoggedIn,
    required this.orderIntakeEnabled,
    required this.orderIntakeMessage,
    required this.requiresDeliveryCoordinates,
    required this.initialDeliveryLatitude,
    required this.initialDeliveryLongitude,
    required this.submitOrder,
    required this.validateCoupon,
  });

  final String tenantId;
  final String tenantName;
  final List<_CartLine> initialLines;
  final bool allowDelivery;
  final bool allowPickup;
  final double? minOrderValueAmount;
  final double deliveryFeeAmount;
  final TenantServiceFeeSettings serviceFeeSettings;
  final String initialAddress;
  final String initialZipCode;
  final String? initialCity;
  final String? appCustomerName;
  final String? appCustomerPhone;
  final bool requireCustomerLogin;
  final bool customerLoggedIn;
  final bool orderIntakeEnabled;
  final String? orderIntakeMessage;
  final bool requiresDeliveryCoordinates;
  final double? initialDeliveryLatitude;
  final double? initialDeliveryLongitude;
  final Future<PublicOrderSummary> Function({
    required List<_CartLine> lines,
    required _CheckoutServiceType serviceType,
    required _CheckoutPaymentType paymentType,
    required String? customerName,
    required String? customerPhone,
    required String? deliveryAddress,
    required String? deliveryZipCode,
    required String? deliveryCity,
    double? deliveryLatitude,
    double? deliveryLongitude,
    double? tipAmount,
    String? couponCode,
  })
  submitOrder;
  final Future<CouponValidationResult> Function({
    required String code,
    required String orderType,
    required int subtotalCents,
    required int deliveryFeeCents,
  })
  validateCoupon;

  @override
  State<_CheckoutFlowPage> createState() => _CheckoutFlowPageState();
}

class _CheckoutFlowPageState extends State<_CheckoutFlowPage> {
  late List<_CartLine> _lines = widget.initialLines
      .map(
        (entry) => entry.copyWith(
          selectedModifiers: List<TenantCatalogModifier>.from(entry.selectedModifiers),
        ),
      )
      .toList(growable: true);

  int _step = 0;
  bool _isSubmitting = false;
  String? _errorMessage;
  PublicOrderSummary? _createdOrder;
  late _CheckoutServiceType _serviceType;
  _CheckoutPaymentType _paymentType = _CheckoutPaymentType.cash;
  late final TextEditingController _customerNameController;
  late final TextEditingController _customerPhoneController;
  late final TextEditingController _deliveryAddressController;
  late final TextEditingController _deliveryZipController;
  late final TextEditingController _deliveryCityController;
  final TextEditingController _couponCodeController = TextEditingController();
  final TextEditingController _customTipController = TextEditingController();
  double? _checkoutLatitude;
  double? _checkoutLongitude;
  final TextEditingController _secondaryAddressController = TextEditingController();
  final TextEditingController _secondaryZipController = TextEditingController();
  final TextEditingController _secondaryCityController = TextEditingController();
  double _tipAmount = 0;
  double _couponDiscountAmount = 0;
  String? _appliedCouponCode;
  bool _couponValidationBusy = false;
  String? _couponFeedback;
  bool _couponIsError = false;

  int get _itemsCount => _lines.fold<int>(0, (sum, line) => sum + line.quantity);

  double get _subtotal => _lines.fold<double>(0, (sum, line) => sum + line.lineTotal);
  double get _deliveryFee =>
      _serviceType == _CheckoutServiceType.delivery ? widget.deliveryFeeAmount : 0;
  double get _serviceFee {
    if (!widget.serviceFeeSettings.enabled) {
      return 0;
    }
    if (widget.serviceFeeSettings.mode == 'PERCENT') {
      final percent = widget.serviceFeeSettings.percent ?? 0;
      return double.parse((_subtotal * percent / 100).toStringAsFixed(2));
    }
    return _parseMoneyValue(widget.serviceFeeSettings.fixedAmount) ?? 0;
  }

  double get _discount => _couponDiscountAmount;
  double get _total => (_subtotal + _deliveryFee + _serviceFee + _tipAmount - _discount).clamp(0, double.infinity);
  bool get _containsAlcohol {
    const keywords = [
      'bier',
      'wein',
      'vodka',
      'whisky',
      'gin',
      'rum',
      'sekt',
      'aperol',
      'prosecco',
      'alkohol',
    ];
    for (final line in _lines) {
      final name = line.product.name.toLowerCase();
      if (keywords.any((entry) => name.contains(entry))) {
        return true;
      }
    }
    return false;
  }

  String _formatCurrency(double value) {
    final normalized = value.toStringAsFixed(2).replaceAll('.', ',');
    return '$normalized €';
  }

  double? _parseMoneyValue(String? raw) {
    if (raw == null) {
      return null;
    }
    final normalized = raw.trim().replaceAll(',', '.');
    if (normalized.isEmpty) {
      return null;
    }
    final match = RegExp(r'-?\d+(?:\.\d+)?').firstMatch(normalized);
    if (match == null) {
      return null;
    }
    final parsed = double.tryParse(match.group(0)!);
    if (parsed == null || !parsed.isFinite) {
      return null;
    }
    return double.parse(parsed.toStringAsFixed(2));
  }

  @override
  void initState() {
    super.initState();
    _serviceType =
        widget.allowDelivery ? _CheckoutServiceType.delivery : _CheckoutServiceType.pickup;
    _customerNameController = TextEditingController(text: widget.appCustomerName ?? '');
    _customerPhoneController = TextEditingController(text: widget.appCustomerPhone ?? '');
    _deliveryAddressController = TextEditingController(text: widget.initialAddress.trim());
    _deliveryZipController = TextEditingController(text: widget.initialZipCode.trim());
    _deliveryCityController = TextEditingController(text: widget.initialCity?.trim() ?? '');
    _checkoutLatitude = widget.initialDeliveryLatitude;
    _checkoutLongitude = widget.initialDeliveryLongitude;
    if (widget.requiresDeliveryCoordinates &&
        widget.allowDelivery &&
        (_checkoutLatitude == null || _checkoutLongitude == null)) {
      unawaited(_resolveDeliveryCoordinatesForCheckout());
    }
  }

  Future<void> _resolveDeliveryCoordinatesForCheckout() async {
    try {
      final location = await fetchCurrentLocation();
      if (!mounted) {
        return;
      }
      setState(() {
        _checkoutLatitude = location.latitude;
        _checkoutLongitude = location.longitude;
      });
    } catch (_) {
      // Keep the state as-is; checkout shows an explicit hint when coordinates are missing.
    }
  }

  @override
  void dispose() {
    _customerNameController.dispose();
    _customerPhoneController.dispose();
    _deliveryAddressController.dispose();
    _deliveryZipController.dispose();
    _deliveryCityController.dispose();
    _couponCodeController.dispose();
    _customTipController.dispose();
    _secondaryAddressController.dispose();
    _secondaryZipController.dispose();
    _secondaryCityController.dispose();
    super.dispose();
  }

  bool get _deliveryAddressReady {
    if (_serviceType != _CheckoutServiceType.delivery) {
      return true;
    }

    final address = _deliveryAddressController.text.trim();
    final zipCode = _deliveryZipController.text.trim();
    final city = _deliveryCityController.text.trim();

    return _isCompleteDeliveryAddress(address: address, zipCode: zipCode, city: city);
  }

  bool get _hasDeliveryCoordinates => _checkoutLatitude != null && _checkoutLongitude != null;

  void _changeQuantity(String lineId, int delta) {
    setState(() {
      final next = <_CartLine>[];
      for (final line in _lines) {
        if (line.id != lineId) {
          next.add(line);
          continue;
        }
        final nextQuantity = line.quantity + delta;
        if (nextQuantity > 0) {
          next.add(line.copyWith(quantity: nextQuantity));
        }
      }
      _lines = next;
    });
  }

  bool _tryRemoveUnavailableProductsFromOrderError(ApiException error) {
    final body = error.responseBody;
    if (body == null) {
      return false;
    }

    final code = body['code'] is String ? (body['code'] as String).trim().toUpperCase() : '';
    final missingRaw = body['missingProductIds'];
    if (code != 'PRODUCT_NOT_FOUND' || missingRaw is! List) {
      return false;
    }

    final missingIds = missingRaw
        .map((entry) => entry is String ? entry.trim() : '')
        .where((entry) => entry.isNotEmpty)
        .toSet();
    if (missingIds.isEmpty) {
      return false;
    }

    final originalCount = _lines.length;
    final nextLines = _lines.where((line) => !missingIds.contains(line.product.id)).toList(growable: false);
    if (nextLines.length == originalCount) {
      return false;
    }

    setState(() {
      _lines = nextLines;
      _errorMessage = 'Ein Produkt ist nicht mehr verfügbar und wurde aus dem Warenkorb entfernt.';
    });
    return true;
  }

  void _setTipAmount(double amount) {
    setState(() {
      _tipAmount = amount < 0 ? 0 : double.parse(amount.toStringAsFixed(2));
      _customTipController.text = _tipAmount > 0 ? _tipAmount.toStringAsFixed(2) : '';
    });
  }

  Future<void> _applyCouponCode() async {
    final code = _couponCodeController.text.trim();
    if (code.isEmpty) {
      setState(() {
        _couponIsError = true;
        _couponFeedback = 'Bitte einen Rabattcode eingeben.';
      });
      return;
    }
    setState(() {
      _couponValidationBusy = true;
      _couponFeedback = null;
      _couponIsError = false;
    });
    try {
      final result = await widget.validateCoupon(
        code: code,
        orderType: _serviceType == _CheckoutServiceType.delivery ? 'DELIVERY' : 'PICKUP',
        subtotalCents: (_subtotal * 100).round(),
        deliveryFeeCents: (_deliveryFee * 100).round(),
      );
      if (!mounted) {
        return;
      }
      setState(() {
        if (result.valid) {
          _appliedCouponCode = code.toUpperCase();
          _couponDiscountAmount = result.discountAmount;
          _couponFeedback = 'Rabattcode wurde eingelöst.';
          _couponIsError = false;
        } else {
          _appliedCouponCode = null;
          _couponDiscountAmount = 0;
          _couponFeedback = result.reason ?? 'Rabattcode konnte nicht eingelöst werden.';
          _couponIsError = true;
        }
      });
    } on ApiException catch (error) {
      if (!mounted) {
        return;
      }
      setState(() {
        _appliedCouponCode = null;
        _couponDiscountAmount = 0;
        _couponFeedback = error.message;
        _couponIsError = true;
      });
    } finally {
      if (mounted) {
        setState(() {
          _couponValidationBusy = false;
        });
      }
    }
  }

  Future<void> _sendOrder() async {
    if (_lines.isEmpty) {
      return;
    }
    final mustConfirmHighLoad = !widget.orderIntakeEnabled || (widget.orderIntakeMessage?.trim().isNotEmpty ?? false);
    if (mustConfirmHighLoad) {
      final shouldContinue = await _confirmHighLoadCheckout();
      if (shouldContinue != true) {
        return;
      }
    }

    setState(() {
      _isSubmitting = true;
      _errorMessage = null;
    });

    try {
      final order = await widget.submitOrder(
        lines: _lines,
        serviceType: _serviceType,
        paymentType: _paymentType,
        customerName: _customerNameController.text.trim().isEmpty
            ? null
            : _customerNameController.text.trim(),
        customerPhone: _customerPhoneController.text.trim().isEmpty
            ? null
            : _customerPhoneController.text.trim(),
        deliveryAddress: _serviceType == _CheckoutServiceType.delivery
            ? _deliveryAddressController.text.trim()
            : null,
        deliveryZipCode: _serviceType == _CheckoutServiceType.delivery
            ? _deliveryZipController.text.trim()
            : null,
        deliveryCity: _serviceType == _CheckoutServiceType.delivery
            ? _deliveryCityController.text.trim()
            : null,
        deliveryLatitude: _serviceType == _CheckoutServiceType.delivery
            ? _checkoutLatitude
            : null,
        deliveryLongitude: _serviceType == _CheckoutServiceType.delivery
            ? _checkoutLongitude
            : null,
        tipAmount: _tipAmount,
        couponCode: _appliedCouponCode,
      );
      if (!mounted) {
        return;
      }
      setState(() {
        _createdOrder = order;
        _step = 2;
      });
    } on ApiException catch (error) {
      if (!mounted) {
        return;
      }
      final handledUnavailableProduct = _tryRemoveUnavailableProductsFromOrderError(error);
      if (handledUnavailableProduct) {
        return;
      }
      setState(() {
        _errorMessage = error.message;
      });
    } catch (_) {
      if (!mounted) {
        return;
      }
      setState(() {
        _errorMessage =
            'Bestellung konnte nicht gesendet werden. Bitte prüfe deine Angaben und versuche es erneut.';
      });
    } finally {
      if (mounted) {
        setState(() {
          _isSubmitting = false;
        });
      }
    }
  }

  Future<bool?> _confirmHighLoadCheckout() {
    final message = widget.orderIntakeMessage?.trim().isNotEmpty == true
        ? widget.orderIntakeMessage!.trim()
        : 'Bitte beachte: Aufgrund hoher Auslastung kann es zu deutlich längeren Liefer- oder Abholzeiten kommen. Es kann außerdem sein, dass deine Bestellung nicht angenommen wird.';
    return showDialog<bool>(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: const Text('Wichtiger Hinweis'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(dialogContext).pop(false),
              child: const Text('Abbrechen'),
            ),
            FilledButton(
              onPressed: () => Navigator.of(dialogContext).pop(true),
              child: const Text('Trotzdem versuchen'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _step == 0
              ? 'Warenkorb'
              : _step == 1
              ? 'Checkout'
              : 'Bestellbestätigung',
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: _buildStepBody(),
        ),
      ),
      bottomNavigationBar: SafeArea(
        minimum: const EdgeInsets.fromLTRB(12, 8, 12, 12),
        child: _buildBottomAction(),
      ),
    );
  }

  Widget _buildStepBody() {
    if (_step == 0) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
            child: ListTile(
              title: Text(widget.tenantName),
              subtitle: Text('$_itemsCount Artikel im Warenkorb'),
            ),
          ),
          const SizedBox(height: 8),
          if (_lines.isEmpty)
            const Expanded(
              child: Center(child: Text('Dein Warenkorb ist leer.')),
            )
          else
            Expanded(
              child: ListView.separated(
                itemCount: _lines.length,
                separatorBuilder: (_, _) => const SizedBox(height: 8),
                itemBuilder: (context, index) {
                  final line = _lines[index];
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Text(
                                  line.product.name,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                              Text(
                                _formatCurrency(line.lineTotal),
                                style: const TextStyle(fontWeight: FontWeight.w700),
                              ),
                            ],
                          ),
                          if (line.selectedModifiers.isNotEmpty) ...[
                            const SizedBox(height: 4),
                            Text(
                              line.modifierLabel,
                              style: const TextStyle(color: Colors.black54, fontSize: 12),
                            ),
                          ],
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              Text(
                                '${_formatCurrency(line.unitPrice)} / Stk.',
                                style: const TextStyle(color: Colors.black54, fontSize: 12),
                              ),
                              const Spacer(),
                              IconButton(
                                onPressed: () => _changeQuantity(line.id, -1),
                                icon: const Icon(Icons.remove_circle_outline),
                              ),
                              Text('${line.quantity}'),
                              IconButton(
                                onPressed: () => _changeQuantity(line.id, 1),
                                icon: const Icon(Icons.add_circle_outline),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
        ],
      );
    }

    if (_step == 1) {
      final belowMinOrder = _serviceType == _CheckoutServiceType.delivery &&
          widget.minOrderValueAmount != null &&
          _subtotal < widget.minOrderValueAmount!;

      return ListView(
        children: [
          Card(
            child: ListTile(
              title: Text(widget.tenantName),
              subtitle: Text('$_itemsCount Artikel | ${_formatCurrency(_total)}'),
            ),
          ),
          const SizedBox(height: 8),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Rabattcode', style: TextStyle(fontWeight: FontWeight.w700)),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _couponCodeController,
                          textCapitalization: TextCapitalization.characters,
                          decoration: const InputDecoration(
                            labelText: 'Rabattcode eingeben',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      FilledButton(
                        onPressed: _couponValidationBusy ? null : _applyCouponCode,
                        child: Text(_couponValidationBusy ? '...' : 'Einlösen'),
                      ),
                    ],
                  ),
                  if (_couponFeedback != null) ...[
                    const SizedBox(height: 8),
                    Text(
                      _couponFeedback!,
                      style: TextStyle(
                        color: _couponIsError ? const Color(0xFFB91C1C) : const Color(0xFF166534),
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
          const SizedBox(height: 8),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Trinkgeld', style: TextStyle(fontWeight: FontWeight.w700)),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [0, 1, 2, 5]
                        .map(
                          (value) => ChoiceChip(
                            selected: _tipAmount == value.toDouble(),
                            label: Text(value == 0 ? '0 €' : '$value €'),
                            onSelected: (_) => _setTipAmount(value.toDouble()),
                          ),
                        )
                        .toList(growable: false),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    controller: _customTipController,
                    keyboardType: const TextInputType.numberWithOptions(decimal: true),
                    decoration: const InputDecoration(
                      labelText: 'Eigener Betrag',
                      hintText: 'z. B. 3,50',
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      final parsed = _parseMoneyValue(value);
                      if (parsed == null) {
                        return;
                      }
                      setState(() {
                        _tipAmount = parsed;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 8),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Lieferart', style: TextStyle(fontWeight: FontWeight.w700)),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: _CheckoutServiceType.values
                        .where(
                          (value) =>
                              (value == _CheckoutServiceType.delivery && widget.allowDelivery) ||
                              (value == _CheckoutServiceType.pickup && widget.allowPickup),
                        )
                        .map(
                          (value) => ChoiceChip(
                            selected: value == _serviceType,
                            label: Text(_serviceTypeLabel(value)),
                            onSelected: (_) {
                              setState(() {
                                _serviceType = value;
                              });
                            },
                          ),
                        )
                        .toList(growable: false),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 8),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Zahlungsart', style: TextStyle(fontWeight: FontWeight.w700)),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: _CheckoutPaymentType.values
                        .map(
                          (value) => ChoiceChip(
                            selected: value == _paymentType,
                            label: Text(_paymentTypeLabel(value)),
                            onSelected: (_) {
                              setState(() {
                                _paymentType = value;
                              });
                            },
                          ),
                        )
                        .toList(growable: false),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 8),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Bestellerdaten', style: TextStyle(fontWeight: FontWeight.w700)),
                  const SizedBox(height: 8),
                  TextField(
                    controller: _customerNameController,
                    onChanged: (_) => setState(() {}),
                    decoration: const InputDecoration(
                      labelText: 'Name',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    controller: _customerPhoneController,
                    onChanged: (_) => setState(() {}),
                    keyboardType: TextInputType.phone,
                    decoration: const InputDecoration(
                      labelText: 'Telefon (optional)',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  if (_serviceType == _CheckoutServiceType.delivery) ...[
                    const SizedBox(height: 12),
                    const Divider(height: 20),
                    const SizedBox(height: 4),
                    const Text(
                      'Lieferadresse (Pflicht)',
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      controller: _deliveryAddressController,
                      onChanged: (_) => setState(() {}),
                      decoration: const InputDecoration(
                        labelText: 'Straße und Hausnummer',
                        hintText: 'z. B. Musterstraße 12',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: TextField(
                            controller: _deliveryZipController,
                            onChanged: (_) => setState(() {}),
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              labelText: 'PLZ',
                              hintText: '5-stellig',
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          flex: 3,
                          child: TextField(
                            controller: _deliveryCityController,
                            onChanged: (_) => setState(() {}),
                            decoration: const InputDecoration(
                              labelText: 'Ort',
                              hintText: 'z. B. Kreuztal',
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Koordinaten vorhanden: ${_hasDeliveryCoordinates ? 'Ja' : 'Nein'}',
                      style: TextStyle(
                        fontSize: 12,
                        color: _hasDeliveryCoordinates
                            ? const Color(0xFF166534)
                            : const Color(0xFF92400E),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    if (widget.requiresDeliveryCoordinates && !_hasDeliveryCoordinates) ...[
                      const SizedBox(height: 6),
                      const Text(
                        'Bitte Lieferadresse auswählen oder Standort verwenden, damit Koordinaten gesetzt werden.',
                        style: TextStyle(fontSize: 12, color: Color(0xFFB91C1C)),
                      ),
                    ],
                    const SizedBox(height: 8),
                    if (!_deliveryAddressReady) ...[
                      const SizedBox(height: 8),
                      const Text(
                        'Für Lieferung bitte eine vollständige Adresse mit Straße, Hausnummer, PLZ und Ort eingeben.',
                        style: TextStyle(fontSize: 12, color: Color(0xFFB91C1C)),
                      ),
                    ] else ...[
                      const SizedBox(height: 8),
                      Text(
                        'Lieferadresse: ${_deliveryAddressController.text.trim()}, ${_deliveryZipController.text.trim()} ${_deliveryCityController.text.trim()}',
                        style: const TextStyle(fontSize: 12, color: Color(0xFF52525B)),
                      ),
                    ],
                  ],
                ],
              ),
            ),
          ),
          const SizedBox(height: 8),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Preisübersicht', style: TextStyle(fontWeight: FontWeight.w700)),
                  const SizedBox(height: 8),
                  Text('Zwischensumme: ${_formatCurrency(_subtotal)}'),
                  if (_serviceType == _CheckoutServiceType.delivery)
                    Text('Liefergebühr: ${_formatCurrency(widget.deliveryFeeAmount)}'),
                  if (_serviceFee > 0)
                    Text(
                      '${widget.serviceFeeSettings.label?.trim().isNotEmpty == true ? widget.serviceFeeSettings.label!.trim() : 'Servicegebühr'}: ${_formatCurrency(_serviceFee)}',
                    ),
                  if (_discount > 0)
                    Text('Rabatt: -${_formatCurrency(_discount)}'),
                  if (_tipAmount > 0)
                    Text('Trinkgeld: ${_formatCurrency(_tipAmount)}'),
                  if (widget.minOrderValueAmount != null)
                    Text(
                      'Mindestbestellwert: ${_formatCurrency(widget.minOrderValueAmount!)}',
                    ),
                  const SizedBox(height: 4),
                  Text(
                    'Gesamt: ${_formatCurrency(_total)}',
                    style: const TextStyle(fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ),
          ),
          if (widget.requireCustomerLogin && !widget.customerLoggedIn) ...[
            const SizedBox(height: 8),
            const Text(
              'Bitte zuerst im Profil mit Kundenkonto einloggen.',
              style: TextStyle(color: Color(0xFFB91C1C)),
            ),
          ],
          if (belowMinOrder) ...[
            const SizedBox(height: 8),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: const Color(0xFFFEF3C7),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: const Color(0xFFF59E0B)),
              ),
              child: Text(
                'Noch ${_formatCurrency(widget.minOrderValueAmount! - _subtotal)} für die Lieferung.',
                style: const TextStyle(
                  color: Color(0xFF92400E),
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ] else if (_serviceType == _CheckoutServiceType.delivery &&
              widget.minOrderValueAmount != null) ...[
            const SizedBox(height: 8),
            const Text(
              '✓ Mindestbestellwert erreicht',
              style: TextStyle(
                color: Color(0xFF166534),
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
          if (_containsAlcohol) ...[
            const SizedBox(height: 8),
            const Text(
              'Jugendschutz-Hinweis: Diese Bestellung enthält alkoholische Produkte. '
              'Die Übergabe an Minderjährige ist ausgeschlossen. '
              'Fahrer und Händler prüfen das Alter bei der Übergabe.',
              style: TextStyle(color: Color(0xFF92400E), fontWeight: FontWeight.w600),
            ),
          ],
          if (_errorMessage != null) ...[
            const SizedBox(height: 8),
            Text(_errorMessage!, style: const TextStyle(color: Color(0xFFB91C1C))),
          ],
        ],
      );
    }

    final order = _createdOrder;
    if (order == null) {
      return const Center(
        child: Text('Bestellung konnte nicht bestätigt werden.'),
      );
    }

    return ListView(
      children: [
        const Icon(Icons.check_circle, size: 64, color: Color(0xFF059669)),
        const SizedBox(height: 12),
        const Center(
          child: Text(
            'Deine Bestellung wurde gesendet',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
          ),
        ),
        const SizedBox(height: 8),
        Center(
          child: Text(
            'Bestellnummer: ${_displayOrderNumber(order)}',
            style: const TextStyle(color: Colors.black54),
          ),
        ),
        if (order.pickupNumber != null) ...[
          const SizedBox(height: 8),
          Center(
            child: Text(
              'Abholnummer: ${order.pickupNumber}',
              style: const TextStyle(fontWeight: FontWeight.w700),
            ),
          ),
        ],
        const SizedBox(height: 12),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Gesamt: ${_formatCurrency(order.total)}'),
                const SizedBox(height: 4),
                Text('Status: ${_statusLabel(order.status)}'),
                const SizedBox(height: 4),
                Text('Zeit: ${_formatDateTime(order.createdAt)}'),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildBottomAction() {
    if (_step == 0) {
      return FilledButton(
        onPressed: _lines.isEmpty
            ? null
            : () {
                setState(() {
                  _step = 1;
                });
              },
        child: const Text('Weiter zur Kasse'),
      );
    }

    if (_step == 1) {
      final belowMinOrder = _serviceType == _CheckoutServiceType.delivery &&
          widget.minOrderValueAmount != null &&
          _subtotal < widget.minOrderValueAmount!;
      final missingDeliveryCoordinates = _serviceType == _CheckoutServiceType.delivery &&
          widget.requiresDeliveryCoordinates &&
          !_hasDeliveryCoordinates;
      final hasName = _customerNameController.text.trim().isNotEmpty;
      final blockedByLogin = widget.requireCustomerLogin && !widget.customerLoggedIn;
      final disabled = _isSubmitting ||
          _lines.isEmpty ||
          !hasName ||
          belowMinOrder ||
          missingDeliveryCoordinates ||
          blockedByLogin ||
          !_deliveryAddressReady;

      return FilledButton(
        onPressed: disabled ? null : _sendOrder,
        child: Text(
          _isSubmitting
              ? 'Bestellung wird gesendet...'
              : belowMinOrder
              ? 'Mindestbestellwert nicht erreicht'
              : missingDeliveryCoordinates
              ? 'Bitte Lieferadresse auswählen'
              : 'Zahlungspflichtig bestellen',
        ),
      );
    }

    return FilledButton(
      onPressed: () => Navigator.of(context).pop(_createdOrder),
      child: const Text('Zurück zur App'),
    );
  }
}

class _CustomerOrderTrackingSheet extends StatefulWidget {
  const _CustomerOrderTrackingSheet({
    required this.initialOrder,
    required this.api,
    required this.baseUrl,
    required this.appAuthToken,
    required this.tenantId,
    required this.onReorder,
    required this.onComplaint,
  });

  final PublicOrderSummary initialOrder;
  final KlarandoApi api;
  final String baseUrl;
  final String? appAuthToken;
  final String? tenantId;
  final Future<void> Function(PublicOrderSummary order) onReorder;
  final Future<void> Function(PublicOrderSummary order) onComplaint;

  @override
  State<_CustomerOrderTrackingSheet> createState() =>
      _CustomerOrderTrackingSheetState();
}

class _CustomerOrderTrackingSheetState extends State<_CustomerOrderTrackingSheet>
    with WidgetsBindingObserver {
  static const _trackingInterval = Duration(seconds: 12);

  late PublicOrderSummary _order;
  Timer? _trackingTimer;
  bool _trackingBusy = false;
  String? _trackingError;
  bool _followDriver = true;
  bool _mapLoadFailed = false;
  int _mapRefreshSeed = 0;
  String? _mapErrorDetails;

  String _formatCurrency(double value) {
    final normalized = value.toStringAsFixed(2).replaceAll('.', ',');
    return '$normalized €';
  }

  @override
  void initState() {
    super.initState();
    _order = widget.initialOrder;
    WidgetsBinding.instance.addObserver(this);
    _startTrackingTicker();
    unawaited(_refreshTracking(force: true));
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _trackingTimer?.cancel();
    _trackingTimer = null;
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      _startTrackingTicker();
      unawaited(_refreshTracking(force: true));
      return;
    }
    if (state == AppLifecycleState.paused ||
        state == AppLifecycleState.inactive ||
        state == AppLifecycleState.hidden) {
      _trackingTimer?.cancel();
      _trackingTimer = null;
    }
  }

  void _startTrackingTicker() {
    _trackingTimer ??= Timer.periodic(_trackingInterval, (_) {
      unawaited(_refreshTracking());
    });
  }

  Future<void> _refreshTracking({bool force = false}) async {
    if (_trackingBusy) return;
    final token = widget.appAuthToken?.trim();
    if ((token ?? '').isEmpty) {
      if (mounted) {
        setState(() {
          _trackingError =
              'Nicht eingeloggt. Live-Tracking ist aktuell nicht verfügbar.';
        });
      }
      return;
    }

    _trackingBusy = true;
    if (force && mounted) {
      setState(() {
        _trackingError = null;
      });
    }
    try {
      final updated = await widget.api.fetchOrderLiveTracking(
        baseUrl: widget.baseUrl,
        orderId: _order.id,
        tenantId: widget.tenantId,
        appAuthToken: token,
      );
      if (!mounted) return;
      final resolvedOrder = updated;
      final resolvedLocation = resolvedOrder.driverLocation;
      debugPrint(
        'CUSTOMER_TRACKING_POLL { orderId: ${resolvedOrder.id}, status: ${resolvedOrder.status}, driverLocationPresent: ${resolvedLocation != null}, lastDriverLocationAt: ${resolvedLocation?.updatedAt?.toIso8601String() ?? '-'} }',
      );
      setState(() {
        _order = resolvedOrder;
        _trackingError = null;
        _mapLoadFailed = false;
        _mapErrorDetails = null;
      });
      if (resolvedOrder.status == 'done' ||
          resolvedOrder.status == 'cancelled' ||
          resolvedOrder.status == 'rejected') {
        _trackingTimer?.cancel();
        _trackingTimer = null;
      }
    } on ApiException catch (error) {
      if (!mounted) return;
      debugPrint('CUSTOMER_TRACKING_ERROR { message: ${error.message} }');
      setState(() {
        _trackingError = error.message;
      });
    } finally {
      _trackingBusy = false;
    }
  }

  String _driverTrackingHint() {
    if (_order.status != 'out_for_delivery') {
      return 'Fahrer wurde noch nicht gestartet.';
    }
    final location = _order.driverLocation;
    if (location == null) {
      return 'Fahrerposition wird geladen …';
    }
    final updatedAt = location.updatedAt;
    if (updatedAt == null) {
      return 'Fahrerposition wird geladen …';
    }
    final age = DateTime.now().difference(updatedAt.toLocal()).inMinutes;
    if (age >= 1) {
      return 'Letzte Fahrerposition vor $age Minute${age == 1 ? '' : 'n'}.';
    }
    return 'Fahrerposition live aktualisiert.';
  }

  bool _hasValidCoordinates(double? latitude, double? longitude) {
    if (latitude == null || longitude == null) return false;
    if (latitude == 0 && longitude == 0) return false;
    if (latitude < -90 || latitude > 90) return false;
    if (longitude < -180 || longitude > 180) return false;
    return true;
  }

  String _buildDriverMapTileUrl(DriverLocationPoint location) {
    final zoom = _followDriver ? 16 : 14;
    final latRad = location.latitude * math.pi / 180;
    final n = math.pow(2.0, zoom).toDouble();
    final tileX = ((location.longitude + 180.0) / 360.0 * n).floor();
    final tileY =
        ((1.0 - math.log(math.tan(latRad) + (1 / math.cos(latRad))) / math.pi) / 2.0 * n)
            .floor();
    return 'https://tile.openstreetmap.org/$zoom/$tileX/$tileY.png';
  }

  String _buildDriverMapImageUrl(DriverLocationPoint location) {
    return Uri.https('maps.googleapis.com', '/maps/api/staticmap', {
      'center':
          '${location.latitude.toStringAsFixed(6)},${location.longitude.toStringAsFixed(6)}',
      'zoom': _followDriver ? '16' : '14',
      'size': '900x420',
      'maptype': 'roadmap',
      'markers':
          'color:red|label:F|${location.latitude.toStringAsFixed(6)},${location.longitude.toStringAsFixed(6)}',
      if (_googleMapsStaticApiKey.isNotEmpty) 'key': _googleMapsStaticApiKey,
    }).toString();
  }

  String _buildDriverMapFallbackImageUrl(DriverLocationPoint location) {
    return Uri.https('staticmap.openstreetmap.de', '/staticmap.php', {
      'center':
          '${location.latitude.toStringAsFixed(6)},${location.longitude.toStringAsFixed(6)}',
      'zoom': _followDriver ? '16' : '14',
      'size': '900x420',
      'markers':
          '${location.latitude.toStringAsFixed(6)},${location.longitude.toStringAsFixed(6)},red-pushpin',
    }).toString();
  }

  Future<void> _openDriverRouteInMaps() async {
    final location = _order.driverLocation;
    if (location == null) return;
    final destination = [
      (_order.customerAddress ?? '').trim(),
      (_order.customerZipCode ?? '').trim(),
      (_order.customerCity ?? '').trim(),
    ].where((entry) => entry.isNotEmpty).join(', ');
    if (destination.isEmpty) return;
    final uri = Uri.parse(
      'https://www.google.com/maps/dir/?api=1&origin=${location.latitude},${location.longitude}&destination=${Uri.encodeComponent(destination)}&travelmode=driving',
    );
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }

  @override
  Widget build(BuildContext context) {
    final order = _order;
    final location = order.driverLocation;
    final hasValidDriverCoordinates =
        location != null && _hasValidCoordinates(location.latitude, location.longitude);
    final mapPreviewTileUrl = hasValidDriverCoordinates
        ? _buildDriverMapTileUrl(location)
        : null;
    final mapPreviewUrl = hasValidDriverCoordinates
        ? _buildDriverMapImageUrl(location)
        : null;
    final mapPreviewFallbackUrl = hasValidDriverCoordinates
        ? _buildDriverMapFallbackImageUrl(location)
        : null;
    final mapPreviewTileUrlWithSeed = mapPreviewTileUrl == null
        ? null
        : '$mapPreviewTileUrl?retry=$_mapRefreshSeed';
    final mapPreviewUrlWithSeed = mapPreviewUrl == null
        ? null
        : '$mapPreviewUrl&retry=$_mapRefreshSeed';
    final mapFallbackUrlWithSeed = mapPreviewFallbackUrl == null
        ? null
        : '$mapPreviewFallbackUrl&retry=$_mapRefreshSeed';

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${order.tenantName ?? 'Filiale'} | #${_displayOrderNumber(order)}',
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 6),
              Text(
                'Status: ${_statusLabel(order.status)} | Gesamt: ${_formatCurrency(order.total)}',
                style: const TextStyle(color: Color(0xFF52525B)),
              ),
              const SizedBox(height: 6),
              Text(
                _driverTrackingHint(),
                style: const TextStyle(fontSize: 13, color: Color(0xFF0F766E)),
              ),
              if (_trackingError != null) ...[
                const SizedBox(height: 6),
                Text(
                  _trackingError!,
                  style: const TextStyle(fontSize: 12, color: Color(0xFFB91C1C)),
                ),
              ],
              const SizedBox(height: 10),
              const Text(
                'Live-Karte',
                style: TextStyle(fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 6),
              if (order.status == 'out_for_delivery' && mapPreviewUrlWithSeed != null && !_mapLoadFailed)
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    mapPreviewTileUrlWithSeed!,
                    height: 190,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (_, tileError, ___) => Image.network(
                      mapPreviewUrlWithSeed,
                      height: 190,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      errorBuilder: (_, googleError, ____) => Image.network(
                        mapFallbackUrlWithSeed!,
                        height: 190,
                        width: double.infinity,
                        fit: BoxFit.cover,
                        errorBuilder: (_, osmStaticError, _____) {
                        final errorSummary =
                            'tile=${tileError.runtimeType}, google=${googleError.runtimeType}, osmStatic=${osmStaticError.runtimeType}';
                        debugPrint(
                          'CUSTOMER_TRACKING_MAP_ERROR { orderId: ${order.id}, provider: tile.openstreetmap/google/osm-static, driverLocationPresent: ${location != null}, driverLat: ${location?.latitude}, driverLng: ${location?.longitude}, errorSummary: $errorSummary }',
                        );
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          if (mounted && !_mapLoadFailed) {
                            setState(() {
                              _mapLoadFailed = true;
                              _mapErrorDetails = errorSummary;
                            });
                          }
                        });
                        return _buildMapFallbackCard();
                        },
                      ),
                    ),
                  ),
                )
              else if (order.status == 'out_for_delivery' && _mapLoadFailed)
                _buildMapFallbackCard()
              else
                Container(
                  height: 120,
                  width: double.infinity,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: const Color(0xFFF8FAFC),
                    border: Border.all(color: const Color(0xFFE2E8F0)),
                  ),
                  child: Text(
                    order.status == 'out_for_delivery'
                        ? 'Fahrerposition wird geladen …'
                        : 'Lieferung noch nicht unterwegs.',
                    style: const TextStyle(color: Color(0xFF64748B)),
                  ),
                ),
              const SizedBox(height: 8),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  OutlinedButton.icon(
                    onPressed: () {
                      setState(() {
                        _followDriver = !_followDriver;
                      });
                    },
                    icon: Icon(
                        _followDriver ? Icons.my_location : Icons.location_searching),
                    label: Text(
                        _followDriver ? 'Fahrer folgen: an' : 'Fahrer folgen: aus'),
                  ),
                  OutlinedButton.icon(
                    onPressed: location == null ? null : _openDriverRouteInMaps,
                    icon: const Icon(Icons.alt_route),
                    label: const Text('Route anzeigen'),
                  ),
                  OutlinedButton.icon(
                    onPressed: hasValidDriverCoordinates
                        ? _openOrderLocationInOpenStreetMap
                        : null,
                    icon: const Icon(Icons.map_outlined),
                    label: const Text('Karte extern öffnen'),
                  ),
                  OutlinedButton.icon(
                    onPressed: hasValidDriverCoordinates
                        ? _copyOrderLocationOpenStreetMapLink
                        : null,
                    icon: const Icon(Icons.link),
                    label: const Text('OSM-Link kopieren'),
                  ),
                  OutlinedButton.icon(
                    onPressed: _trackingBusy ? null : () => _refreshTracking(force: true),
                    icon: const Icon(Icons.refresh),
                    label: const Text('Aktualisieren'),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              _buildTrackingInfoCard(order),
              const SizedBox(height: 10),
              const Text(
                'Bestellpositionen',
                style: TextStyle(fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 6),
              ConstrainedBox(
                constraints: const BoxConstraints(maxHeight: 280),
                child: ListView.separated(
                  shrinkWrap: true,
                  itemCount: order.items.length,
                  separatorBuilder: (_, __) => const Divider(height: 12),
                  itemBuilder: (context, index) {
                    final item = order.items[index];
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${item.quantity}x',
                          style: const TextStyle(fontWeight: FontWeight.w700),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(item.productName),
                              if (item.modifierNames.isNotEmpty)
                                Text(
                                  'Optionen: ${item.modifierNames.join(', ')}',
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: Color(0xFF71717A),
                                  ),
                                ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(_formatCurrency(item.price)),
                      ],
                    );
                  },
                ),
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text('Schließen'),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: FilledButton(
                      onPressed: () => widget.onReorder(order),
                      child: const Text('Erneut bestellen'),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              if ((widget.appAuthToken ?? '').trim().isNotEmpty)
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton.icon(
                    onPressed: () => widget.onComplaint(order),
                    icon: const Icon(Icons.report_gmailerrorred_outlined),
                    label: const Text('Reklamation mit Bild melden'),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTrackingInfoCard(PublicOrderSummary order) {
    final address = [
      (order.customerAddress ?? '').trim(),
      (order.customerZipCode ?? '').trim(),
      (order.customerCity ?? '').trim(),
    ].where((entry) => entry.isNotEmpty).join(', ');
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color(0xFFF8FAFC),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xFFE2E8F0)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Restaurant: ${order.tenantName ?? 'Filiale'}'),
          Text('Lieferadresse: ${address.isEmpty ? '-' : address}'),
          Text(
            'Fahrerstatus: ${order.assignedDriverName?.trim().isNotEmpty == true ? 'zugewiesen (${order.assignedDriverName})' : 'noch nicht zugewiesen'}',
          ),
          const SizedBox(height: 4),
          Text(
            'Fahrerposition vorhanden: ${order.driverLocation != null ? 'ja' : 'nein'}',
          ),
          Text(
            'Fahrerposition: ${order.driverLocation == null ? '-' : '${order.driverLocation!.latitude.toStringAsFixed(6)}, ${order.driverLocation!.longitude.toStringAsFixed(6)}'}',
          ),
          Text(
            'Letztes Standort-Update: ${order.driverLocation?.updatedAt?.toIso8601String() ?? '-'}',
            style: const TextStyle(fontSize: 12, color: Color(0xFF64748B)),
          ),
        ],
      ),
    );
  }

  Widget _buildMapFallbackCard() {
    return Container(
      height: 190,
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: const Color(0xFFF4F4F5),
        border: Border.all(color: const Color(0xFFE2E8F0)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Die Karte konnte nicht geladen werden.',
            textAlign: TextAlign.center,
            style: TextStyle(color: Color(0xFF52525B)),
          ),
          const SizedBox(height: 6),
          Text(
            _mapFailureReasonText(_order),
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 12, color: Color(0xFF64748B)),
          ),
          const SizedBox(height: 10),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            alignment: WrapAlignment.center,
            children: [
              OutlinedButton.icon(
                onPressed: () {
                  setState(() {
                    _mapLoadFailed = false;
                    _mapErrorDetails = null;
                    _mapRefreshSeed += 1;
                  });
                },
                icon: const Icon(Icons.refresh),
                label: const Text('Karte erneut laden'),
              ),
              OutlinedButton.icon(
                onPressed: _openOrderLocationInOpenStreetMap,
                icon: const Icon(Icons.open_in_new),
                label: const Text('Karte extern öffnen'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _SubmittedOrder {
  const _SubmittedOrder({
    required this.tenantId,
    required this.tenantName,
    required this.order,
    this.rating,
  });

  final String tenantId;
  final String tenantName;
  final PublicOrderSummary order;
  final int? rating;

  _SubmittedOrder copyWith({
    String? tenantId,
    String? tenantName,
    PublicOrderSummary? order,
    int? rating,
  }) {
    return _SubmittedOrder(
      tenantId: tenantId ?? this.tenantId,
      tenantName: tenantName ?? this.tenantName,
      order: order ?? this.order,
      rating: rating ?? this.rating,
    );
  }
}

class _CartLine {
  const _CartLine({
    required this.id,
    required this.product,
    required this.selectedModifiers,
    required this.quantity,
  });

  final String id;
  final TenantCatalogProduct product;
  final List<TenantCatalogModifier> selectedModifiers;
  final int quantity;

  List<String> get selectedModifierIds => _normalizeModifierSelection(
        selectedModifiers,
      ).map((entry) => entry.id).toList(growable: false);

  double get unitModifierPrice =>
      selectedModifiers.fold<double>(0, (sum, entry) => sum + entry.priceDelta);

  double get unitPrice => product.price + product.depositAmount + unitModifierPrice;

  double get lineTotal => unitPrice * quantity;

  String get modifierLabel => selectedModifiers.map((entry) => entry.name).join(', ');

  _CartLine copyWith({
    String? id,
    TenantCatalogProduct? product,
    List<TenantCatalogModifier>? selectedModifiers,
    int? quantity,
  }) {
    return _CartLine(
      id: id ?? this.id,
      product: product ?? this.product,
      selectedModifiers: selectedModifiers ?? this.selectedModifiers,
      quantity: quantity ?? this.quantity,
    );
  }
}

enum _CheckoutServiceType { delivery, pickup }

enum _CheckoutPaymentType { cash, card, paypal, klarna }

bool _isValidZipCode(String value) {
  return RegExp(r'^\d{5}$').hasMatch(value.trim());
}

bool _looksLikeStreetWithHouseNumber(String value) {
  final normalized = value.trim();
  if (normalized.length < 6) {
    return false;
  }
  final hasLetter = RegExp(r'[A-Za-zÄÖÜäöüß]').hasMatch(normalized);
  final hasNumber = RegExp(r'\d').hasMatch(normalized);
  return hasLetter && hasNumber;
}

bool _isCompleteDeliveryAddress({
  required String? address,
  required String? zipCode,
  required String? city,
}) {
  final normalizedAddress = address?.trim() ?? '';
  final normalizedZip = zipCode?.trim() ?? '';
  final normalizedCity = city?.trim() ?? '';
  if (!_looksLikeStreetWithHouseNumber(normalizedAddress)) {
    return false;
  }
  if (!_isValidZipCode(normalizedZip)) {
    return false;
  }
  if (normalizedCity.length < 2) {
    return false;
  }
  return true;
}

String _normalizedLanguageCode(String? value) {
  if (value == 'en' || value == 'tr') {
    return value!;
  }
  return 'de';
}

class _NavLabels {
  const _NavLabels({
    required this.start,
    required this.order,
    required this.orders,
    required this.profile,
  });

  final String start;
  final String order;
  final String orders;
  final String profile;
}

_NavLabels _labelsForLanguage(String languageCode) {
  switch (_normalizedLanguageCode(languageCode)) {
    case 'en':
      return const _NavLabels(
        start: 'Home',
        order: 'Order',
        orders: 'Orders',
        profile: 'Profile',
      );
    case 'tr':
      return const _NavLabels(
        start: 'Ana Sayfa',
        order: 'Siparis',
        orders: 'Siparislerim',
        profile: 'Profil',
      );
    default:
      return const _NavLabels(
        start: 'Startseite',
        order: 'Bestellen',
        orders: 'Bestellungen',
        profile: 'Profil',
      );
  }
}

String _defaultBaseUrl() {
  return normalizeApiBaseUrl(defaultApiBaseUrl);
}

String _normalizedBaseUrl(String value) {
  return normalizeApiBaseUrl(value);
}

String _cartLineId(String productId, List<TenantCatalogModifier> selectedModifiers) {
  final ids = selectedModifiers.map((entry) => entry.id).toSet().toList(growable: false)..sort();
  if (ids.isEmpty) {
    return productId;
  }
  return '$productId::${ids.join(',')}';
}

String _modifierSelectionGroupKey(TenantCatalogModifier modifier) {
  if (modifier.isSize) {
    return 'SIZE';
  }

  final ingredientGroup = modifier.ingredientId?.trim();
  if (ingredientGroup == null || ingredientGroup.isEmpty) {
    return 'OPTION:__default';
  }

  return 'OPTION:$ingredientGroup';
}

List<TenantCatalogModifier> _normalizeModifierSelection(
  Iterable<TenantCatalogModifier> modifiers,
) {
  final selectedByGroup = <String, TenantCatalogModifier>{};
  for (final modifier in modifiers) {
    selectedByGroup[_modifierSelectionGroupKey(modifier)] = modifier;
  }

  final normalized = selectedByGroup.values.toList(growable: false);
  normalized.sort((a, b) => a.id.compareTo(b.id));
  return normalized;
}

String _normalizedProductKey(String value) {
  return value.trim().toLowerCase();
}

String _serviceTypeLabel(_CheckoutServiceType value) {
  switch (value) {
    case _CheckoutServiceType.delivery:
      return 'Lieferung';
    case _CheckoutServiceType.pickup:
      return 'Abholung';
  }
}

String _paymentTypeLabel(_CheckoutPaymentType value) {
  switch (value) {
    case _CheckoutPaymentType.cash:
      return 'Barzahlung';
    case _CheckoutPaymentType.card:
      return 'Kartenzahlung';
    case _CheckoutPaymentType.paypal:
      return 'PayPal';
    case _CheckoutPaymentType.klarna:
      return 'Klarna';
  }
}

String _statusLabel(String status) {
  switch (status) {
    case 'pending_payment':
      return 'Wartet auf Zahlung';
    case 'out_for_delivery':
      return 'Fahrer unterwegs';
    case 'open':
      return 'Offen';
    case 'preparing':
      return 'In Zubereitung';
    case 'done':
      return 'Fertig';
    case 'archived':
      return 'Erledigt';
    default:
      return 'In Bearbeitung';
  }
}

String _displayOrderNumber(PublicOrderSummary order) {
  final publicOrderCode = order.publicOrderCode?.trim();
  if (publicOrderCode != null && publicOrderCode.isNotEmpty) {
    return publicOrderCode.toUpperCase();
  }
  final pickupNumber = order.pickupNumber;
  if (pickupNumber != null && pickupNumber > 0) {
    return pickupNumber.toString().padLeft(3, '0');
  }
  final id = order.id;
  final normalized = id.length >= 8 ? id.substring(0, 8) : id;
  return normalized.toUpperCase();
}

String _formatDateTime(DateTime? value) {
  if (value == null) {
    return '-';
  }
  final local = value.toLocal();
  final day = local.day.toString().padLeft(2, '0');
  final month = local.month.toString().padLeft(2, '0');
  final year = local.year.toString();
  final hour = local.hour.toString().padLeft(2, '0');
  final minute = local.minute.toString().padLeft(2, '0');
  return '$day.$month.$year $hour:$minute';
}
