import 'package:contacts/isar/contact.dart';
import 'package:isar/isar.dart';

part 'workPlace.g.dart';

@Collection()
class workPlace{
  workPlace({required this.name});
  Id id = Isar.autoIncrement;
  late String name;

  @Backlink(to: 'company')
  final employees = IsarLinks<Contact>();
}