import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran_app/models/reciters_model.dart';

class ReciterName extends StatelessWidget {
  const ReciterName({
    super.key,
    required this.reciterName,
  });

  final String reciterName;

  @override
  Widget build(BuildContext context) {
    final recitersModel = context.watch<RecitersModel>();
    bool isSelected = reciterName != recitersModel.reciterName;
    return GestureDetector(
      onTap: () {
        recitersModel.changeReciter(reciterName);
      },
      child: Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(13),
          border: Border.all(
            color: isSelected ? Colors.white70 : Colors.red,
            width: 3,
          ),
        ),
        child: Text(
          reciterName,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
