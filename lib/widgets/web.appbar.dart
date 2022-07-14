import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../portfolios/portfolio3/Colors.dart';

class WebAppbar extends StatefulWidget {
  const WebAppbar({
    Key? key,
  }) : super(key: key);

  @override
  State<WebAppbar> createState() => _WebAppbarState();
}

class _WebAppbarState extends State<WebAppbar> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75,
      width: context.width(),
      decoration: boxDecorationWithShadow(
          backgroundColor: context.scaffoldBackgroundColor),
      alignment: Alignment.center,
      padding: const EdgeInsets.only(top: 8, bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('Rumah Idamanku',
                  style: boldTextStyle(size: 42, color: portfolio3PrimaryColor))
              .expand(),
          Row(
            children: [
              TextButton(
                onPressed: () {
                  setState(() {
                    index = 0;
                  });
                },
                child: Text('HOME',
                    style: boldTextStyle(
                        size: 14,
                        color: index == 0 ? portfolio3PrimaryColor : null)),
              ),
              14.width,
              TextButton(
                  onPressed: () {
                    setState(() {
                      index = 1;
                    });
                  },
                  child: Text('ABOUT',
                      style: boldTextStyle(
                          size: 14,
                          color: index == 1 ? portfolio3PrimaryColor : null))),
              14.width,
              TextButton(
                  onPressed: () {
                    setState(() {
                      index = 2;
                    });
                  },
                  child: Text('SERVICE',
                      style: boldTextStyle(
                          size: 14,
                          color: index == 2 ? portfolio3PrimaryColor : null))),
              14.width,
              TextButton(
                  onPressed: () {
                    setState(() {
                      index = 3;
                    });
                  },
                  child: Text('WORK',
                      style: boldTextStyle(
                          size: 14,
                          color: index == 3 ? portfolio3PrimaryColor : null))),
              14.width,
              TextButton(
                  onPressed: () {
                    setState(() {
                      index = 4;
                    });
                  },
                  child: Text('CONTACT',
                      style: boldTextStyle(
                          size: 14,
                          color: index == 4 ? portfolio3PrimaryColor : null))),
            ],
          )
        ],
      ).withWidth(context.width() * 0.85),
    );
  }
}
