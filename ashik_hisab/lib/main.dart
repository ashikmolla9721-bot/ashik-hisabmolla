import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('bn_BD', null);
  runApp(const AshikHisabApp());
}

class AshikHisabApp extends StatelessWidget {
  const AshikHisabApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'আশিক হিসাব',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        scaffoldBackgroundColor: const Color(0xFFF8F9FA),
        fontFamily: 'Roboto',
      ),
      home: const HomeScreen(),
    );
  }
}
