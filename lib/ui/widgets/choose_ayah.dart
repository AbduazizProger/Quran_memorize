import 'package:flutter/material.dart';
import 'package:quran_app/models/surah_model.dart';
import 'package:quran_app/ui/widgets/choose_reciter.dart';
import 'package:quran_app/ui/widgets/listen_button.dart';
import 'package:quran_app/ui/widgets/number_of_ayahs.dart';

class ChooseAyah extends StatefulWidget {
  const ChooseAyah({super.key, required this.surahNames, required this.index});

  final List<SurahName> surahNames;
  final int index;

  @override
  State<ChooseAyah> createState() => _ChooseAyahState();
}

class _ChooseAyahState extends State<ChooseAyah> {
  final fromController = TextEditingController();
  final toController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fromController.text = '1';
    toController.text = '${widget.surahNames[widget.index].numberOfAyahs}';
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 511,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            NumberOfAyahs(
              widget: widget,
              fromController: fromController,
              toController: toController,
            ),
            const ChooseReciter(),
            ListenButton(
              toController: toController,
              fromController: fromController,
              index: widget.index,
              surahNames: widget.surahNames,
            ),
          ],
        ),
      ),
    );
  }
}
