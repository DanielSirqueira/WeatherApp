import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WeatherTempWidget extends StatelessWidget {
  final String temp;
  final double sizeTemp;
  final double sizeDegrees;

  const WeatherTempWidget({
    super.key,
    required this.temp,
    this.sizeTemp = 24,
    this.sizeDegrees = 32,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          temp,
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
          softWrap: true,
          style: GoogleFonts.rubik(
            color: Theme.of(context).colorScheme.secondary,
            fontSize: sizeTemp,
            fontWeight: FontWeight.w700,
          ),
        ),
        Text(
          '°',
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
          softWrap: true,
          style: GoogleFonts.rubik(
            color: Theme.of(context).colorScheme.secondary,
            fontSize: sizeDegrees,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}
