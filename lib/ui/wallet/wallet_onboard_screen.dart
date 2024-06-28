import 'package:flutter/material.dart';
import 'package:wallet_app/ui/widgets/sa_button.dart';

class WalletOnboardScreen extends StatelessWidget {
  const WalletOnboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(),
          Text(
            'Welcome to your Vible Wallet. Your wallet is a gateway\nto the decentralized web. You can use it to store, send,\nand receive cryptocurrencies.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(Icons.attach_money, size: 40), // Placeholder for Bitcoin
              Icon(Icons.flash_on,
                  size: 40), // Placeholder for another currency
              Icon(Icons.brightness_3,
                  size: 40), // Placeholder for another currency
            ],
          ),
          SizedBox(height: 20),
          CircleAvatar(
            radius: 60,
            backgroundColor: Colors.red,
            child: Text(
              'V',
              style: TextStyle(
                fontSize: 54,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(height: 20),
          SizedBox(
            width: 400,
            child: SAButton.primary(
              onPressed: () {
                Navigator.pushNamed(context, '/createWallet');
              },
              label: 'Create Wallet',
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
