import 'package:flutter/cupertino.dart';
import 'package:rive/rive.dart';
import 'package:weather_app/app/utils/images.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: SizedBox(
            width: 300, child: RiveAnimation.asset(IMAGE_LOADING_RIV)));
  }
}
