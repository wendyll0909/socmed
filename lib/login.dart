import 'package:flutter/material.dart';
import 'socialmedia.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _usernameCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();

  String _errorMessage = '';
  bool _isError = false;

  void _checkLogin() {
    setState(() {
      if (_usernameCtrl.text.isEmpty) {
        _errorMessage = 'Please input your username!';
        _isError = true;
      } else if (_passwordCtrl.text.isEmpty) {
        _errorMessage = 'Please input your password';
        _isError = true;
      } else {
        _errorMessage = '';
        _isError = false;
      }
    });

    if (!_isError) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const SocialMedia()),
      );
    }
  }

  @override
  void dispose() {
    _usernameCtrl.dispose();
    _passwordCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const txtStyle = TextStyle(fontWeight: FontWeight.bold, letterSpacing: 2, fontSize: 14);
    const txtStyle2 = TextStyle(fontWeight: FontWeight.bold, letterSpacing: 2, fontSize: 24, color: Colors.white);
    const errorStyle = TextStyle(fontWeight: FontWeight.bold, letterSpacing: 2, fontSize: 14, color: Colors.red);

    return Scaffold(
      body: Center(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/logo.png', height: 48, width: 48),
                  const SizedBox(width: 12),
                  const Text('TIKTOK', style: txtStyle),
                ],
              ),
              const SizedBox(height: 30),
              TextField(
                controller: _usernameCtrl,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Enter Username",
                  prefixIcon: Icon(Icons.person),
                ),
              ),
              const SizedBox(height: 15),
              TextField(
                controller: _passwordCtrl,
                obscureText: true,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Enter Password",
                  prefixIcon: Icon(Icons.lock),
                ),
              ),
              const SizedBox(height: 15),
              if (_isError)
                Text(_errorMessage, style: errorStyle)
              else
                const SizedBox(height: 15),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                  backgroundColor: Colors.blue,
                ),
                onPressed: _checkLogin,
                child: const Text('LOGIN', style: txtStyle2),
              ),
            ],
          ),
        ),
      ),
    );
  }
}