import 'package:isar/isar.dart';

part 'contact.g.dart';
@Collection()
class Contact{
  Id id = Isar.autoIncrement;

  late String name;

  @Index(type: IndexType.value, caseSensitive: false)
  List<String> get nameWords => Isar.splitWords(name);

  late String number;

  @Index(type: IndexType.value)
  String get formattedNumber => number.replaceAll('-', '').replaceAll('+', '');

  late String description;

}