import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:wallet_app/ui/create_wallet_screen.dart';
import 'package:wallet_app/logic/providers/wallet_provider.dart';
import 'package:wallet_app/ui/transfer_balance_screen.dart';

Logger log = Logger(
  printer: PrettyPrinter(),
);

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wallet'),
      ),
      body: Center(
        child: Consumer<WalletProvider>(
          builder: (context, provider, child) {
            return provider.isLoading
                ? const CircularProgressIndicator()
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
                                builder: (context) => const CreateWalletScreen()),
                          );
                        },
                        child: const Text('Create Wallet'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => TransferBalanceScreen()),
                          );
                        },
                        child: const Text('Transfer Balance'),
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
                        child: const Text('Refresh Balance'),
                      ),
                    ],
                  );
          },
        ),
      ),
    );
  }
}
