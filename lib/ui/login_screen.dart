import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:wallet_app/logic/providers/wallet_provider.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(labelText: 'Username or email'),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            Consumer<WalletProvider>(
              builder: (context, provider, child) {
                return provider.isLoading
                    ? CircularProgressIndicator()
                    : ElevatedButton(
                        onPressed: () async {
                          try {
                            await provider.login(
                              _usernameController.text,
                              _passwordController.text,
                            );
                            Navigator.pushReplacementNamed(context, '/home');
                          } catch (error) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Login failed: $error'),
                              ),
                            );
                          }
                        },
                        child: Text('Login'),
                      );
              },
            ),
          ],
        ),
      ),
    );
  }
}
