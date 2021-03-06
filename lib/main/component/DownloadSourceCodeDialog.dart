import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../main.dart';
import '../utils/AppColors.dart';
import '../utils/AppConstant.dart';

class DownloadSourceCodeDialog extends StatelessWidget {
  const DownloadSourceCodeDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
          color: context.scaffoldBackgroundColor,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(16),
        ),
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  finish(context);
                },
                child: Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                      padding: const EdgeInsets.only(top: 8, right: 16),
                      child: Icon(Icons.close, color: appStore.iconColor)),
                ),
              ),
              Image.asset('images/app/app_icon.png', height: 100),
              Text("Download the source code", style: boldTextStyle(size: 20))
                  .fit(),
              const SizedBox(height: 6),
              Text(
                  "Love ProKit Flutter? Tap on download to buy ProKit Flutter.",
                  style: secondaryTextStyle(size: 16),
                  textAlign: TextAlign.center),
              const SizedBox(height: 24),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: appColorPrimary,
                ),
                onPressed: () {
                  finish(context);
                  launch(SourceCodeUrl);
                },
                child: Text('Download', style: primaryTextStyle(color: white)),
              ).paddingOnly(bottom: 24)
            ],
          ),
        ),
      ),
    );
  }
}
