import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallet_app/logic/providers/wallet_provider.dart';
import 'package:wallet_app/ui/login_screen.dart';
import 'package:wallet_app/ui/home/wallet_screen.dart';
import 'home_page.dart';
import 'vible_page.dart';
import 'profile_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  static List<Widget> _pages = <Widget>[
    HomePage(),
    ViblePage(),
    WalletScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    final provider = Provider.of<WalletProvider>(context, listen: false);

    if (index == 2 || index == 3) {
      if (!provider.isLoggedIn) {
        showModalBottomSheet(
          context: context,
          builder: (context) => BottomSheet(
            onClosing: () {},
            builder: (context) => Container(
              padding: EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'You need to be logged in to access this section',
                    style: TextStyle(fontSize: 18.0),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                      );
                    },
                    child: Text('Sign In'),
                  ),
                ],
              ),
            ),
          ),
        );
        return;
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
        selectedItemColor: Colors.amber[800],
        unselectedItemColor: Colors.grey[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
