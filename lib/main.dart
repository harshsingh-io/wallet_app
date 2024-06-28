import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallet_app/logic/providers/wallet_provider.dart';
import 'package:wallet_app/ui/home/home_screen.dart';
import 'package:wallet_app/ui/login_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // final apiServiceManager = ApiServiceManager();

  runApp(
    ChangeNotifierProvider(
      create: (context) => WalletProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wallet App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Consumer<WalletProvider>(
        builder: (context, provider, child) {
          if (provider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          return const HomeScreen();
        },
      ),
      routes: {
        '/home': (context) => const HomeScreen(),
        '/login': (context) => LoginScreen(),
      },
    );
  }
}
