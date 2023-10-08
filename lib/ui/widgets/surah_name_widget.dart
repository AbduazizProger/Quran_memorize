// ignore_for_file: non_constant_identifier_names
import 'package:flutter/material.dart';
import 'package:quran_app/models/surah_model.dart';
import 'package:quran_app/ui/widgets/choose_ayah.dart';

class SurahNameWidget extends StatelessWidget {
  const SurahNameWidget({
    super.key,
    required this.surah_names,
    required this.index,
  });

  final List<SurahName> surah_names;
  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          builder: (context) {
            return ChooseAyah(surahNames: surah_names, index: index);
          },
        );
      },
      child: Container(
        margin: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text(
                  '${surah_names[index].number}',
                  style: const TextStyle(
                    fontSize: 23,
                    fontFamily: 'ScheherazadeNew',
                  ),
                ),
                const SizedBox(width: 15),
                Text(
                  surah_names[index].englishName,
                  style: const TextStyle(
                    fontSize: 23,
                    fontFamily: 'ScheherazadeNew',
                  ),
                ),
              ],
            ),
            Text(
              surah_names[index].name,
              style: const TextStyle(
                fontSize: 23,
                fontFamily: 'ScheherazadeNew',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
