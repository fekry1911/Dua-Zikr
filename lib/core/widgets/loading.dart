import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class SharedLoading extends StatelessWidget {
  const SharedLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Lottie.asset("assets/animation/loading.json",width: 200.w,height: 200.h));
  }
}
