import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallet_app/logic/providers/wallet_provider.dart';

class CreateWalletScreen extends StatefulWidget {
  @override
  _CreateWalletScreenState createState() => _CreateWalletScreenState();
}

class _CreateWalletScreenState extends State<CreateWalletScreen> {
  final TextEditingController _walletNameController = TextEditingController();
  final TextEditingController _userPinController = TextEditingController();
  final String _network = 'devnet';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Wallet'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _walletNameController,
              decoration: InputDecoration(labelText: 'Wallet Name'),
            ),
            TextField(
              controller: _userPinController,
              decoration: InputDecoration(labelText: 'User Pin'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final walletProvider =
                    Provider.of<WalletProvider>(context, listen: false);
                try {
                  await walletProvider.createWallet(
                    _walletNameController.text,
                    _userPinController.text,
                    _network,
                  );
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Wallet created successfully')),
                  );
                  Navigator.pop(context);
                } catch (error) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Failed to create wallet: $error')),
                  );
                }
              },
              child: Text('Create Wallet'),
            ),
          ],
        ),
      ),
    );
  }
}
