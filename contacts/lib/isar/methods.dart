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
void clear(int id){
  isar.writeTxn(() => isar.clear());
}
List<Contact>? getContacts(int offset){
  List<Contact>? _result;
  _result = isar.contacts.where().sortByName().offset(offset).limit(10).build().findAllSync();
  return _result;
}

List<Contact>? filterContacts(String searchTerm, int offset){
  List<Contact>? _result;
  _result = isar.contacts
      .where()
      .nameWordsElementStartsWith(searchTerm)
      .or()
      .formattedNumberStartsWith(searchTerm)
      .sortByName()
      .offset(offset)
      .findAllSync();
  return _result;
}
Stream allContacts(){
  Stream _stream = isar.contacts.where().sortByName().build().watch(initialReturn: true);
  return _stream;
}
Stream contactsStream(){
  Stream _stream = isar.contacts.where(sort: Sort.desc).anyId().limit(1).watch(initialReturn: false);
  return _stream;
}

