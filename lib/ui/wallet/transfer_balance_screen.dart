import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallet_app/logic/providers/wallet_provider.dart';

class TransferBalanceScreen extends StatefulWidget {
  const TransferBalanceScreen({super.key});

  @override
  _TransferBalanceScreenState createState() => _TransferBalanceScreenState();
}

class _TransferBalanceScreenState extends State<TransferBalanceScreen> {
  final TextEditingController _recipientController = TextEditingController();
  String _amount = "0"; // Default to '0'

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text('Send'),
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
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey[300]!),
              ),
              child: TextField(
                controller: _recipientController,
                decoration: InputDecoration(
                  labelText: 'Recipient',
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(horizontal: 10),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.qr_code_scanner),
                    onPressed: () {
                      // Open QR scanner or another relevant action
                    },
                  ),
                ),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      _amount,
                      style:
                          TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 20),
                  Table(
                    children: [
                      TableRow(
                        children: [1, 2, 3]
                            .map((item) => buildKeyPadButton(item.toString()))
                            .toList(),
                      ),
                      TableRow(
                        children: [4, 5, 6]
                            .map((item) => buildKeyPadButton(item.toString()))
                            .toList(),
                      ),
                      TableRow(
                        children: [7, 8, 9]
                            .map((item) => buildKeyPadButton(item.toString()))
                            .toList(),
                      ),
                      TableRow(
                        children: [
                          buildKeyPadButton('.'),
                          buildKeyPadButton('0'),
                          buildKeyPadButton('<', icon: Icons.backspace),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () async {
                      final walletProvider =
                          Provider.of<WalletProvider>(context, listen: false);
                      try {
                        await walletProvider.transferBalance(
                          _recipientController.text,
                          walletProvider.walletAddress!,
                          double.parse(_amount),
                          '123456', // Example pin
                          'devnet',
                        );
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Transfer successful')),
                        );
                      } catch (error) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Transfer failed: $error')),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black, // Button color
                      onPrimary: Colors.white, // Text color
                      minimumSize: Size(double.infinity, 50), // Button size
                    ),
                    child: const Text('Send'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildKeyPadButton(String label, {IconData? icon}) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        setState(() {
          if (icon == Icons.backspace) {
            _amount = _amount.length > 1
                ? _amount.substring(0, _amount.length - 1)
                : "0";
          } else if (_amount == "0" && label != ".") {
            _amount = label;
          } else if (!(_amount.contains('.') && label == '.')) {
            _amount += label;
          }
        });
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: icon == null
              ? Text(label,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold))
              : Icon(icon, size: 24),
        ),
      ),
    );
  }
}
