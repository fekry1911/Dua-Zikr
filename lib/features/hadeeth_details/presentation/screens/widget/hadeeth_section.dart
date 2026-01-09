import 'package:flutter/cupertino.dart';

import '../../../../../core/theme/text_theme/text_style.dart';

class Section extends StatelessWidget {
  final String title;
  final String content;

  const Section({
    required this.title,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: AppTextStyle.font14BlackBold),
          const SizedBox(height: 6),
          Text(
            content,
            style: AppTextStyle.font11GreyBold.copyWith(
              letterSpacing: 1,
              height: 2.5,
            ),
          ),
        ],
      ),
    );
  }
}
