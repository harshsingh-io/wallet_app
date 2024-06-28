import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallet_app/logic/providers/wallet_provider.dart';
import 'package:wallet_app/ui/widgets/sa_button.dart';

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
            icon: const Icon(Icons.settings),
            onPressed: () {
              // Implement settings navigation or functionality
            },
          ),
          IconButton(
            icon: const Icon(Icons.logout),
            color: Colors.redAccent,
            onPressed: () async {
              await walletProvider.logout();
              // Navigate to the login screen
              Navigator.of(context).pushReplacementNamed('/home');
            },
          ),
        ],
      ),
      body: Center(
        child: Consumer<WalletProvider>(
          builder: (context, provider, child) {
            return provider.isLoading
                ? const CircularProgressIndicator()
                : SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 20),
                        CircleAvatar(
                          radius: 64,
                          backgroundImage: NetworkImage(provider
                                  .profilePictureUrl ??
                              'https://picsum.photos/200'), // Placeholder image URL
                        ),
                        const SizedBox(height: 20),
                        Text(
                          provider.username ?? '',
                          style: const TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: const [
                            Text('0\nFollowing', textAlign: TextAlign.center),
                            Text('0\nFollowers', textAlign: TextAlign.center),
                            Text('0\nPosts', textAlign: TextAlign.center),
                          ],
                        ),
                        const SizedBox(height: 20),
                        SizedBox(
                          width: 410,
                          child: SAButton.primary(
                            onPressed: () {
                              // Implement edit profile navigation or functionality
                            },
                            label: 'Edit Profile',
                          ),
                        ),
                        const SizedBox(height: 20),
                        DefaultTabController(
                          length: 2,
                          child: Column(
                            children: <Widget>[
                              const TabBar(
                                indicatorColor: Colors.red,
                                labelColor: Colors.red,
                                tabs: [
                                  Tab(text: 'Posts'),
                                  Tab(text: 'Liked'),
                                ],
                              ),
                              Container(
                                height: 300, // Fixed height for the tab view
                                child: const TabBarView(
                                  children: [
                                    Center(child: Text('No Post')),
                                    Center(child: Text('Nothing to show')),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
          },
        ),
      ),
    );
  }
}
