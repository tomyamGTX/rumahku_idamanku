import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';
import 'package:rumah_idamanku/portfolios/providers/house.provider.dart';

import '../houses/house.tile.dart';
import '../houses/pagination.view.dart';
import '../utils/DAWidgets.dart';
import '../utils/Images.dart';
import 'Colors.dart';
import 'components/social.widget.dart';

class Portfolio3Screen extends StatefulWidget {
  const Portfolio3Screen({Key? key}) : super(key: key);

  @override
  Portfolio3ScreenState createState() => Portfolio3ScreenState();
}

class Portfolio3ScreenState extends State<Portfolio3Screen> {
  final _scrollController = ScrollController();

  var _search = '';

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

  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            Container(
              height: 75,
              width: context.width(),
              decoration: boxDecorationWithShadow(
                  backgroundColor: context.scaffoldBackgroundColor),
              alignment: Alignment.center,
              padding: const EdgeInsets.only(top: 8, bottom: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Website name here',
                          style: boldTextStyle(
                              size: 42, color: portfolio3PrimaryColor))
                      .expand(),
                  Row(
                    children: [
                      TextButton(
                          onPressed: () {
                            setState(() {
                              index = 1;
                              _scrollController.animateTo(400,
                                  curve: Curves.ease,
                                  duration: const Duration(seconds: 2));
                            });
                          },
                          child: Text('HOUSES/LAND',
                              style: boldTextStyle(
                                  size: 14,
                                  color: index == 1
                                      ? portfolio3PrimaryColor
                                      : null))),
                      TextButton(
                          onPressed: () {
                            setState(() {
                              index = 2;
                              _scrollController.animateTo(2700,
                                  curve: Curves.ease,
                                  duration: const Duration(seconds: 2));
                            });
                          },
                          child: Text('CONTACT',
                              style: boldTextStyle(
                                  size: 14,
                                  color: index == 2
                                      ? portfolio3PrimaryColor
                                      : null))),
                    ],
                  )
                ],
              ).withWidth(context.width() * 0.85),
            ),
            SizedBox(
              width: context.width(),
              height: MediaQuery.of(context).size.height * 0.45,
              child: SizedBox(
                height: context.height() - 75,
                width: context.width(),
                child: Stack(
                  children: [
                    commonCachedNetworkImage(
                      p3IntoImg,
                      height: context.height() - 75,
                      width: context.width(),
                      fit: BoxFit.cover,
                    ),
                    Container(
                      height: context.height() - 75,
                      width: context.width(),
                      color: Colors.black.withOpacity(0.5),
                    ),
                    Container(
                      width: context.width() * 0.85,
                      alignment: Alignment.center,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Slogan here',
                              style: primaryTextStyle(size: 52, color: white)),
                          32.height,
                          Center(
                            child: Container(
                                width: MediaQuery.of(context).size.width < 600
                                    ? MediaQuery.of(context).size.width * 0.7
                                    : MediaQuery.of(context).size.width * 0.5,
                                decoration: BoxDecoration(
                                    color: portfolio3BackgroundColor,
                                    borderRadius: BorderRadius.circular(32)),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 8.0, horizontal: 32),
                                  child: TextFormField(
                                    onChanged: (e) {
                                      setState(() {});
                                      _search = e;
                                      if (e.length > 2) {
                                        Provider.of<HouseProvider>(context,
                                                listen: false)
                                            .filterList(_search);
                                      } else {
                                        Provider.of<HouseProvider>(context,
                                                listen: false)
                                            .resetList();
                                      }
                                    },
                                    cursorColor: portfolio3PrimaryColor,
                                    decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        hintText: 'Search house/land here',
                                        suffixIcon: Icon(
                                          Icons.search,
                                          size: 32,
                                          color: portfolio3PrimaryColor,
                                        )),
                                  ),
                                )),
                          ),
                          32.height,
                        ],
                      ),
                    ).paddingOnly(left: 32)
                  ],
                ),
              ),
            ),
            _search == ''
                ? const PaginationView()
                : Consumer<HouseProvider>(builder: (context, house, _) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(32.0),
                          child: Text(
                            'List of Houses',
                            style: boldTextStyle(
                              size: 30,
                              color: black,
                              decorationColor: portfolio3PrimaryColor,
                              textDecorationStyle: TextDecorationStyle.solid,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.7,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 32),
                            child: GridView.builder(
                              itemCount: house.list.length,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                childAspectRatio: getRatio(),
                                crossAxisCount: getWidth(),
                                crossAxisSpacing: 5.0,
                                mainAxisSpacing: 5.0,
                              ),
                              itemBuilder: (BuildContext context, int index) {
                                var data = house.list;

                                return HouseTile(
                                    url: data[index]['image_url'],
                                    title: data[index]['name'],
                                    price:
                                        'RM ${data[index]['min_price']} - RM ${data[index]['max_price']}');
                              },
                            ),
                          ),
                        )
                      ],
                    );
                  }),
            SocialWidget(),
          ],
        ),
      ),
    );
  }

  getRatio() {
    if (MediaQuery.of(context).size.width > 1400) {
      return 1.6;
    } else if (MediaQuery.of(context).size.width > 1200) {
      return 1.2;
    } else if (MediaQuery.of(context).size.width > 1000) {
      return 1;
    } else if (MediaQuery.of(context).size.width > 800) {
      return 1.2;
    } else if (MediaQuery.of(context).size.width > 600) {
      return 1.2;
    } else if (MediaQuery.of(context).size.width > 400) {
      return 1.2;
    } else if (MediaQuery.of(context).size.width > 200) {
      return 1.1;
    } else {
      return 1.5;
    }
  }

  getWidth() {
    if (MediaQuery.of(context).size.width < 600) {
      return 1;
    } else if (MediaQuery.of(context).size.width < 800) {
      return 2;
    } else if (MediaQuery.of(context).size.width < 1000) {
      return 2;
    } else {
      return 3;
    }
  }
}
