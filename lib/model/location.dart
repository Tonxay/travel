import 'package:hive_flutter/adapters.dart';
part 'location.g.dart';

@HiveType(typeId: 0)
class Location {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final String location;
  @HiveField(2)
  final String imagelink;
  @HiveField(3)
  final String detail;
  @HiveField(4)
  final String latlog;
  Location(
      {required this.detail,
      required this.imagelink,
      required this.latlog,
      required this.location,
      required this.name});
}
