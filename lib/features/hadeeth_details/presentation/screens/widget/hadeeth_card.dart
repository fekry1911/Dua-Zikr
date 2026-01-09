import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../core/theme/text_theme/text_style.dart';

class MainHadeethCard extends StatelessWidget {
  final String text;

  const MainHadeethCard({required this.text});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Text(
          text,
          style: AppTextStyle.font16BlackBold.copyWith(
            height: 1.9,
          ),
          textAlign: TextAlign.justify,
        ),
      ),
    );
  }
}
