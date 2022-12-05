import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_switch_theme/theme_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ThemeProvider(),
        ),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, ThemeProvider themeProvider, _) => MaterialApp(
          title: 'Flutter Demo',
          theme: themeProvider.isDarkMode
              ? themeProvider.darkMode
              : themeProvider.lightMode,
          home: const MyHomePage(title: 'Flutter Demo Home Page'),
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: const Center(
        child: Text(
          '“Hard times create strong men. Strong men create good times. Good times create weak men. And, weak men create hard times.”',
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 25,
          ),
          textAlign: TextAlign.center,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => themeProvider.changeTheme(),
        child: const Icon(Icons.replay_outlined),
      ),
    );
  }
}
