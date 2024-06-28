import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:wallet_app/logic/providers/wallet_provider.dart';
import 'package:wallet_app/ui/home/request_airdrop.dart';
import 'package:wallet_app/ui/wallet/transfer_balance_screen.dart';
import 'package:wallet_app/ui/widgets/sa_button.dart';

Logger log = Logger(
  printer: PrettyPrinter(),
);

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // Number of tabs
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Wallet'),
        ),
        body: Center(
          child: Consumer<WalletProvider>(
            builder: (context, provider, child) {
              return provider.isLoading
                  ? const CircularProgressIndicator()
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Card(
                          color: Colors.grey[850],
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 16,
                              top: 16,
                              bottom: 16,
                            ),
                            child: Column(
                              children: [
                                Container(
                                  height: 80,
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'Total Balance: \n \$${provider.balance.toStringAsFixed(2)}',
                                    style: const TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.centerLeft,
                                  child: Row(
                                    children: [
                                      Text(
                                        'Your Wallet Address: \n \$${provider.walletAddress}',
                                        style: const TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SizedBox(
                              width: 200,
                              child: SAButton.primary(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const TransferBalanceScreen()),
                                  );
                                },
                                label: 'Send',
                              ),
                            ),
                            SizedBox(
                              width: 200,
                              child: SAButton.primary(
                                onPressed: () async {
                                  try {
                                    await provider.retrieveBalance(
                                        provider.walletAddress!, 'devnet');
                                  } catch (error) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                            'Failed to retrieve balance: $error'),
                                      ),
                                    );
                                  }
                                },
                                label: 'Refresh Balance',
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        SizedBox(
                          width: 420, // Make the button take full width
                          child: SAButton.primary(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const RequestAirdrop()),
                              );
                            },
                            label: 'Request Airdrop',
                          ),
                        ),
                        const SizedBox(height: 16),
                        const TabBar(
                          indicatorColor: Colors.red,
                          labelColor: Colors.red,
                          tabs: [
                            Tab(text: 'Tokens'),
                            Tab(text: 'Activities'),
                          ],
                        ),
                        const Expanded(
                          child: TabBarView(
                            children: [
                              Center(child: Text('No Tokens Yet')),
                              Center(child: Text('No Activities Yet')),
                            ],
                          ),
                        ),
                      ],
                    );
            },
          ),
        ),
      ),
    );
  }
}
