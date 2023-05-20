import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:hive/hive.dart';
import 'package:travel_link/constant.dart/constring.dart';
import 'package:travel_link/constant.dart/text.dart';

import '../model/location.dart';

class AppPage extends StatelessWidget {
  AppPage({super.key});
  final _formkey = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) {
    final box = Hive.box<Location>(ConstantString.hivebox);
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: FormBuilder(
          key: _formkey,
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
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                    onPressed: () async {
                      if (_formkey.currentState!.validate()) {
                        _formkey.currentState!.save();

                        await box.add(Location(
                            name: _formkey.currentState!.fields['name']!.value,
                            detail:
                                _formkey.currentState!.fields['detail']!.value,
                            imagelink: _formkey
                                .currentState!.fields['picturelink']!.value,
                            latlog: _formkey
                                .currentState!.fields['locationname']!.value,
                            location: 'N/A'));
                      }
                    },
                    child: const Text("ADD DATA")),
              )
            ],
          )),
    );
  }
}
