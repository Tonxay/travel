import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:travel_link/constant.dart/constring.dart';
import 'package:travel_link/model/location.dart';
import 'package:travel_link/page/showdetail.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ValueListenableBuilder(
          valueListenable:
              Hive.box<Location>(ConstantString.hivebox).listenable(),
          builder: (context, box, widget) {
            return Expanded(
              child: ListView.builder(
                itemCount: box.values.length,
                itemBuilder: (context, index) {
                  Location data = box.values.toList()[index];
                  return Card(
                      margin: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 20),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: ListTile(
                          leading: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.network(
                              data.imagelink,
                              width: 60,
                              height: 60,
                              fit: BoxFit.cover,
                            ),
                          ),
                          title: Text(
                            data.name,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          subtitle: Text(
                            data.latlog,
                            style: const TextStyle(fontSize: 14),
                          ),
                          trailing: const Icon(Icons.arrow_forward_ios),
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => DetailPage(data: data),
                            ));
                          },
                        ),
                      ));
                },
              ),
            );
          },
        )
      ],
    );
  }
}
