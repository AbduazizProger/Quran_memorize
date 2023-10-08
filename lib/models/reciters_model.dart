import 'package:flutter/material.dart';
import 'package:quran_app/functions/generate_url.dart';

class RecitersModel extends ChangeNotifier {
  String reciterName = 'Al Husary';
  String audioUrl = '';

  RecitersModel() {
    audioUrl = generateUrl(reciterName);
  }

  void changeReciter(String newReciter) {
    reciterName = newReciter;
    audioUrl = generateUrl(reciterName);
    notifyListeners();
  }
}
