import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../main.dart';
import '../component/DownloadSourceCodeDialog.dart';
import '../model/AppModel.dart';
import '../utils/AppColors.dart';
import '../utils/AppConstant.dart';
import '../utils/AppDataProvider.dart';
import '../utils/AppImages.dart';
import '../utils/AppStrings.dart';
import '../utils/AppWidget.dart';
import 'ProKitScreenListing.dart';
import 'SettingScreen.dart';
import 'ThemeList.dart';

class ProKitLauncher extends StatefulWidget {
  static String tag = '/ProKitLauncher';

  @override
  ProKitLauncherState createState() => ProKitLauncherState();
}

class ProKitLauncherState extends State<ProKitLauncher>
    with TickerProviderStateMixin {
  var selectedTab = 0;
  List<Color> colors = [appCat1, appCat2, appCat3];

  PageController _controller = PageController(initialPage: 0, keepPage: false);

  @override
  void initState() {
    super.initState();

    afterBuildCreated(() {
      changeStatusColor(context.scaffoldBackgroundColor);

      if (getIntAsync(appOpenCount) >= 5) {
        setValue(appOpenCount, 0);
        showDialog(
          context: context,
          builder: (BuildContext context) => DownloadSourceCodeDialog(),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget tabItem(String name, int pos,
        {var isRight = false, bool isNew = false}) {
      return GestureDetector(
        onTap: () {
          setState(() {
            _controller.jumpToPage(pos);
            selectedTab = pos;
          });
        },
        child: Stack(
          children: [
            Container(
              child: Text(name,
                  style: boldTextStyle(
                      color: selectedTab == pos
                          ? appColorPrimary
                          : textSecondaryColorGlobal,
                      size: 18)),
              alignment: Alignment.center,
              height: 50,
              decoration: selectedTab == pos
                  ? BoxDecoration(
                      color: appColorPrimary.withOpacity(0.1),
                      borderRadius: isRight
                          ? BorderRadius.only(topLeft: Radius.circular(16))
                          : BorderRadius.only(topRight: Radius.circular(16)))
                  : BoxDecoration(),
            ),
            Positioned(
              right: 20,
              top: 0,
              bottom: 0,
              child: Container(
                alignment: Alignment.centerRight,
                padding: EdgeInsets.all(4),
                decoration:
                    BoxDecoration(color: appDarkRed, shape: BoxShape.circle),
                //decoration: boxDecoration(bgColor: appDarkRed, radius: 4),
              ),
            ).visible(isNew.validate()),
          ],
        ),
      );
    }

    Widget category(Color color, String img, String? name,
        {bool isNew = false, String? type = 'New', required Function onTap}) {
      return Container(
        width: 145,
        height: 100,
        margin: EdgeInsets.only(right: 16),
        child: Stack(
          alignment: Alignment.topRight,
          children: [
            Container(
              width: 145,
              height: 100,
              decoration: boxDecorationDefault(color: color),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SvgPicture.asset(img,
                      width: 40, height: 40, color: Colors.white),
                  4.height,
                  Text('$name',
                      style: boldTextStyle(color: Colors.white),
                      maxLines: 2,
                      textAlign: TextAlign.center),
                ],
              ),
            ),
            Positioned(
              right: -5,
              top: -5,
              child: Container(
                alignment: Alignment.centerRight,
                margin: EdgeInsets.only(right: 8, top: 8),
                padding: EdgeInsets.fromLTRB(8, 2, 8, 2),
                decoration:
                    boxDecorationDefault(color: appDarkRed, boxShadow: []),
                child: FittedBox(
                    child: text(type.validate(),
                        fontSize: 8.0, textColor: Colors.white)),
              ).visible(isNew.validate()),
            ),
          ],
        ).onTap(() => onTap(), borderRadius: radius()),
      );
    }

    return Scaffold(
      backgroundColor: context.scaffoldBackgroundColor,
      body: FutureBuilder<AppTheme>(
        future: getAllAppsAndThemes(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return SafeArea(
              child: NestedScrollView(
                headerSliverBuilder:
                    (BuildContext context, bool innerBoxIsScrolled) {
                  return [
                    SliverAppBar(
                      expandedHeight: 230.0,
                      floating: false,
                      backgroundColor: context.scaffoldBackgroundColor,
                      forceElevated: innerBoxIsScrolled,
                      pinned: true,
                      automaticallyImplyLeading: false,
                      actions: [
                        IconButton(
                          icon: Icon(Icons.settings,
                              color: appStore.backgroundColor),
                          onPressed: () {
                            SettingScreen().launch(context);
                          },
                        )
                      ],
                      title: innerBoxIsScrolled
                          ? Text(mainAppName, style: boldTextStyle(size: 24))
                          : null,
                      bottom: innerBoxIsScrolled
                          ? PreferredSize(
                              preferredSize: Size(context.width(), 80),
                              child: Container(
                                height: 80,
                                padding: EdgeInsets.only(left: 16, right: 16),
                                margin: EdgeInsets.only(left: 8),
                                alignment: Alignment.centerLeft,
                                child: Row(
                                  children: [
                                    Container(
                                      width: 80,
                                      height: 60,
                                      margin: EdgeInsets.only(right: 12),
                                      padding: EdgeInsets.all(16),
                                      child: Image.asset(icons[0],
                                          color: Colors.white),
                                      decoration:
                                          boxDecorationDefault(color: appCat5),
                                    ),
                                    Expanded(
                                      child: Stack(
                                        alignment: Alignment.centerRight,
                                        children: <Widget>[
                                          Container(
                                            width: context.width(),
                                            height: 60,
                                            padding: EdgeInsets.only(
                                                left: 16, right: 16),
                                            margin: EdgeInsets.only(
                                                right: context.width() / 28),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: <Widget>[
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    Text('Default Theme',
                                                        style: boldTextStyle(),
                                                        maxLines: 2),
                                                  ],
                                                ).expand(),
                                              ],
                                            ),
                                            decoration: boxDecorationDefault(
                                                color: context
                                                    .scaffoldBackgroundColor),
                                          ),
                                          Container(
                                            width: 30,
                                            height: 30,
                                            child: Icon(
                                                Icons.keyboard_arrow_right,
                                                color: Colors.white),
                                            decoration: boxDecorationDefault(
                                                color: appCat5,
                                                shape: BoxShape.circle),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ).onTap(() {}),
                            )
                          : null,
                      flexibleSpace: FlexibleSpaceBar(
                        collapseMode: CollapseMode.parallax,
                        background: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(mainAppName, style: boldTextStyle(size: 30))
                                  .paddingOnly(top: 16, left: 16, right: 16),
                              SizedBox(height: 16),
                              SingleChildScrollView(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 8),
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    category(appCat4, app_ic_phone,
                                        snapshot.data!.widgets!.name,
                                        type: snapshot.data!.widgets!.tag,
                                        onTap: () {
                                      ProKitScreenListing(
                                              snapshot.data!.widgets)
                                          .launch(context);
                                    }),
                                    category(
                                        appCat1, app_ic_phone, appLblFullApps,
                                        isNew: true,
                                        type: snapshot.data!.fullApp!.tag,
                                        onTap: () {
                                      ProKitScreenListing(
                                              snapshot.data!.fullApp)
                                          .launch(context);
                                    }),
                                    category(
                                        appCat2, app_dashboard, appLblDashboard,
                                        type: snapshot.data!.dashboard!.tag,
                                        onTap: () {
                                      ProKitScreenListing(
                                              snapshot.data!.dashboard)
                                          .launch(context);
                                    }),
                                    category(appCat3, app_ic_phone,
                                        appLblIntegrations, onTap: () {
                                      ProKitScreenListing(
                                              snapshot.data!.integrations)
                                          .launch(context);
                                    }, isNew: true),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ];
                },
                body: Container(
                  margin: EdgeInsets.only(top: 8),
                  width: context.width(),
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          tabItem(appLblThemeList, 0, isNew: false).expand(),
                          tabItem(appLblScreenList, 1,
                                  isRight: true, isNew: true)
                              .expand(),
                        ],
                      ),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.only(top: 16),
                          height: double.maxFinite,
                          color: appStore.scaffoldBackground,
                          child: PageView(
                            pageSnapping: false,
                            onPageChanged: (value) {
                              selectedTab = value;
                              setState(() {});
                            },
                            controller: _controller,
                            physics: NeverScrollableScrollPhysics(),
                            children: <Widget>[
                              ThemeList(snapshot.data!.themes),
                              ThemeList(snapshot.data!.screenList),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error.toString()}",
                style: primaryTextStyle());
          }
          return CircularProgressIndicator().center();
        },
      ),
    );
  }
}
