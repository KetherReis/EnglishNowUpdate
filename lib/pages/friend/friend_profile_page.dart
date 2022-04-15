import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../components/custom_circular_indicator.dart';
import '../../components/round_icon_button.dart';
import '../../utils/constants.dart';

class FriendProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverAppBar(
              expandedHeight: 280,
              floating: false,
              pinned: true,
              //backgroundColor: Colors.white,
              elevation: 1,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.asset(
                  'assets/images/user_1.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ];
        },
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Online'.tr().toUpperCase(),
                            style: TextStyle(
                              color: Color(0xff40E58C),
                              fontSize: 8,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            'Carlos Borges',
                            style:
                                Theme.of(context).textTheme.subtitle1!.copyWith(
                                      fontWeight: FontWeight.w700,
                                    ),
                          ),
                          Text(
                            'Iniciante',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    RatingBar(
                      itemSize: 20,
                      initialRating: 4.5,
                      allowHalfRating: false,
                      itemCount: 5,
                      ignoreGestures: true,
                      // itemBuilder: (context, _) => Icon(
                      //   Icons.star,
                      //   color: Colors.amber,
                      // ),
                      ratingWidget: RatingWidget(
                        full: Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        half: SizedBox(),
                        empty: Icon(
                          Icons.star,
                          color: Colors.grey,
                        ),
                      ),
                      onRatingUpdate: (rating) {
                        print(rating);
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Divider(
                  height: 1,
                  color: Colors.grey[350],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    CustomCircularIndicator(
                      radius: 80,
                      percent: 0.85,
                      lineWidth: 5,
                      line1Width: 2,
                      footer: 'good_reviews'.tr(),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    CustomCircularIndicator(
                      radius: 80,
                      percent: 0.45,
                      lineWidth: 5,
                      line1Width: 2,
                      footer: 'total_score'.tr(),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    CustomCircularIndicator(
                      radius: 80,
                      percent: 0.1,
                      lineWidth: 5,
                      line1Width: 2,
                      footer: 'satisfaction'.tr(),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Divider(
                  height: 1,
                  color: Colors.grey[350],
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'about'.tr(),
                  style: Theme.of(context).textTheme.headline6!.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Lorem ipsum eget neque faucibus malesuada lacus sit auctor tincidunt ultrices, tempus ornare eleifend elit ornare potenti a morbi gravida, iaculis torquent consequat euismod aenean eu cubilia libero imperdiet.',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: <Widget>[
                    RoundIconButton(
                      onPressed: () {},
                      icon: Icons.message,
                      elevation: 1,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    RoundIconButton(
                      onPressed: () {},
                      icon: Icons.phone,
                      elevation: 1,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    RoundIconButton(
                      onPressed: () {},
                      icon: Icons.videocam,
                      elevation: 1,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: RawMaterialButton(
                        onPressed: () {},
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        fillColor: kColorBlue,
                        child: Container(
                          height: 48,
                          color: Colors.red,
                          child: Center(
                            child: Text(
                              'DENUNCIAR'.tr().toUpperCase(),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
