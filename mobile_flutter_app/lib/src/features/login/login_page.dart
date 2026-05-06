import 'package:flutter/material.dart';

import '../../core/klarando_api.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({
    required this.baseUrl,
    super.key,
  });

  final String baseUrl;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _api = const KlarandoApi();
  final _emailController = TextEditingController(text: 'admin@plattform.local');
  final _passwordController = TextEditingController(text: 'admin123');

  bool _loading = false;
  String _message = 'Melde dich an, um geschuetzte Admin-Daten zu laden.';
  LoginResponse? _session;
  List<ManagedTenant> _managedTenants = const [];

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _login() async {
    final email = _emailController.text.trim();
    final password = _passwordController.text;
    if (email.isEmpty || password.isEmpty) {
      setState(() {
        _message = 'Bitte E-Mail und Passwort eingeben.';
      });
      return;
    }

    setState(() {
      _loading = true;
      _message = '';
    });

    try {
      final login = await _api.login(
        baseUrl: widget.baseUrl,
        email: email,
        password: password,
      );

      setState(() {
        _session = login;
        _managedTenants = const [];
        _message = 'Login erfolgreich als ${login.user.role}.';
      });
    } on ApiException catch (error) {
      setState(() {
        _session = null;
        _managedTenants = const [];
        _message = error.message;
      });
    } finally {
      if (mounted) {
        setState(() {
          _loading = false;
        });
      }
    }
  }

  Future<void> _loadTenants() async {
    final session = _session;
    if (session == null) {
      setState(() {
        _message = 'Bitte zuerst einloggen.';
      });
      return;
    }

    setState(() {
      _loading = true;
      _message = '';
    });

    try {
      final context = await _api.getAccessContext(
        baseUrl: widget.baseUrl,
        token: session.token,
      );

      setState(() {
        _managedTenants = context.tenants;
        _message = '${context.tenants.length} Filialen geladen.';
      });
    } on ApiException catch (error) {
      setState(() {
        _message = error.message;
      });
    } finally {
      if (mounted) {
        setState(() {
          _loading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final session = _session;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                children: [
                  TextField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      labelText: 'E-Mail',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: 'Passwort',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: double.infinity,
                    child: FilledButton(
                      onPressed: _loading ? null : _login,
                      child: Text(_loading ? 'Bitte warten...' : 'Einloggen'),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            _message,
            style: const TextStyle(fontSize: 13, color: Colors.black54),
          ),
          const SizedBox(height: 12),
          if (session != null)
            Card(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Session',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(height: 8),
                    Text('Name: ${session.user.name}'),
                    Text('Rolle: ${session.user.role}'),
                    Text('E-Mail: ${session.user.email}'),
                    const SizedBox(height: 12),
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton(
                        onPressed: _loading ? null : _loadTenants,
                        child: const Text('Meine Filialen laden'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          if (_managedTenants.isNotEmpty) ...[
            const SizedBox(height: 12),
            const Text(
              'Verfügbare Filialen',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 8),
            ..._managedTenants.map(
              (tenant) => Card(
                margin: const EdgeInsets.only(bottom: 8),
                child: ListTile(
                  title: Text(tenant.name),
                  subtitle: Text(tenant.email ?? 'Keine E-Mail'),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
