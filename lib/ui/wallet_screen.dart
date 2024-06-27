import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:wallet_app/ui/login_screen.dart';
import 'create_wallet_screen.dart';
import 'transfer_balance_screen.dart';
import 'package:wallet_app/providers/wallet_provider.dart';

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
            log.t('Balance -----------------------> ${provider.balance}');
            if (!provider.isLoggedIn) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              });
              return CircularProgressIndicator();
            }
            return provider.isLoading
                ? CircularProgressIndicator()
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      provider.balance == 0.0
                          ? Text(
                              'Total Balance: \$${provider.balance.toStringAsFixed(2)}')
                          : Text('Total Balance: \5'),
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
                          if (provider.walletAddress != null &&
                              provider.walletAddress!.isNotEmpty) {
                            try {
                              await provider.retrieveBalance(
                                  'devnet', provider.walletAddress!);
                            } catch (error) {
                              if (error.toString().contains(
                                  'Unauthorized. Please log in again.')) {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginScreen()),
                                );
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                        'Failed to retrieve balance: $error'),
                                  ),
                                );
                              }
                            }
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Wallet address is missing.'),
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
