import 'package:flutter/material.dart';
import 'package:travel_link/model/location.dart';

class DetailPage extends StatefulWidget {
  DetailPage({super.key, required this.data});
  Location data;
  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Stack(
      children: [
        SizedBox(
            width: double.infinity,
            height: height * 0.40,
            child: Image.network(
              widget.data.imagelink,
              fit: BoxFit.cover,
            )),
        DraggableScrollableSheet(
            initialChildSize: 0.6,
            minChildSize: 0.6,
            maxChildSize: 1.0,
            builder: (context, scrollController) {
              return ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(30.0)),
                child: Container(
                  color: Colors.white,
                  padding: const EdgeInsets.all(20.0),
                  child: ListView(
                    controller: scrollController,
                    children: [
                      Text(
                        widget.data.name,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.location_on,
                              color: Color(0xFF26BBA9),
                            ),
                            Text(widget.data.name)
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Column(
                          children: [Text(widget.data.detail)],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: ElevatedButton(
                          onPressed: () {},
                          child: const Text('Map'),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            })
      ],
    ));
  }
}
