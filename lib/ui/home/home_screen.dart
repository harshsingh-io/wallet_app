import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallet_app/logic/providers/wallet_provider.dart';
import 'package:wallet_app/ui/home/profile_screen.dart';
import 'package:wallet_app/ui/home/wallet_screen.dart';
import 'package:wallet_app/ui/login/login_screen.dart';
import 'package:wallet_app/ui/wallet/wallet_onboard_screen.dart'; // Ensure you have a WelcomeScreen

import 'package:wallet_app/ui/widgets/sa_button.dart';
import 'home_page.dart';
import 'vible_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  List<Widget> _pages =
      <Widget>[]; // Moved from static final for conditional loading

  @override
  void initState() {
    super.initState();
    _loadPages();
  }

  void _loadPages() {
    final walletProvider = Provider.of<WalletProvider>(context, listen: false);
    _pages = [
      const HomePage(),
      const ViblePage(),
      walletProvider.walletAddress == ''
          ? const WalletOnboardScreen()
          : const WalletScreen(),
      const ProfileScreen(),
    ];
  }

  void _onItemTapped(int index) {
    final provider = Provider.of<WalletProvider>(context, listen: false);

    if (index == 2 || index == 3) {
      if (!provider.isLoggedIn) {
        showModalBottomSheet(
          context: context,
          builder: (context) => BottomSheet(
            onClosing: () {},
            builder: (context) => Container(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'You need to be logged in to access this section',
                    style: TextStyle(fontSize: 18.0),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: 350,
                    child: SAButton.primary(
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()),
                        );
                      },
                      label: 'Sign In',
                    ),
                  )
                ],
              ),
            ),
          ),
        );
        return;
      } else {
        _loadPages(); // Refresh the pages to check for changes in the wallet status
      }
    }

    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _pages.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.video_library),
            label: 'Vible',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet),
            label: 'Wallet',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
