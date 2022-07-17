import 'package:flutter/material.dart';

import '../portfolio3/Colors.dart';

class HouseTile extends StatefulWidget {
  final String title;
  final String price;
  final String url;
  const HouseTile(
      {required this.url, required this.title, required this.price, Key? key})
      : super(key: key);

  @override
  State<HouseTile> createState() => _HouseTileState();
}

class _HouseTileState extends State<HouseTile> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.2,
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover, image: NetworkImage(widget.url)),
              borderRadius: BorderRadius.circular(16)),
        ),
        Text(
          widget.title,
          style: const TextStyle(
            fontSize: 20,
            color: portfolio3PrimaryColor,
          ),
        ),
        Text(widget.price)
      ],
    );
  }
}
