import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../main.dart';
import '../model/AppModel.dart';
import '../utils/AppColors.dart';
import 'ThemeListWeb.dart';

class SubMenuContentComponent extends StatelessWidget {
  ProTheme proTheme;

  SubMenuContentComponent({Key? key, required this.proTheme}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(proTheme.name.validate(), style: boldTextStyle()),
        iconTheme: IconThemeData(color: context.iconColor),
        actions: [
          Switch(
            activeColor: appColorPrimary,
            value: appStore.isDarkModeOn,
            onChanged: (s) {
              appStore.toggleDarkMode(value: s);
            },
          ).withHeight(24)
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: ThemeListWeb(mainList: proTheme.sub_kits!),
      ),
    );
  }
}
