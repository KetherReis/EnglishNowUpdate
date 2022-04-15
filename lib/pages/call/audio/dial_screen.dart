import 'package:flutter/material.dart';
import 'package:englishnow/utils/constants.dart';

import '../audio/components/body.dart';
import '../size_config.dart';

class DialScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: kColorBlue,
      body: Body(),
    );
  }
}
