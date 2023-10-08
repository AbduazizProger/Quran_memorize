import 'package:flutter/material.dart';
import 'package:quran_app/ui/widgets/choose_ayah.dart';

class NumberOfAyahs extends StatelessWidget {
  const NumberOfAyahs({
    super.key,
    required this.widget,
    required this.fromController,
    required this.toController,
  });

  final ChooseAyah widget;
  final TextEditingController fromController;
  final TextEditingController toController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Text(
            '${widget.surahNames[widget.index].englishName} - ${widget.surahNames[widget.index].name}',
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              fontFamily: 'ScheherazadeNew',
            ),
          ),
        ),
        Text(
          'From (1-${widget.surahNames[widget.index].numberOfAyahs}):',
          style: const TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: fromController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        ),
        Text(
          'To (1-${widget.surahNames[widget.index].numberOfAyahs}):',
          style: const TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: toController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
