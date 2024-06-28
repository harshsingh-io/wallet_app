import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // For status bar color
import 'package:provider/provider.dart';
import 'package:wallet_app/logic/providers/wallet_provider.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle.light); // Set status bar text color to light

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: () => Navigator.pushReplacementNamed(context, '/home'),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Spacer(),
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                hintText: 'Username or email',
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Password',
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                suffixIcon: Icon(Icons.visibility_off),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  // Forgot password event
                },
                child: Text(
                  'Forgot Password?',
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            ),
            Consumer<WalletProvider>(
              builder: (context, provider, child) {
                return provider.isLoading
                    ? const CircularProgressIndicator()
                    : Column(
                        children: [
                          ElevatedButton(
                            onPressed: () async {
                              try {
                                await provider.login(
                                  _usernameController.text,
                                  _passwordController.text,
                                );
                                Navigator.pushReplacementNamed(
                                    context, '/home');
                              } catch (error) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('Login failed: $error'),
                                  ),
                                );
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Colors.black, // Button color
                              onPrimary: Colors.white, // Text color
                              minimumSize:
                                  Size(double.infinity, 50), // Button size
                            ),
                            child: const Text('Login'),
                          ),
                          const SizedBox(height: 10),
                          Text('OR', style: TextStyle(color: Colors.black54)),
                          const SizedBox(height: 10),
                          OutlinedButton.icon(
                            icon: Image.network(
                                'https://cdn4.iconfinder.com/data/icons/logos-brands-7/512/google_logo-google_icongoogle-512.png',
                                width: 24,
                                height: 24), // Google icon image
                            label: Text('Sign in with Google'),
                            onPressed: () {
                              // Google sign-in logic
                            },
                            style: OutlinedButton.styleFrom(
                              primary: Colors.grey, // Text color
                              side: BorderSide(
                                  color: Colors.grey,
                                  width: 1), // Border color and width
                              minimumSize:
                                  Size(double.infinity, 50), // Button size
                            ),
                          ),
                        ],
                      );
              },
            ),
            Spacer(),
            Align(
              alignment: Alignment.center,
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/signup');
                },
                child: Text(
                  'Don’t have an account? Sign Up',
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
