import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

class AnimatedBackground extends StatelessWidget 
{
  	@override
  	Widget build(BuildContext context) 
  	{
      Color calmGreen = const Color(0xFF9CDCAA);
		  Color calmSand  = const Color(0xFFF3C6A5);
      Color calmPink  = const Color(0xFFF8A3A8);
      Color calmPurp  = const Color(0xFFBFB2F3);
      Color calmBlue  = const Color(0xFF96CAF7);
      Color calmTeal  = const Color(0xFFF4DCD6);

    	final tween = MultiTrackTween([
        Track("color1").add(Duration(seconds: 3),
            ColorTween(begin: calmGreen, end: calmPink)),
        Track("color2").add(Duration(seconds: 3),
            ColorTween(begin: calmSand, end: calmTeal))
    	]);

		return ControlledAnimation(
			playback: Playback.MIRROR,
			tween: tween,
			duration: tween.duration,
			builder: (context, animation) 
			{
				return Container(
					decoration: BoxDecoration(
						gradient: LinearGradient(
							begin: Alignment.topLeft,
							end: Alignment.bottomRight,
							colors: [animation["color1"], animation["color2"]]
						)
					),
				);
			},
		);
  	}	
}