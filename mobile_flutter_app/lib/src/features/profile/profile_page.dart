import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../core/klarando_api.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({
    required this.baseUrl,
    required this.onApplyBaseUrl,
    required this.appUpdateBusy,
    required this.appUpdateInfo,
    required this.onCheckAppUpdate,
    required this.languageCode,
    required this.onLanguageChanged,
    required this.appCustomer,
    required this.appAuthBusy,
    required this.onAppLogin,
    required this.onAppRegister,
    required this.onAppSocialQuickstart,
    required this.onAppProfileUpdate,
    required this.onAppRequestDeletion,
    required this.onAppLogout,
    required this.imprintUrl,
    required this.privacyUrl,
    required this.termsUrl,
    required this.supportEmail,
    required this.accountDeletionEmail,
    super.key,
  });

  final String baseUrl;
  final ValueChanged<String> onApplyBaseUrl;
  final bool appUpdateBusy;
  final String? appUpdateInfo;
  final Future<void> Function() onCheckAppUpdate;
  final String languageCode;
  final Future<void> Function(String languageCode) onLanguageChanged;
  final AppCustomerUser? appCustomer;
  final bool appAuthBusy;
  final Future<void> Function({
    required String email,
    required String password,
  })
  onAppLogin;
  final Future<void> Function({
    required String email,
    required String fullName,
    required String password,
    String? phone,
    required String street,
    required String zipCode,
    required String city,
    bool marketingOptIn,
    bool privacyAccepted,
    bool termsAccepted,
  })
  onAppRegister;
  final Future<void> Function({
    required String provider,
    required String email,
    required String fullName,
    String? phone,
    required String street,
    required String zipCode,
    required String city,
    bool marketingOptIn,
    required bool privacyAccepted,
    required bool termsAccepted,
  })
  onAppSocialQuickstart;
  final Future<void> Function({
    required String fullName,
    String? phone,
    String? street,
    String? zipCode,
    String? city,
    bool marketingOptIn,
  })
  onAppProfileUpdate;
  final Future<void> Function({
    String? note,
  })
  onAppRequestDeletion;
  final VoidCallback onAppLogout;
  final String imprintUrl;
  final String privacyUrl;
  final String termsUrl;
  final String supportEmail;
  final String accountDeletionEmail;

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late final TextEditingController _baseUrlController;
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final TextEditingController _emailCodeController;
  late final TextEditingController _nameController;
  late final TextEditingController _phoneController;
  late final TextEditingController _streetController;
  late final TextEditingController _zipController;
  late final TextEditingController _cityController;
  late String _languageCode = _normalizeLanguageCode(widget.languageCode);
  bool _savingLanguage = false;
  bool _registerMode = false;
  bool _privacyAccepted = false;
  bool _termsAccepted = false;
  bool _marketingOptIn = false;
  bool _savingProfile = false;
  bool _socialBusy = false;
  bool _codeRequested = false;
  bool _requestingCode = false;
  bool _submittingCode = false;

  @override
  void initState() {
    super.initState();
    _baseUrlController = TextEditingController(text: widget.baseUrl);
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _emailCodeController = TextEditingController();
    _nameController = TextEditingController();
    _phoneController = TextEditingController();
    _streetController = TextEditingController();
    _zipController = TextEditingController();
    _cityController = TextEditingController();
    _hydrateProfileControllers(widget.appCustomer);
  }

  @override
  void didUpdateWidget(covariant ProfilePage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.baseUrl != widget.baseUrl) {
      _baseUrlController.text = widget.baseUrl;
    }
    if (oldWidget.languageCode != widget.languageCode) {
      _languageCode = _normalizeLanguageCode(widget.languageCode);
    }
    if (oldWidget.appCustomer?.id != widget.appCustomer?.id ||
        oldWidget.appCustomer?.updatedAtLabel() != widget.appCustomer?.updatedAtLabel()) {
      _hydrateProfileControllers(widget.appCustomer);
    }
  }

  @override
  void dispose() {
    _baseUrlController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _emailCodeController.dispose();
    _nameController.dispose();
    _phoneController.dispose();
    _streetController.dispose();
    _zipController.dispose();
    _cityController.dispose();
    super.dispose();
  }

  void _hydrateProfileControllers(AppCustomerUser? customer) {
    _nameController.text = customer?.fullName ?? '';
    _phoneController.text = customer?.phone ?? '';
    _streetController.text = customer?.street ?? '';
    _zipController.text = customer?.zipCode ?? '';
    _cityController.text = customer?.city ?? '';
    _marketingOptIn = customer?.marketingOptIn ?? false;
  }

  Future<void> _submitAuth() async {
    final email = _emailController.text.trim();
    final password = _passwordController.text;
    final fullName = _nameController.text.trim();
    final phone = _phoneController.text.trim();
    final street = _streetController.text.trim();
    final zipCode = _zipController.text.trim();
    final city = _cityController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      _showMessage('Bitte E-Mail und Passwort eingeben.');
      return;
    }
    if (_registerMode && fullName.isEmpty) {
      _showMessage('Bitte für die Registrierung einen Namen eingeben.');
      return;
    }
    if (_registerMode && (!_privacyAccepted || !_termsAccepted)) {
      _showMessage('Bitte Datenschutz und AGB akzeptieren.');
      return;
    }
    if (_registerMode &&
        !_isCompleteAddress(
          street: street,
          zipCode: zipCode,
          city: city,
        )) {
      _showMessage(
        'Für die Anmeldung bitte eine vollständige Standardlieferadresse mit Straße, Hausnummer, PLZ und Ort eingeben.',
      );
      return;
    }

    try {
      if (_registerMode) {
        await widget.onAppRegister(
          email: email,
          fullName: fullName,
          password: password,
          phone: phone.isEmpty ? null : phone,
          street: street,
          zipCode: zipCode,
          city: city,
          marketingOptIn: _marketingOptIn,
          privacyAccepted: _privacyAccepted,
          termsAccepted: _termsAccepted,
        );
      } else {
        await widget.onAppLogin(
          email: email,
          password: password,
        );
      }
      if (!mounted) {
        return;
      }
      _passwordController.clear();
      _showMessage(_registerMode ? 'Konto erstellt und eingeloggt.' : 'Login erfolgreich.');
    } catch (_) {
      // Fehler-Feedback kommt im Parent.
    }
  }

  Future<void> _submitSocialQuickstart(String provider) async {
    final email = _emailController.text.trim();
    final fullNameRaw = _nameController.text.trim();
    final fullName = fullNameRaw.isEmpty ? _deriveNameFromEmail(email) : fullNameRaw;
    final phone = _phoneController.text.trim();
    final street = _streetController.text.trim();
    final zipCode = _zipController.text.trim();
    final city = _cityController.text.trim();

    if (email.isEmpty) {
      _showMessage('Bitte E-Mail für Schnellkonto eingeben.');
      return;
    }
    if (fullName.isEmpty) {
      _showMessage('Bitte Namen eingeben.');
      return;
    }
    if (!_privacyAccepted || !_termsAccepted) {
      _showMessage('Bitte Datenschutz und AGB akzeptieren.');
      return;
    }
    if (!_isCompleteAddress(street: street, zipCode: zipCode, city: city)) {
      _showMessage(
        'Für die Anmeldung bitte eine vollständige Standardlieferadresse mit Straße, Hausnummer, PLZ und Ort eingeben.',
      );
      return;
    }

    setState(() {
      _socialBusy = true;
    });
    try {
      await widget.onAppSocialQuickstart(
        provider: provider,
        email: email,
        fullName: fullName,
        phone: phone.isEmpty ? null : phone,
        street: street,
        zipCode: zipCode,
        city: city,
        marketingOptIn: _marketingOptIn,
        privacyAccepted: _privacyAccepted,
        termsAccepted: _termsAccepted,
      );
      if (!mounted) {
        return;
      }
      _showMessage('Schnellkonto mit $provider erfolgreich.');
    } catch (_) {
      // Fehler werden als Snackbar im Parent behandelt.
    } finally {
      if (mounted) {
        setState(() {
          _socialBusy = false;
        });
      }
    }
  }

  Future<void> _requestEmailCode() async {
    final email = _emailController.text.trim();
    if (email.isEmpty || !email.contains('@')) {
      _showMessage('Bitte eine gültige E-Mail-Adresse eingeben.');
      return;
    }
    setState(() {
      _requestingCode = true;
    });
    await Future<void>.delayed(const Duration(milliseconds: 350));
    if (!mounted) {
      return;
    }
    setState(() {
      _requestingCode = false;
      _codeRequested = true;
    });
    _showMessage(
      'Bestätigungscode angefordert. Die Backend-Anbindung folgt als nächster Schritt.',
    );
  }

  Future<void> _submitEmailCode() async {
    final code = _emailCodeController.text.trim();
    if (code.length < 4) {
      _showMessage('Bitte einen gültigen Code eingeben.');
      return;
    }
    setState(() {
      _submittingCode = true;
    });
    await Future<void>.delayed(const Duration(milliseconds: 350));
    if (!mounted) {
      return;
    }
    setState(() {
      _submittingCode = false;
    });
    _showMessage(
      'Code-Login ist vorbereitet. Sobald die API aktiv ist, wird der Code hier geprüft.',
    );
  }

  Future<void> _openExternalLink(String rawUrl) async {
    final url = Uri.tryParse(rawUrl);
    if (url == null) {
      _showMessage('Link ist ungültig.');
      return;
    }
    final launched = await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    );
    if (!launched) {
      _showMessage('Link konnte nicht geöffnet werden.');
    }
  }

  Future<void> _saveProfile() async {
    final customer = widget.appCustomer;
    if (customer == null) {
      return;
    }
    final fullName = _nameController.text.trim();
    final zipCode = _zipController.text.trim();
    if (fullName.isEmpty) {
      _showMessage('Name darf nicht leer sein.');
      return;
    }
    if (zipCode.isNotEmpty && !RegExp(r'^\d{5}$').hasMatch(zipCode)) {
      _showMessage('PLZ muss 5-stellig sein.');
      return;
    }

    setState(() {
      _savingProfile = true;
    });
    try {
      await widget.onAppProfileUpdate(
        fullName: fullName,
        phone: _phoneController.text.trim().isEmpty ? null : _phoneController.text.trim(),
        street: _streetController.text.trim().isEmpty ? null : _streetController.text.trim(),
        zipCode: zipCode.isEmpty ? null : zipCode,
        city: _cityController.text.trim().isEmpty ? null : _cityController.text.trim(),
        marketingOptIn: _marketingOptIn,
      );
      if (!mounted) {
        return;
      }
      _showMessage('Profil gespeichert.');
    } catch (_) {
      // Fehler-Feedback kommt im Parent.
    } finally {
      if (mounted) {
        setState(() {
          _savingProfile = false;
        });
      }
    }
  }

  Future<void> _requestDeletion() async {
    final noteController = TextEditingController();
    final approved = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Konto löschen anfragen'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Die Anfrage wird an Klarando übergeben. Falls gesetzliche Aufbewahrungspflichten bestehen, informieren wir dich per E-Mail.',
            ),
            const SizedBox(height: 10),
            TextField(
              controller: noteController,
              maxLines: 3,
              decoration: const InputDecoration(
                labelText: 'Hinweis (optional)',
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(false),
            child: const Text('Abbrechen'),
          ),
          FilledButton(
            onPressed: () => Navigator.of(dialogContext).pop(true),
            child: const Text('Anfrage senden'),
          ),
        ],
      ),
    );
    if (approved != true) {
      return;
    }
    try {
      await widget.onAppRequestDeletion(
        note: noteController.text.trim().isEmpty ? null : noteController.text.trim(),
      );
      if (!mounted) {
        return;
      }
      _showMessage('Löschanfrage wurde übermittelt.');
    } catch (_) {
      // Fehler-Feedback kommt im Parent.
    } finally {
      noteController.dispose();
    }
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

  bool _isCompleteAddress({
    required String street,
    required String zipCode,
    required String city,
  }) {
    if (!_looksLikeStreetWithHouseNumber(street)) {
      return false;
    }
    if (!RegExp(r'^\d{5}$').hasMatch(zipCode.trim())) {
      return false;
    }
    if (city.trim().length < 2) {
      return false;
    }
    return true;
  }

  void _copyToClipboard(String label, String value) {
    if (value.trim().isEmpty) {
      return;
    }
    Clipboard.setData(ClipboardData(text: value.trim()));
    _showMessage('$label kopiert.');
  }

  void _showMessage(String message) {
    if (!mounted) {
      return;
    }
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    final customer = widget.appCustomer;

    return ListView(
      children: [
        _BrandCard(customer: customer),
        const SizedBox(height: 10),
        if (customer == null) _buildAuthCard() else _buildAccountCard(customer),
        const SizedBox(height: 10),
        _buildAppUpdateCard(),
        const SizedBox(height: 10),
        _buildLanguageCard(),
        const SizedBox(height: 10),
        _buildLegalCard(),
      ],
    );
  }

  Widget _buildAppUpdateCard() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'App-Update',
              style: TextStyle(fontWeight: FontWeight.w800, fontSize: 16),
            ),
            const SizedBox(height: 8),
            OutlinedButton.icon(
              onPressed: widget.appUpdateBusy ? null : widget.onCheckAppUpdate,
              icon: const Icon(Icons.system_update_rounded),
              label: Text(widget.appUpdateBusy ? 'Bitte warten...' : 'Update pruefen'),
            ),
            if (widget.appUpdateInfo != null) ...[
              const SizedBox(height: 8),
              Text(
                widget.appUpdateInfo!,
                style: const TextStyle(fontSize: 12, color: Color(0xFF0E7490)),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildAuthCard() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Einloggen oder Konto erstellen',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
            ),
            const SizedBox(height: 4),
            const Text(
              'Schnell, sicher und in wenigen Sekunden startklar.',
              style: TextStyle(fontSize: 13, color: Color(0xFF52525B)),
            ),
            const SizedBox(height: 10),
            _SocialLoginButton(
              label: 'Mit Google fortfahren',
              icon: Icons.g_mobiledata_rounded,
              onPressed: _socialBusy || widget.appAuthBusy
                  ? null
                  : () => _submitSocialQuickstart('GOOGLE'),
            ),
            const SizedBox(height: 8),
            _SocialLoginButton(
              label: 'Mit Apple fortfahren',
              icon: Icons.apple_rounded,
              onPressed: _socialBusy || widget.appAuthBusy
                  ? null
                  : () => _submitSocialQuickstart('APPLE'),
            ),
            const SizedBox(height: 8),
            _SocialLoginButton(
              label: 'Mit Facebook fortfahren',
              icon: Icons.facebook_rounded,
              onPressed: _socialBusy || widget.appAuthBusy
                  ? null
                  : () => _submitSocialQuickstart('FACEBOOK'),
            ),
            if (_socialBusy)
              const Padding(
                padding: EdgeInsets.only(top: 8),
                child: Text(
                  'Konto wird eingerichtet...',
                  style: TextStyle(fontSize: 12, color: Color(0xFF6B7280)),
                ),
              ),
            const SizedBox(height: 12),
            const Row(
              children: [
                Expanded(child: Divider(height: 1)),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Text('oder'),
                ),
                Expanded(child: Divider(height: 1)),
              ],
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                labelText: 'E-Mail-Adresse',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 8),
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                style: FilledButton.styleFrom(
                  backgroundColor: const Color(0xFFFF5A1F),
                ),
                onPressed: _requestingCode || widget.appAuthBusy ? null : _requestEmailCode,
                child: Text(
                  _requestingCode ? 'Wird angefordert...' : 'Bestätigungscode abrufen',
                ),
              ),
            ),
            if (_codeRequested) ...[
              const SizedBox(height: 8),
              TextField(
                controller: _emailCodeController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Bestätigungscode',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 8),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: _submittingCode || widget.appAuthBusy ? null : _submitEmailCode,
                  child: Text(_submittingCode ? 'Prüfe Code...' : 'Mit Code anmelden'),
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                'Hinweis: Der Code-Login ist als MVP vorbereitet. Die echte API-Anbindung folgt als nächster Schritt.',
                style: TextStyle(fontSize: 12, color: Color(0xFF52525B)),
              ),
            ],
            const SizedBox(height: 12),
            const Row(
              children: [
                Expanded(child: Divider(height: 1)),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Text('oder mit Passwort'),
                ),
                Expanded(child: Divider(height: 1)),
              ],
            ),
            const SizedBox(height: 12),
            if (_registerMode) ...[
              TextField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Vollständiger Name',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: _phoneController,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  labelText: 'Telefon (optional)',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: _streetController,
                decoration: const InputDecoration(
                  labelText: 'Standardlieferadresse: Straße und Hausnummer',
                  hintText: 'z. B. Musterstraße 12',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _zipController,
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
                    flex: 2,
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
              const SizedBox(height: 6),
              const Text(
                'Diese Standardlieferadresse wird bei der Bestellung vorausgefüllt und in der Bestellzusammenfassung angezeigt.',
                style: TextStyle(fontSize: 12, color: Color(0xFF52525B)),
              ),
              const SizedBox(height: 8),
            ],
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Passwort',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            if (_registerMode) ...[
              CheckboxListTile(
                value: _privacyAccepted,
                contentPadding: EdgeInsets.zero,
                title: const Text('Datenschutz akzeptieren'),
                controlAffinity: ListTileControlAffinity.leading,
                onChanged: (value) {
                  setState(() {
                    _privacyAccepted = value ?? false;
                  });
                },
              ),
              CheckboxListTile(
                value: _termsAccepted,
                contentPadding: EdgeInsets.zero,
                title: const Text('AGB akzeptieren'),
                controlAffinity: ListTileControlAffinity.leading,
                onChanged: (value) {
                  setState(() {
                    _termsAccepted = value ?? false;
                  });
                },
              ),
              CheckboxListTile(
                value: _marketingOptIn,
                contentPadding: EdgeInsets.zero,
                title: const Text('Angebote per E-Mail erhalten (optional)'),
                controlAffinity: ListTileControlAffinity.leading,
                onChanged: (value) {
                  setState(() {
                    _marketingOptIn = value ?? false;
                  });
                },
              ),
            ],
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                style: FilledButton.styleFrom(
                  backgroundColor: const Color(0xFFFF5A1F),
                ),
                onPressed: widget.appAuthBusy ? null : _submitAuth,
                child: Text(
                  widget.appAuthBusy
                      ? 'Bitte warten...'
                      : _registerMode
                      ? 'Konto erstellen'
                      : 'Einloggen',
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: TextButton(
                onPressed: widget.appAuthBusy
                    ? null
                    : () {
                        setState(() {
                          _registerMode = !_registerMode;
                        });
                      },
                child: Text(
                  _registerMode
                      ? 'Schon ein Konto? Jetzt einloggen'
                      : 'Noch kein Konto? Jetzt registrieren',
                ),
              ),
            ),
            const SizedBox(height: 8),
            Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                const Text(
                  'Wenn Sie fortfahren, erklären Sie sich mit unseren ',
                  style: TextStyle(fontSize: 12, color: Color(0xFF6B7280)),
                ),
                GestureDetector(
                  onTap: () => _openExternalLink(widget.termsUrl),
                  child: const Text(
                    'Allgemeinen Geschäftsbedingungen',
                    style: TextStyle(
                      fontSize: 12,
                      color: Color(0xFF0EA5E9),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const Text(
                  ' und der ',
                  style: TextStyle(fontSize: 12, color: Color(0xFF6B7280)),
                ),
                GestureDetector(
                  onTap: () => _openExternalLink(widget.privacyUrl),
                  child: const Text(
                    'Datenschutzerklärung',
                    style: TextStyle(
                      fontSize: 12,
                      color: Color(0xFF0EA5E9),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const Text(
                  ' einverstanden.',
                  style: TextStyle(fontSize: 12, color: Color(0xFF6B7280)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAccountCard(AppCustomerUser customer) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Mein Profil',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _phoneController,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                labelText: 'Telefon',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _streetController,
              decoration: const InputDecoration(
                labelText: 'Straße und Hausnummer',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 8),
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
                const SizedBox(width: 8),
                Expanded(
                  flex: 2,
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
              value: _marketingOptIn,
              contentPadding: EdgeInsets.zero,
              title: const Text('Angebote per E-Mail erhalten'),
              controlAffinity: ListTileControlAffinity.leading,
              onChanged: (value) {
                setState(() {
                  _marketingOptIn = value ?? false;
                });
              },
            ),
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: _savingProfile ? null : _saveProfile,
                child: Text(_savingProfile ? 'Speichert...' : 'Profil speichern'),
              ),
            ),
            const SizedBox(height: 8),
            if (customer.deletionRequestedAt != null)
              Text(
                'Löschanfrage gestellt am ${_formatDateTime(customer.deletionRequestedAt!)}',
                style: const TextStyle(
                  fontSize: 12,
                  color: Color(0xFF92400E),
                  fontWeight: FontWeight.w600,
                ),
              ),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                OutlinedButton.icon(
                  onPressed: _requestDeletion,
                  icon: const Icon(Icons.delete_outline_rounded),
                  label: const Text('Konto löschen anfragen'),
                ),
                OutlinedButton.icon(
                  onPressed: widget.onAppLogout,
                  icon: const Icon(Icons.logout_rounded),
                  label: const Text('Ausloggen'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLanguageCard() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Sprache',
              style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 10),
            DropdownButtonFormField<String>(
              value: _languageCode,
              decoration: const InputDecoration(
                labelText: 'App-Sprache',
                border: OutlineInputBorder(),
              ),
              items: const [
                DropdownMenuItem(value: 'de', child: Text('Deutsch')),
                DropdownMenuItem(value: 'en', child: Text('English')),
                DropdownMenuItem(value: 'tr', child: Text('Türkçe')),
              ],
              onChanged: _savingLanguage
                  ? null
                  : (value) async {
                      if (value == null) {
                        return;
                      }
                      setState(() {
                        _savingLanguage = true;
                        _languageCode = value;
                      });
                      await widget.onLanguageChanged(value);
                      if (!mounted) {
                        return;
                      }
                      setState(() {
                        _savingLanguage = false;
                      });
                    },
            ),
            if (_savingLanguage)
              const Padding(
                padding: EdgeInsets.only(top: 8),
                child: Text(
                  'Sprache wird gespeichert...',
                  style: TextStyle(fontSize: 12, color: Color(0xFF6B7280)),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildLegalCard() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ExpansionTile(
        tilePadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
        childrenPadding: const EdgeInsets.fromLTRB(14, 0, 14, 10),
        title: const Text(
          'Datenschutz, Rechtliches & Support',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
        ),
        children: [
          _InfoLine(
            label: 'Impressum',
            value: widget.imprintUrl,
            onCopy: () => _copyToClipboard('Impressum-URL', widget.imprintUrl),
          ),
          _InfoLine(
            label: 'Datenschutz',
            value: widget.privacyUrl,
            onCopy: () => _copyToClipboard('Datenschutz-URL', widget.privacyUrl),
          ),
          _InfoLine(
            label: 'AGB',
            value: widget.termsUrl,
            onCopy: () => _copyToClipboard('AGB-URL', widget.termsUrl),
          ),
          _InfoLine(
            label: 'Support E-Mail',
            value: widget.supportEmail,
            onCopy: () => _copyToClipboard('Support E-Mail', widget.supportEmail),
          ),
          _InfoLine(
            label: 'Kontolöschung E-Mail',
            value: widget.accountDeletionEmail,
            onCopy: () => _copyToClipboard('Kontolöschung E-Mail', widget.accountDeletionEmail),
          ),
        ],
      ),
    );
  }
}

class _SocialLoginButton extends StatelessWidget {
  const _SocialLoginButton({
    required this.label,
    required this.icon,
    required this.onPressed,
  });

  final String label;
  final IconData icon;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton.icon(
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
          side: const BorderSide(color: Color(0xFFE4E4E7)),
        ),
        onPressed: onPressed,
        icon: Icon(icon, size: 22),
        label: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}

class _BrandCard extends StatelessWidget {
  const _BrandCard({
    required this.customer,
  });

  final AppCustomerUser? customer;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(14, 14, 14, 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFFE6007E), Color(0xFFFF5A1F), Color(0xFFFFBC00)],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            'assets/klarando_logo_wordmark.png',
            height: 30,
            alignment: Alignment.centerLeft,
            fit: BoxFit.contain,
          ),
          const SizedBox(height: 6),
          Text(
            customer == null
                ? 'Mit deinem Konto noch schneller bestellen.'
                : 'Willkommen zurück, ${customer!.fullName}.',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

class _InfoLine extends StatelessWidget {
  const _InfoLine({
    required this.label,
    required this.value,
    required this.onCopy,
  });

  final String label;
  final String value;
  final VoidCallback onCopy;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE5E7EB)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Color(0xFF6B7280),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 2),
                SelectableText(
                  value,
                  style: const TextStyle(
                    fontSize: 13,
                    color: Color(0xFF111827),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            tooltip: 'Kopieren',
            onPressed: onCopy,
            icon: const Icon(Icons.copy_rounded, size: 18),
          ),
        ],
      ),
    );
  }
}

String _deriveNameFromEmail(String email) {
  final trimmed = email.trim();
  if (trimmed.isEmpty || !trimmed.contains('@')) {
    return '';
  }
  final localPart = trimmed.split('@').first;
  if (localPart.isEmpty) {
    return '';
  }
  final cleaned = localPart.replaceAll(RegExp(r'[._\-]+'), ' ').trim();
  if (cleaned.isEmpty) {
    return '';
  }
  return cleaned
      .split(' ')
      .where((entry) => entry.trim().isNotEmpty)
      .map((entry) => '${entry[0].toUpperCase()}${entry.substring(1).toLowerCase()}')
      .join(' ');
}

String _normalizeLanguageCode(String value) {
  if (value == 'en' || value == 'tr') {
    return value;
  }
  return 'de';
}

String _formatDateTime(DateTime value) {
  final local = value.toLocal();
  final day = local.day.toString().padLeft(2, '0');
  final month = local.month.toString().padLeft(2, '0');
  final year = local.year.toString();
  final hour = local.hour.toString().padLeft(2, '0');
  final minute = local.minute.toString().padLeft(2, '0');
  return '$day.$month.$year $hour:$minute';
}

extension on AppCustomerUser {
  String updatedAtLabel() {
    final deletion = deletionRequestedAt;
    return [
      id,
      fullName,
      phone ?? '',
      street ?? '',
      zipCode ?? '',
      city ?? '',
      marketingOptIn ? '1' : '0',
      deletion?.toIso8601String() ?? '',
    ].join('|');
  }
}
