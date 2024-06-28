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
        title: Text('Profile'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
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
                ? CircularProgressIndicator()
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 50,
                        child: Icon(Icons.person),
                      ),
                      SizedBox(height: 20),
                      Text(
                        provider.username ?? '',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      Text(
                        provider.email ?? '',
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'First Name: ${provider.firstName ?? ''}',
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Last Name: ${provider.lastName ?? ''}',
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Wallet Address: ${provider.walletAddress != '' ? provider.walletAddress : 'Wallet Not created yet.'}',
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Last Login: ${provider.lastLogin}',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  );
          },
        ),
      ),
    );
  }
}
