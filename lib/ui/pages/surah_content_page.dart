import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:quran_app/models/ayah_model.dart';
import 'package:quran_app/models/reciters_model.dart';
import 'package:quran_app/functions/define_zeros.dart';
import 'package:quran_app/ui/widgets/ayah_content.dart';

class SurahContentPage extends StatefulWidget {
  const SurahContentPage({
    super.key,
    required this.surahNumber,
    required this.pageNumber,
    required this.surahName,
    required this.startNumber,
  });

  final int surahNumber;
  final String surahName;
  final int startNumber;
  final int pageNumber;

  @override
  State<SurahContentPage> createState() => _SurahContentPageState();
}

class _SurahContentPageState extends State<SurahContentPage> {
  int number = 1;
  List<Ayah> ayahs = [];
  bool isPlaying = true;
  bool isComplete = false;
  late RecitersModel reciterUrl;
  final audioPlayer = AudioPlayer();
  Future<void> fetchSurahContent() async {
    final json = await rootBundle.loadString(
      'assets/json/surah_${widget.surahNumber}.json',
    );
    final surahNamesMap = (jsonDecode(json) as Map<String, dynamic>)['data'];
    for (int i = 0; i < widget.pageNumber; i++) {
      ayahs.add(Ayah.fromJson(surahNamesMap['ayahs'][i]));
    }
  }

  @override
  void initState() {
    super.initState();
    number = widget.startNumber;
    fetchSurahContent().then((_) {
      setState(() {});
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    reciterUrl = context.watch<RecitersModel>();
    audioPlayer.play(UrlSource(
      '${reciterUrl.audioUrl}${define_zeros(widget.surahNumber)}${define_zeros(number)}.mp3',
    ));
    audioPlayer.onPlayerComplete.listen((_) {
      if (ayahs.length != number) {
        number++;
        audioPlayer.play(UrlSource(
          '${reciterUrl.audioUrl}${define_zeros(widget.surahNumber)}${define_zeros(number)}.mp3',
        ));
        setState(() {});
      } else {
        isPlaying = false;
        isComplete = true;
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    audioPlayer.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          '${widget.surahName} ($number)',
          style: const TextStyle(fontFamily: 'ScheherazadeNew'),
        ),
        actions: [
          IconButton(
            onPressed: () {
              if (isPlaying) {
                audioPlayer.pause();
              } else {
                if (isComplete) {
                  number = widget.startNumber;
                }
                audioPlayer.play(UrlSource(
                  '${reciterUrl.audioUrl}${define_zeros(widget.surahNumber)}${define_zeros(number)}.mp3',
                ));
              }
              isPlaying = !isPlaying;
              setState(() {});
            },
            icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow_rounded),
          ),
        ],
      ),
      body: AyahContent(ayahs: ayahs, number: number),
    );
  }
}
