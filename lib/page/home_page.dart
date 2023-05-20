import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:travel_link/constant.dart/constring.dart';
import 'package:travel_link/constant.dart/text.dart';
import 'package:travel_link/model/location.dart';
import 'package:travel_link/page/showdetail.dart';

class Home extends StatelessWidget {
  Home({super.key});
  final _formkey = GlobalKey<FormBuilderState>();
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
                  return Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            Center(
                              child: Card(
                                  margin: const EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 20),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: ListTile(
                                      leading: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
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
                                      trailing: IconButton(
                                        onPressed: () async {
                                          await box.deleteAt(index);
                                        },
                                        icon: const Icon(Icons.clear),
                                        color: Colors.red,
                                      ),
                                      onTap: () {
                                        Navigator.of(context)
                                            .push(MaterialPageRoute(
                                          builder: (context) =>
                                              DetailPage(data: data),
                                        ));
                                      },
                                    ),
                                  )),
                            ),
                          ],
                        ),
                        TextButton(
                            onPressed: () {
                              showDialog<String>(
                                context: context,
                                builder: (BuildContext context) => AlertDialog(
                                  title: const Text('AlertDialog  Title'),
                                  content: SingleChildScrollView(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: FormBuilder(
                                          key: _formkey,
                                          initialValue: {
                                            "name": data.name,
                                            "locationname": data.latlog,
                                            "picturelink": data.imagelink,
                                            "detail": data.detail,
                                          },
                                          child: Column(
                                            children: [
                                              const SizedBox(height: 40),
                                              CustomFormText(
                                                hint: "Name",
                                                title: "Name",
                                                keyname: "name",
                                              ),
                                              CustomFormText(
                                                hint: "Location Name",
                                                title: "LocationName",
                                                keyname: "locationname",
                                              ),
                                              CustomFormText(
                                                hint: "Picture Link",
                                                title: "picturelink",
                                                keyname: "picturelink",
                                              ),
                                              CustomFormText(
                                                hint: "Detail",
                                                title: "Detail",
                                                keyname: "detail",
                                              ),
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                child: ElevatedButton(
                                                    onPressed: () async {
                                                      if (_formkey.currentState!
                                                          .validate()) {
                                                        _formkey.currentState!
                                                            .save();

                                                        await box.putAt(
                                                            index,
                                                            Location(
                                                                name: _formkey
                                                                    .currentState!
                                                                    .fields[
                                                                        'name']!
                                                                    .value,
                                                                detail: _formkey
                                                                    .currentState!
                                                                    .fields[
                                                                        'detail']!
                                                                    .value,
                                                                imagelink: _formkey
                                                                    .currentState!
                                                                    .fields[
                                                                        'picturelink']!
                                                                    .value,
                                                                latlog: _formkey
                                                                    .currentState!
                                                                    .fields[
                                                                        'locationname']!
                                                                    .value,
                                                                location:
                                                                    'N/A'));
                                                      }
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    child:
                                                        const Text(" UPDATA")),
                                              )
                                            ],
                                          )),
                                    ),
                                  ),
                                ),
                              );
                            },
                            child: const Text("UPDATE"))
                      ],
                    ),
                  );
                },
              ),
            );
          },
        ),
      ],
    );
  }
}
