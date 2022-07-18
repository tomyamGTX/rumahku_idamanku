import 'package:flutter/material.dart';

import '../portfolio3/Colors.dart';
import 'detail.house.dart';

class HouseTile extends StatefulWidget {
  final String title;
  final String price;
  final String url;
  final String type;
  final String location;
  final dynamic data;
  const HouseTile(
      {required this.location,
      required this.type,
      required this.url,
      required this.title,
      required this.price,
      Key? key,
      required this.data})
      : super(key: key);

  @override
  State<HouseTile> createState() => _HouseTileState();
}

class _HouseTileState extends State<HouseTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          InkWell(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DetailHouse(data: widget.data))),
            child: Banner(
              textStyle: const TextStyle(
                  fontSize: 14, color: portfolio3BackgroundColor),
              message: 'For ${widget.type}',
              location: BannerLocation.topEnd,
              color: Colors.red,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.2,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover, image: NetworkImage(widget.url)),
                    borderRadius: BorderRadius.circular(16)),
              ),
            ),
          ),
          Text(
            widget.title,
            style: const TextStyle(
              fontSize: 20,
              color: portfolio3PrimaryColor,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          iconText(label: widget.location, iconData: Icons.location_on),
          const SizedBox(
            height: 8,
          ),
          Text(widget.price)
        ],
      ),
    );
  }

  Widget iconText({required IconData iconData, required String label}) {
    return SizedBox(
      width: 180,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            iconData,
            color: portfolio3PrimaryColor,
          ),
          const SizedBox(
            width: 10,
          ),
          Text(label),
        ],
      ),
    );
  }
}
