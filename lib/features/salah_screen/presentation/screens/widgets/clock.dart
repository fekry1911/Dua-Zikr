import 'package:animated_analog_clock/animated_analog_clock.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ClockWidget extends StatelessWidget {
  const ClockWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return                   AnimatedAnalogClock(
      backgroundImage: AssetImage("assets/images/clock.jpg"),
      clock: () => DateTime.now(),
      hourHandColor: Colors.teal,
      minuteHandColor: Colors.teal,
      secondHandColor: Colors.amber,
      centerDotColor: Colors.teal,
      hourDashColor: Colors.teal,
      minuteDashColor: Colors.teal.shade400,
      dialType: DialType.numberAndDashes,
      numberColor: Colors.teal,
      showSecondHand: true,
      extendSecondHand: true,
      extendMinuteHand: true,
      extendHourHand: true,
      updateInterval: Duration(seconds: 1),
    );
  }
}
