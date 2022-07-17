import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';
import 'package:rumah_idamanku/portfolios/houses/house.tile.dart';

import '../portfolio3/Colors.dart';
import '../providers/house.provider.dart';

class PaginationView extends StatefulWidget {
  const PaginationView({Key? key}) : super(key: key);

  @override
  State<PaginationView> createState() => _PaginationViewState();
}

class _PaginationViewState extends State<PaginationView> {
  @override
  Widget build(BuildContext context) {
    return Consumer<HouseProvider>(builder: (context, house, _) {
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
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 32),
              child: GridView.builder(
                itemCount: house.list.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: getRatio(),
                  crossAxisCount: 3,
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
    });
  }

  getRatio() {
    if (MediaQuery.of(context).size.width > 1400) {
      return 1.9;
    }
    if (MediaQuery.of(context).size.width > 1000) {
      return 1;
    } else {
      return 0.9;
    }
  }
}
