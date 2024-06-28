import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:wallet_app/ui/create_wallet_screen.dart';
import 'package:wallet_app/ui/login_screen.dart';
import 'package:wallet_app/logic/providers/wallet_provider.dart';
import 'package:wallet_app/ui/transfer_balance_screen.dart';

Logger log = Logger(
  printer: PrettyPrinter(),
);

class WalletScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wallet'),
      ),
      body: Center(
        child: Consumer<WalletProvider>(
          builder: (context, provider, child) {
            return provider.isLoading
                ? CircularProgressIndicator()
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                          'Total Balance: \$${provider.balance.toStringAsFixed(2)}'),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CreateWalletScreen()),
                          );
                        },
                        child: Text('Create Wallet'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => TransferBalanceScreen()),
                          );
                        },
                        child: Text('Transfer Balance'),
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          try {
                            await provider.retrieveBalance(
                                provider.walletAddress!, 'devnet');
                          } catch (error) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content:
                                    Text('Failed to retrieve balance: $error'),
                              ),
                            );
                          }
                        },
                        child: Text('Refresh Balance'),
                      ),
                    ],
                  );
          },
        ),
      ),
    );
  }
}
