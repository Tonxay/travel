import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:travel_link/constant.dart/text.dart';

class AppPage extends StatelessWidget {
  AppPage({super.key});
  final _formkey = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: FormBuilder(
          child: Column(
        children: [
          const SizedBox(height: 40),
          CustomFormText(
            hint: "",
            title: "ສາເຫດທີ່ເຂົ້າຮັບຮັກສາ",
            keyname: "cause",
          ),
          CustomFormText(
            hint: "ຕົວຢ່າງ : ຖືກລົດຕໍາ",
            title: "ສາເຫດທີ່ເຂົ້າຮັບຮັກສາ",
            keyname: "cause",
          ),
          CustomFormText(
            hint: "ຕົວຢ່າງ : ຖືກລົດຕໍາ",
            title: "ສາເຫດທີ່ເຂົ້າຮັບຮັກສາ",
            keyname: "cause",
          ),
        ],
      )),
    );
  }
}
