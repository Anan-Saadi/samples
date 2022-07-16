import 'package:contacts/isar/contact.dart';
import 'package:isar/isar.dart';

part 'workPlace.g.dart';

@Collection()
class workPlace{

  @Id()
  int? id;
  late String name;

  final employees = IsarLinks<Contact>();
}