import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quran_app/models/surah_model.dart';
import 'package:quran_app/ui/pages/surah_content_page.dart';

class ListenButton extends StatefulWidget {
  const ListenButton({
    super.key,
    required this.toController,
    required this.fromController,
    required this.index,
    required this.surahNames,
  });

  final int index;
  final List<SurahName> surahNames;
  final TextEditingController toController;
  final TextEditingController fromController;

  @override
  State<ListenButton> createState() => _ListenButtonState();
}

class _ListenButtonState extends State<ListenButton> {
  bool hasError = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            hasError
                ? 'Please enter between 1 and ${widget.surahNames[widget.index].numberOfAyahs} (both inputs) and be sure "From" is not geater than "To" !'
                : '',
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w700,
              color: Colors.redAccent,
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            if (int.parse(widget.fromController.text) > 0 &&
                int.parse(widget.fromController.text) <=
                    widget.surahNames[widget.index].numberOfAyahs &&
                int.parse(widget.toController.text) > 0 &&
                int.parse(widget.toController.text) <=
                    widget.surahNames[widget.index].numberOfAyahs &&
                int.parse(widget.fromController.text) <=
                    int.parse(widget.toController.text)) {
              Navigator.of(context).pop();
              Navigator.of(context).push(CupertinoPageRoute(builder: (_) {
                return SurahContentPage(
                  surahNumber: widget.index + 1,
                  surahName: widget.surahNames[widget.index].englishName,
                  startNumber: int.parse(widget.fromController.text),
                  pageNumber: int.parse(widget.toController.text),
                );
              }));
            } else {
              hasError = true;
              setState(() {});
            }
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.deepPurple,
            ),
            child: const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 7,
              ),
              child: Text(
                'Listen',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
