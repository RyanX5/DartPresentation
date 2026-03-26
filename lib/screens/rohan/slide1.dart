import 'package:dart_presentation/screens/default_slide.dart';
import 'package:dart_presentation/utils/theme.dart';
import 'package:dart_presentation/widgets/custom_button.dart';
import 'package:dart_presentation/widgets/wrapper.dart';
import 'package:flutter/material.dart';

class Slide1 extends StatelessWidget {
  const Slide1({super.key});

  // we prolly dont need scaffold here (dont need appbar and shi)
  @override
  Widget build(BuildContext context) {
    return DefaultSlide(
      title: "Introduction",
      subtitle: "What is Dart?",
      childrenSlides: [_Intro(), _History()],
    );
  }
}

Widget _Intro() {
  return Wrapper(
    child: Row(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Dart was founded in 2011 by Google.",
                  style: TextStyles().title(),
                ),
                const SizedBox(height: 10),
                CustomButton(
                  label: "Start",
                  icon: Icon(Icons.play_arrow, color: Colors.white),
                ),
              ],
            ),
          ],
        ),
        const Spacer(),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "Dart was founded in 2011 by Google.",
                  style: TextStyles().title(),
                ),
                const SizedBox(height: 10),
                Text("It was a big flop.", style: TextStyles().subtitle()),
              ],
            ),
          ],
        ),
      ],
    ),
  );
}

Widget _History() {
  return Wrapper(
    child: Row(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Made in 2011.", style: TextStyles().title()),
                const SizedBox(height: 10),
              ],
            ),
          ],
        ),
        const Spacer(),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  children: [
                    Text(
                      "Dart ",
                      style: TextStyles(color: AppColors.dartColor).title(),
                    ),
                    Text("was founded in 2011.", style: TextStyles().title()),
                  ],
                ),
                const SizedBox(height: 10),
                Text("It was a big flop.", style: TextStyles().subtitle()),
              ],
            ),
          ],
        ),
      ],
    ),
  );
}
