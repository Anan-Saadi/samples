import 'package:contacts/isar/contact.dart';
import 'package:contacts/global.dart';
import 'package:isar/isar.dart';

IsarCollection contacts = isar.contacts;
void addContact(Contact contact){
  isar.writeTxn(() => contacts.put(contact));
}
void deleteContact(int id){
  isar.writeTxn(() => contacts.delete(id));
}
