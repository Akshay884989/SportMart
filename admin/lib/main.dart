import 'package:admin/screens/dashboard.dart';

import 'package:flutter/material.dart';

import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  await Supabase.initialize(
    url: 'https://kgdbanonuokzttgsozaf.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImtnZGJhbm9udW9renR0Z3NvemFmIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzcxNzY1MjMsImV4cCI6MjA1Mjc1MjUyM30.T4wRoGfTSCefPzsI6gIPvgwiBcCzZ9UtUm5878dU1aI',
  );
  runApp(const MainApp());
}

final supabase = Supabase.instance.client;

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false, home: Dashboard());
  }
}
