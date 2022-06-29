import 'package:contacts/isar/contact.dart';
import 'package:contacts/global.dart';
import 'package:isar/isar.dart';

IsarCollection contacts = isar.contacts;
void writeData(Contact contact){
  isar.writeTxn(() => contacts.put(contact));
}
