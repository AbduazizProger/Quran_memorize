import 'package:flutter/material.dart';
import 'package:quran_app/ui/widgets/reciter_name.dart';

class ChooseReciter extends StatelessWidget {
  const ChooseReciter({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(left: 16, right: 16, top: 14),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ReciterName(reciterName: 'Al Husary'),
              ReciterName(reciterName: 'Al Mishary'),
              ReciterName(reciterName: 'Abdulbasit'),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ReciterName(reciterName: 'As Sudais'),
              ReciterName(reciterName: 'Al Minshawy'),
              ReciterName(reciterName: 'Ash Shuraym'),
            ],
          ),
        ],
      ),
    );
  }
}
