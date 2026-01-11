import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theme/colors.dart';
import '../../../data/models/adhkar_model.dart';

class ModernAdhkarCard extends StatelessWidget {
  final Adhkar adhkar;
  final int index;

  final ValueNotifier<int> counter = ValueNotifier<int>(0);

  ModernAdhkarCard({
    super.key,
    required this.adhkar,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final int maxCount = int.tryParse(adhkar.count) ?? 1;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.06),
              blurRadius: 16,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xffEAF9FF),
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(20.r),
                ),
              ),
              child: Text(
                adhkar.content,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 18,
                  height: 1.8,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            if (adhkar.description.isNotEmpty)
              Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  adhkar.description,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey.shade700,
                  ),
                ),
              ),

            const Divider(height: 1),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: ValueListenableBuilder<int>(
                valueListenable: counter,
                builder: (context, value, _) {
                  final bool isCompleted = value >= maxCount;

                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.r),
                          color: isCompleted
                              ? Colors.green.withOpacity(.15)
                              : AppColors.avatarColor,
                        ),
                        child: Text(
                          "العدد: $value / $maxCount",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color:
                            isCompleted ? Colors.green : Colors.black87,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: isCompleted
                            ? null
                            : () {
                          counter.value++;
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          width: 56,
                          height: 56,
                          decoration: BoxDecoration(
                            color:
                            isCompleted ? Colors.green : Colors.teal,
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Text(
                              isCompleted ? "تم" : "اضغط",
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    )
        .animate()
        .fadeIn(duration: 400.ms)
        .slideY(begin: .15);
  }
}
