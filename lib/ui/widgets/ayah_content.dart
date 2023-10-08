import 'package:flutter/material.dart';
import 'package:quran_app/models/ayah_model.dart';

class AyahContent extends StatelessWidget {
  const AyahContent({super.key, required this.ayahs, required this.number});

  final List<Ayah> ayahs;
  final int number;

  @override
  Widget build(BuildContext context) {
    String text = '';
    if (ayahs.isNotEmpty) {
      text = ayahs[number - 1].text;
      if (number == 1) {
        if (ayahs[0].text != 'بِسۡمِ ٱللَّهِ ٱلرَّحۡمَـٰنِ ٱلرَّحِیمِ\n') {
          try {
            if (ayahs[number - 1]
                .text
                .contains('بِسۡمِ ٱللَّهِ ٱلرَّحۡمَـٰنِ ٱلرَّحِیمِ')) {
              text = ayahs[0]
                  .text
                  .split('بِسۡمِ ٱللَّهِ ٱلرَّحۡمَـٰنِ ٱلرَّحِیمِ')[1];
            }
          } catch (e) {
            if (ayahs[number - 1]
                .text
                .contains('بِّسۡمِ ٱللَّهِ ٱلرَّحۡمَـٰنِ ٱلرَّحِیمِ')) {
              text = ayahs[0]
                  .text
                  .split('بِّسۡمِ ٱللَّهِ ٱلرَّحۡمَـٰنِ ٱلرَّحِیمِ')[1];
            }
          }
        }
      }
    }
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Center(
        child: SingleChildScrollView(
          child: Text(
            ayahs.isEmpty ? '' : text,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 35,
              height: 2,
              fontFamily: 'ScheherazadeNew',
            ),
          ),
        ),
      ),
    );
  }
}
