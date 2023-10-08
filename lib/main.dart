import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:quran_app/models/reciters_model.dart';
import 'package:quran_app/ui/pages/home_page.dart';
import 'package:quran_app/models/theme_changer.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  ThemeMode themeMode;
  if (prefs.getBool('isDark') ?? false) {
    themeMode = ThemeMode.dark;
  } else {
    themeMode = ThemeMode.light;
  }
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ThemeDefiner(themeMode: themeMode, prefs: prefs),
        ),
        ChangeNotifierProvider(
          create: (_) => RecitersModel(),
        ),
        Provider(create: (_) => prefs),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeDefiner>(builder: (context, themeDefiner, child) {
      return MaterialApp(
        title: 'Quran',
        debugShowCheckedModeBanner: false,
        darkTheme: ThemeData.dark(useMaterial3: true),
        theme: ThemeData(
          useMaterial3: true,
        ),
        themeMode: themeDefiner.themeMode,
        home: const HomePage(),
      );
    });
  }
}
