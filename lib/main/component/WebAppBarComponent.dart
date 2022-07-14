import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../screens/WebSettingScreen.dart';
import '../utils/AppColors.dart';
import 'SoicalMediaWidgetComponent.dart';

class WebAppBarComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: 100.milliseconds,
      decoration: boxDecorationDefault(
        color: context.cardColor,
        borderRadius: radius(0),
      ),
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: Row(
        children: [
          Text(
            'ProKit Flutter Web',
            style: boldTextStyle(size: 20),
          ).expand(),
          const SocialMediaWidgetComponent(),
          8.width,
          IconButton(
            icon: const Icon(
              Icons.settings,
              color: appColorPrimary,
            ),
            onPressed: () {
              const WebSettingScreen().launch(context);
            },
          ),
        ],
      ),
    );
  }
}
