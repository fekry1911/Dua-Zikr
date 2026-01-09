import 'package:dua_zekr/features/hadeeth_details/presentation/screens/widget/word_meaning.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../../../core/theme/text_theme/text_style.dart';
import '../../../data/models/hadith_detail_model.dart';

class WordsMeaningsSection extends StatelessWidget {
  final List<WordMeaning> words;

  const WordsMeaningsSection({super.key, required this.words});

  @override
  Widget build(BuildContext context) {
    if (words.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("شرح الكلمات", style: AppTextStyle.font16BlackBold),
        const SizedBox(height: 12),
        ...List.generate(
          words.length,
              (index) => WordMeaningCard(
            wordMeaning: words[index],
          )
              .animate(delay: Duration(milliseconds: index * 100))
              .fade()
              .slideX(begin: 0.1),
        ),
      ],
    );
  }
}
