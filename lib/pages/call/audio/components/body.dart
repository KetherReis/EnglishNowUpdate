import 'package:flutter/material.dart';
import 'package:englishnow/pages/call/rounded_button.dart';
import 'package:englishnow/pages/call/size_config.dart';

import 'dial_button.dart';
import 'dial_user_pic.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text(
              "Carlos Borges",
              style: Theme.of(context)
                  .textTheme
                  .headline4
                  ?.copyWith(color: Colors.white),
            ),
            Text(
              "Chamando…",
              style: TextStyle(color: Colors.white60),
            ),
            VerticalSpacing(),
            DialUserPic(image: "assets/images/user_1.png"),
            Spacer(),
            Wrap(
              alignment: WrapAlignment.spaceBetween,
              children: [
                DialButton(
                  iconSrc: "assets/images/icons/Icon Mic.svg",
                  text: "Microfone",
                  press: () {},
                ),
                DialButton(
                  iconSrc: "assets/images/icons/Icon Volume.svg",
                  text: "Viva-Voz",
                  press: () {},
                ),
                DialButton(
                  iconSrc: "assets/images/icons/Icon Video.svg",
                  text: "Video",
                  press: () {},
                ),
                DialButton(
                  iconSrc: "assets/images/icons/Icon Message.svg",
                  text: "Menssagem",
                  press: () {},
                ),
                DialButton(
                  iconSrc: "assets/images/icons/Icon User.svg",
                  text: "Perfil",
                  press: () {},
                ),
                DialButton(
                  iconSrc: "assets/images/icons/Icon Voicemail.svg",
                  text: "icon_test",
                  press: () {},
                ),
              ],
            ),
            VerticalSpacing(),
            RoundedButton(
              iconSrc: "assets/images/icons/call_end.svg",
              press: () {},
              color: Colors.red,
              iconColor: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
