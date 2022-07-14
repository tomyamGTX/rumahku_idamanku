import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import '../../main.dart';
import '../component/ThemeItemWidget.dart';
import '../model/AppModel.dart';
import '../utils/AppWidget.dart';

class ThemeList extends StatefulWidget {
  final List<ProTheme>? list;

  ThemeList(this.list);

  @override
  ThemeListState createState() => ThemeListState();
}

class ThemeListState extends State<ThemeList> {
  @override
  void dispose() {
    super.dispose();
    changeStatusColor(appStore.scaffoldBackground!);
  }

  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: widget.list!.length,
        physics: ScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) =>
            ThemeItemWidget(index, widget.list![index]),
      ),
    );
  }
}
