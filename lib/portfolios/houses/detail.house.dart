import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:whatsapp_unilink/whatsapp_unilink.dart';

class DetailHouse extends StatefulWidget {
  final dynamic data;
  const DetailHouse({Key? key, required this.data}) : super(key: key);

  @override
  State<DetailHouse> createState() => _DetailHouseState();
}

class _DetailHouseState extends State<DetailHouse> {
  bool _pinned = true;
  bool _snap = true;
  bool _floating = true;

// [SliverAppBar]s are typically used in [CustomScrollView.slivers], which in
// turn can be placed in a [Scaffold.body].
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            actions: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.share,
                      size: 30,
                    )),
              )
            ],
            pinned: _pinned,
            snap: _snap,
            floating: _floating,
            expandedHeight: MediaQuery.of(context).size.height * 0.4,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                widget.data['name'],
              ),
              background: Image.network(
                widget.data['image_url'],
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                  child: Text(
                widget.data['content'],
                textAlign: TextAlign.justify,
                style: const TextStyle(fontSize: 20),
              )),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
                child: Center(
                    child: Text(
                  'More pictures',
                  textAlign: TextAlign.justify,
                  style: primaryTextStyle(size: 32),
                )),
              ),
            ),
          ),
          SliverGrid(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: MediaQuery.of(context).size.height * 0.3,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
              childAspectRatio: 2.0,
            ),
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return InkWell(
                  onTap: () {
                    launchUrl(Uri.parse(widget.data['list_image_url'][index]));
                  },
                  child: Container(
                    margin: EdgeInsets.all(8),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.teal[100 * (index % 9)],
                        image: DecorationImage(
                            colorFilter: const ColorFilter.linearToSrgbGamma(),
                            image: NetworkImage(
                                widget.data['list_image_url'][index]),
                            fit: BoxFit.cover)),
                  ),
                );
              },
              childCount: widget.data['list_image_url'].length,
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: mediumSeaGreen,
        onPressed: () async {
          final link = WhatsAppUnilink(
            phoneNumber: '+60-136595741',
            text:
                "Hey! I'm interested in a ${widget.data['name']}, located in ${widget.data['location']}, with a price range of RM${widget.data['min_price']} - RM${widget.data['max_price']}. Can you explain in detail about this house/land?",
          );
          // Convert the WhatsAppUnilink instance to a string.
          // Use either Dart's string interpolation or the toString() method.
          // The "launch" method is part of "url_launcher".
          await launch('$link');
        },
        label: Text('Contact Us'),
        icon: Icon(Icons.whatsapp),
      ),
    );
  }

  getRatio() {
    if (MediaQuery.of(context).size.width > 1400) {
      return 1.4;
    } else if (MediaQuery.of(context).size.width > 1200) {
      return 1.1;
    } else if (MediaQuery.of(context).size.width > 1000) {
      return 0.9;
    } else if (MediaQuery.of(context).size.width > 800) {
      return 1.1;
    } else if (MediaQuery.of(context).size.width > 600) {
      return 0.85;
    } else if (MediaQuery.of(context).size.width > 400) {
      return 0.85;
    } else if (MediaQuery.of(context).size.width > 200) {
      return 0.9;
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
