import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PrayerItem {
  final String name;
  final String time;
  final IconData icon;

  PrayerItem({
    required this.name,
    required this.time,
    required this.icon,
  });
}
class PrayerRow extends StatelessWidget {
  final PrayerItem prayer;
  final String current;


  const PrayerRow({super.key, required this.prayer, required this.current});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      margin: const EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
        color: current == prayer.name
            ? Colors.teal.withOpacity(0.15)
            : Colors.transparent,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Text(
            prayer.time,
            style: TextStyle(
              fontSize: 16,
              fontWeight:
              current == prayer.name ? FontWeight.bold : FontWeight.normal,
              color: current == prayer.name ? Colors.teal : Colors.grey,
            ),
          ),

          const Spacer(),

          // اسم الصلاة
          Text(
            prayer.name,
            style: TextStyle(
              fontSize: 16,
              fontWeight:
              current == prayer.name ? FontWeight.bold : FontWeight.normal,
              color: current == prayer.name ? Colors.teal : Colors.grey,
            ),
          ),

          const SizedBox(width: 8),

          // الأيقونة
          Icon(
            prayer.icon,
            size: 20,
            color: current == prayer.name ? Colors.teal : Colors.grey,
          ),
        ],
      ),
    );
  }
}
