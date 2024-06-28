import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallet_app/logic/providers/wallet_provider.dart';

class CreateWalletScreen extends StatefulWidget {
  const CreateWalletScreen({super.key});

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
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text('Create Wallet'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _walletNameController,
              decoration: InputDecoration(
                labelText: 'Wallet Name',
                hintText: 'Eg. Jack\'s Wallet',
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _userPinController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Pincode',
                hintText: 'Eg. 6-digit numeric pin',
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
                suffixIcon: IconButton(
                  icon: Icon(Icons.visibility_off),
                  onPressed: () {
                    // Toggle pin visibility
                  },
                ),
              ),
            ),
            Spacer(),
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
                    const SnackBar(
                        content: Text('Wallet created successfully')),
                  );
                  Navigator.pop(context);
                } catch (error) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Failed to create wallet: $error')),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.black, // Button color
                onPrimary: Colors.white, // Text color
                minimumSize: Size(double.infinity, 50), // Button size
              ),
              child: const Text('Create'),
            ),
          ],
        ),
      ),
    );
  }
}
