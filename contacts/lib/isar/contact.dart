import 'package:isar/isar.dart';

part 'contact.g.dart';
@Collection()
class Contact{
  @Id()
  int? id;

  late String name;

  @Index(type: IndexType.value, caseSensitive: false)
  List<String> get nameWords => Isar.splitWords(name);

  @Index(type: IndexType.value)
  late String number;

  late String description;

}