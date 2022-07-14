import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../component/WebComponent.dart';
import '../model/AppModel.dart';
import '../utils/AppColors.dart';
import '../utils/AppDataProvider.dart';

class ProKitWebLauncher extends StatefulWidget {
  static String tag = '/ProKitWebLauncher';

  @override
  ProKitWebLauncherState createState() => ProKitWebLauncherState();
}

class ProKitWebLauncherState extends State<ProKitWebLauncher> {
  List<Color> colors = [appCat1, appCat2, appCat3];

  bool isHover = false;

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
    return Scaffold(
      body: FutureBuilder<AppTheme>(
        future: getAllAppsAndThemes(),
        builder: (_, snap) {
          if (snap.hasData) {
            return WebComponent(appTheme: snap.data!);
          }
          return snapWidgetHelper(snap);
        },
      ),
    );
  }
}
