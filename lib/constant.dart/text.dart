// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:travel_link/constant.dart/constantcolor.dart';

// class FormBuilderCustomDropdown extends StatelessWidget {
//   FormBuilderCustomDropdown(
//       {super.key,
//       required this.valuesList,
//       required this.title,
//       this.onChanged,
//       required this.hintext,
//       required this.keyname});
//   final List<UserAndCustomer> valuesList;
//   String title;
//   String keyname;
//   String hintext;
//   void Function(dynamic)? onChanged;
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(title,
//             style: const TextStyle(fontSize: 16, color: Color(0XFF333333))),
//         const SizedBox(height: 7),
//         Padding(
//           padding: const EdgeInsets.only(bottom: 10),
//           child: FormBuilderDropdown(
//             icon: const Icon(Icons.keyboard_arrow_down_sharp),
//             onChanged: onChanged,
//             validator: FormBuilderValidators.compose(
//                 [FormBuilderValidators.required()]),
//             name: keyname,
//             decoration: customInputDecoration(hintext),
//             items: valuesList
//                 .map((values) => DropdownMenuItem(
//                       alignment: Alignment.centerLeft,
//                       value: values,
//                       child: Text("${values.name} ${values.lastname}",
//                           style: const TextStyle(
//                               fontSize: 14, fontWeight: FontWeight.normal)),
//                     ))
//                 .toList(),
//           ),
//         ),
//         const SizedBox(height: 5)
//       ],
//     );
//   }
// }

// class FormBuilderBasicDropdown extends StatelessWidget {
//   FormBuilderBasicDropdown(
//       {super.key,
//       required this.valuesList,
//       required this.title,
//       this.onChanged,
//       this.items,
//       required this.hintext,
//       required this.keyname});

//   final List<dynamic> valuesList;
//   String title;
//   String keyname;
//   String hintext;
//   List<DropdownMenuItem<dynamic>>? items;
//   void Function(dynamic)? onChanged;
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(title,
//             style: const TextStyle(fontSize: 16, color: Color(0XFF333333))),
//         const SizedBox(height: 7),
//         Padding(
//           padding: const EdgeInsets.only(bottom: 10),
//           child: FormBuilderDropdown<dynamic>(
//             icon: const Icon(Icons.keyboard_arrow_down_sharp),
//             onChanged: onChanged,
//             validator: FormBuilderValidators.compose(
//                 [FormBuilderValidators.required()]),
//             name: keyname,
//             decoration: items != null
//                 ? customDecoration(hintText: hintext)
//                 : customInputDecoration(
//                     hintext,
//                   ),
//             items: items ??
//                 valuesList
//                     .map((gender) => DropdownMenuItem(
//                           alignment: Alignment.centerLeft,
//                           value: gender,
//                           child: Text(gender,
//                               style: const TextStyle(
//                                   fontSize: 14, fontWeight: FontWeight.normal)),
//                         ))
//                     .toList(),
//           ),
//         ),
//       ],
//     );
//   }
// }

class CustomFormText extends StatelessWidget {
  CustomFormText(
      {super.key,
      required this.title,
      required this.hint,
      required this.keyname,
      this.maxLines,
      this.onChanged,
      this.keyboardType,
      this.width,
      this.isBouder = false,
      this.color});
  String title;
  String hint;
  bool? isBouder;
  String keyname;
  int? maxLines;
  double? width;
  TextInputType? keyboardType;
  Color? color;
  void Function(String?)? onChanged;
  String pattternphonenumber = r'(^(?:[+0]9)?[0-9]{10,10}$)';
  @override
  Widget build(BuildContext context) {
    DateTime nowyear = DateTime.now();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: const TextStyle(fontSize: 16, color: Color(0XFF333333))),
        const SizedBox(height: 7),
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: SizedBox(
            width: width ?? MediaQuery.of(context).size.width,
            child: FormBuilderTextField(
              onChanged: onChanged,
              maxLines: maxLines,
              name: keyname,
              textInputAction: TextInputAction.done,
              keyboardType: keyname == 'date' || keyname == 'phone'
                  ? keyboardType ?? TextInputType.number
                  : keyboardType,
              decoration: isBouder!
                  ? customDecoration(hintText: hint)
                  : customInputDecoration(hint),
              validator: FormBuilderValidators.compose(keyname == 'date'
                  ? [
                      FormBuilderValidators.required(),
                      FormBuilderValidators.minLength(10,
                          errorText: "ກະລຸນາໃສ່ວັນທີເດືອນປີໃຫ້ຖືກຕ້ອງ"),
                      (v) {
                        int day = int.parse(v![0] + v[1]);
                        int mount = int.parse(v[3] + v[4]);
                        int year = int.parse(v.substring(6));
                        if (year > nowyear.year || year < 1923) {
                          return "ກະລຸນາໃສ່ ປີ ໃຫ້ຖືກຕ້ອງ";
                        }
                        if (day > 31 || day <= 0) {
                          return "ກະລຸນາໃສ່ ວັນທີ ໃຫ້ຖືກຕ້ອງ";
                        }
                        if (mount > 12 || mount <= 0) {
                          return "ກະລຸນາໃສ່ ເດຶອນ ທີໃຫ້ຖືກຕ້ອງ";
                        }
                        return null;
                      }
                    ]
                  : keyname == "phone"
                      ? [
                          FormBuilderValidators.required(),
                          FormBuilderValidators.match(pattternphonenumber,
                              errorText: "ເບີຂອງທ່ານບໍ່ຖືກຕ້ອງ"),
                        ]
                      : [
                          FormBuilderValidators.required(),
                          FormBuilderValidators.minLength(3),
                        ]),
            ),
          ),
        ),
      ],
    );
  }
}

// class FormBuilderCustomDate extends StatelessWidget {
//   FormBuilderCustomDate(
//       {super.key,
//       this.width,
//       required this.keyname,
//       this.istitle = true,
//       this.onChanged,
//       this.hint,
//       this.title = ''});
//   String keyname;
//   String? title;
//   String? hint;
//   bool istitle;
//   double? width;
//   void Function(DateTime?)? onChanged;
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         if (istitle) ...[
//           Text(title!,
//               style: const TextStyle(fontSize: 16, color: Color(0XFF333333))),
//           const SizedBox(height: 7),
//         ],
//         Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: FormBuilderDateTimePicker(
//               onChanged: onChanged,
//               format: DateFormat('dd/MM/yyyy'),
//               decoration: customInputDecoration(
//                   hint,
//                   const Icon(
//                     Icons.date_range,
//                     color: ConstantColors.greyColor1,
//                     size: 20,
//                   )),
//               inputType: InputType.date,
//               style: const TextStyle(
//                 fontSize: 14,
//               ),
//               name: keyname,
//               firstDate: DateTime(1880),
//               validator: FormBuilderValidators.compose(
//                   [FormBuilderValidators.required()]),
//               lastDate: DateTime.now().add(const Duration(days: 30))),
//         ),
//         const SizedBox(height: 5)
//       ],
//     );
//   }
// }

InputDecoration customDecoration({String? hintText, Icon? iconright}) {
  return InputDecoration(
    border: InputBorder.none,
    filled: true,
    fillColor: ConstantColors.greyColor.withOpacity(0.3),
    suffixIcon: iconright,
    contentPadding:
        const EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 10),
    hintText: hintText,
    hintStyle: const TextStyle(color: ConstantColors.greyColor2, fontSize: 14),
    enabledBorder: UnderlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: BorderSide(
        width: 1,
        color: ConstantColors.greyColor.withOpacity(0.5),
      ),
    ),
  );
}

InputDecoration customInputDecoration(label, [Icon? icon]) {
  return InputDecoration(
    suffixIcon: icon,
    contentPadding:
        const EdgeInsets.only(top: 10, bottom: 15, right: 10, left: 7),
    hintText: label,
    enabledBorder: const UnderlineInputBorder(
      borderSide: BorderSide(
        width: 1,
        color: ConstantColors.greyColor1,
      ),
    ),
    hintStyle: const TextStyle(color: ConstantColors.greyColor1, fontSize: 14),
  );
}

class FormBuilderRadio extends StatelessWidget {
  FormBuilderRadio(
      {super.key,
      required this.hint,
      required this.keyname,
      required this.dataList,
      required this.title});
  String hint;
  String title;
  String keyname;
  List dataList;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: const TextStyle(fontSize: 16, color: Color(0XFF333333))),
        const SizedBox(height: 7),
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: FormBuilderRadioGroup(
            activeColor: ConstantColors.currenseColor,
            // materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            wrapSpacing: 12,
            name: keyname,
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.zero,
              border: InputBorder.none,
            ),
            validator: FormBuilderValidators.required(),
            options: dataList
                .map((lang) => FormBuilderFieldOption(
                      value: lang,
                    ))
                .toList(growable: true),
          ),
        )
      ],
    );
  }
}
