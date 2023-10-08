import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:quran_app/models/surah_model.dart';
import 'package:quran_app/models/theme_changer.dart';
import 'package:quran_app/ui/pages/surah_names_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<SurahName> surahNames = [];
  Future<void> fetchSurahNames() async {
    final json = await rootBundle.loadString('assets/json/surah.json');
    final surahNamesMap = (jsonDecode(json) as Map<String, dynamic>)['data'];
    for (int i = 0; i < 114; i++) {
      surahNames.add(SurahName.fromJson(surahNamesMap[i]));
    }
  }

  @override
  void initState() {
    super.initState();
    fetchSurahNames().then((_) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Al Quran',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 25,
            fontFamily: 'ScheherazadeNew',
          ),
        ),
        centerTitle: true,
        actions: [
          Consumer<ThemeDefiner>(
            builder: (context, themeDefiner, child) {
              return IconButton(
                onPressed: () {
                  themeDefiner.changeTheme();
                },
                icon: Icon(
                  themeDefiner.themeMode.name == 'light'
                      ? Icons.dark_mode_outlined
                      : Icons.light_mode,
                ),
              );
            },
          )
        ],
      ),
      body: SurahNamesPage(surah_names: surahNames),
    );
  }
}
