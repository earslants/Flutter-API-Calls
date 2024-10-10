import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'view/authentication/splash/view/splash_view.dart';
import 'package:provider/provider.dart';
import 'core/init/notifier/provider_list.dart';

Future<void> main() async {
  await _init();
  runApp(MultiProvider(
    providers: [...ApplicationProvider.instance.dependItems],
    child: const MyApp(),
  ));
}

Future<void> _init() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Harry Potter',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SplashView(),
    );
  }
}
