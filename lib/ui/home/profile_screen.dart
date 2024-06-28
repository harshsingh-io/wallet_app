import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallet_app/logic/providers/wallet_provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final walletProvider = Provider.of<WalletProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            color: Colors.redAccent,
            onPressed: () async {
              await walletProvider.logout();
              // Navigate to the login screen
              Navigator.of(context).pushReplacementNamed('/login');
            },
          ),
        ],
      ),
      body: Center(
        child: Consumer<WalletProvider>(
          builder: (context, provider, child) {
            return provider.isLoading
                ? const CircularProgressIndicator()
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const CircleAvatar(
                        radius: 50,
                        child: Icon(Icons.person),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        provider.username ?? '',
                        style: const TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        provider.email ?? '',
                        style: const TextStyle(fontSize: 16),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'First Name: ${provider.firstName ?? ''}',
                        style: const TextStyle(fontSize: 16),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Last Name: ${provider.lastName ?? ''}',
                        style: const TextStyle(fontSize: 16),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Wallet Address: ${provider.walletAddress != '' ? provider.walletAddress : 'Wallet Not created yet.'}',
                        style: const TextStyle(fontSize: 16),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Last Login: ${provider.lastLogin}',
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  );
          },
        ),
      ),
    );
  }
}
