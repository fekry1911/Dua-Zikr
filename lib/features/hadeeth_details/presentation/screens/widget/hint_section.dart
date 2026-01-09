import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../../../core/theme/text_theme/text_style.dart';

class HintsSection extends StatelessWidget {
  final List<String> hints;

  const HintsSection({super.key, required this.hints});

  @override
  Widget build(BuildContext context) {
    if (hints.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("فوائد وإشارات", style: AppTextStyle.font16BlackBold),
        const SizedBox(height: 8),
        Card(
          elevation: 1,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: List.generate(
                hints.length,
                    (index) => Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "• ",
                        style: AppTextStyle.font16BlackBold,
                      ),
                      Expanded(
                        child: Text(
                          hints[index],
                          style: AppTextStyle.font11GreyBold,
                        ),
                      ),
                    ],
                  )
                      .animate(delay: Duration(milliseconds: index * 80))
                      .fade(),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
