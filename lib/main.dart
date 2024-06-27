import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallet_app/logic/providers/wallet_provider.dart';
import 'package:wallet_app/logic/services/api_service_manager.dart';
import 'package:wallet_app/ui/home/home_screen.dart';
import 'package:wallet_app/ui/login_screen.dart';
import 'package:wallet_app/ui/splash_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  final apiServiceManager = ApiServiceManager();

  runApp(
    ChangeNotifierProvider(
      create: (context) => WalletProvider(apiServiceManager),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
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
            return Center(child: CircularProgressIndicator());
          }
          return HomeScreen();
        },
      ),
      routes: {
        '/home': (context) => HomeScreen(),
        '/login': (context) => LoginScreen(),
      },
    );
  }
}
