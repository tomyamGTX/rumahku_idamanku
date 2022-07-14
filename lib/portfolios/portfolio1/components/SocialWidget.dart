import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialWidget extends StatefulWidget {
  static String tag = '/SoicalScreen';

  @override
  SocialWidgetState createState() => SocialWidgetState();
}

class SocialWidgetState extends State<SocialWidget> {
  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width(),
      height: context.height() * 0.3,
      color: Colors.black,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Entypo.facebook_with_circle,
                      size: 40, color: Colors.white)
                  .onTap(() {
                launch('https://www.facebook.com');
              }),
              16.width,
              const Icon(Entypo.twitter_with_circle,
                      size: 40, color: Colors.white)
                  .onTap(() {
                launch('https://www.twitter.com');
              }),
              16.width,
              const Icon(Entypo.instagram_with_circle,
                      size: 40, color: Colors.white)
                  .onTap(() {
                launch('https://www.instagram.com');
              }),
              16.width,
              const Icon(Entypo.linkedin_with_circle,
                      size: 40, color: Colors.white)
                  .onTap(() {
                launch('https://www.linkedin.com');
              }),
              16.width,
            ],
          ).withWidth(context.width() * 0.8),
          const Divider(height: 50, color: Colors.white24, thickness: 1)
              .withWidth(context.width() * 0.9),
          Text(
              '© 2022 My Website. All rights reserved | Designed by Iqonic Design',
              style: primaryTextStyle(color: Colors.white)),
        ],
      ),
    );
  }
}