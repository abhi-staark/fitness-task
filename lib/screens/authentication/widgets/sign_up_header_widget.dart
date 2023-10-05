
import 'package:flutter/material.dart';
import 'package:wellbeingapp/constants/file_paths/files_path.dart';

class SignUpScreenHeaderWidget extends StatelessWidget {
  const SignUpScreenHeaderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          welcomeImage,
          height: 200,
          width: 200,
          fit: BoxFit.contain,
        ),
        Text(
          'Welcome!',
          style: Theme.of(context)
              .textTheme
              .displaySmall!
              .copyWith(color: Colors.black),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          'Join us to kick Start your Fitness Journey.',
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(color: Colors.black),
        ),
      ],
    );
  }
}
