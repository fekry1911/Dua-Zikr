import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../core/theme/text_theme/text_style.dart';
import '../../../data/models/hadith_detail_model.dart';

class WordMeaningCard extends StatelessWidget {
  final WordMeaning wordMeaning;

  const WordMeaningCard({super.key, required this.wordMeaning});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              wordMeaning.word,
              style: AppTextStyle.font14BlackBold,
            ),
            const SizedBox(height: 6),
            Text(
              wordMeaning.meaning,
              style: AppTextStyle.font11GreyBold,
            ),
          ],
        ),
      ),
    );
  }
}
