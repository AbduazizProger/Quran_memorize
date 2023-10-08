// ignore_for_file: non_constant_identifier_names
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran_app/models/surah_model.dart';
import 'package:quran_app/models/theme_changer.dart';
import 'package:quran_app/ui/widgets/surah_name_widget.dart';

class SurahNamesPage extends StatelessWidget {
  const SurahNamesPage({super.key, required this.surah_names});

  final List<SurahName> surah_names;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        ListView.builder(
          itemCount: surah_names.length,
          itemBuilder: (context, index) {
            if (index == 0) {
              return Column(
                children: [
                  const SizedBox(height: 220),
                  SurahNameWidget(surah_names: surah_names, index: index),
                ],
              );
            } else {
              return SurahNameWidget(surah_names: surah_names, index: index);
            }
          },
        ),
        Container(
          height: 220,
          color: context.watch<ThemeDefiner>().themeMode.name == 'light'
              ? Colors.white
              : const Color.fromARGB(255, 31, 31, 31),
        ),
        Container(
          margin: const EdgeInsets.all(10),
          height: 200,
          decoration: BoxDecoration(
            color: Colors.blueGrey,
            borderRadius: BorderRadius.circular(25),
          ),
          child: const Center(
            child: Text(
              'أَعُوْذُ بِاللّٰهِ مِنَ الشَّيْطٰانِ الرَّجِيْمِ\nبِسْمِ اللَّهِ الرَّحْمَنِ الرَّحِيم',
              textAlign: TextAlign.center,
              style: TextStyle(
                height: 2,
                fontSize: 30,
                color: Colors.black,
                fontFamily: 'ScheherazadeNew',
              ),
            ),
          ),
        ),
      ],
    );
  }
}
