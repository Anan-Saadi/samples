import 'package:contacts/isar/contact.dart';
import 'package:contacts/global.dart';
import 'package:contacts/isar/workPlace.dart';
import 'package:isar/isar.dart';

IsarCollection contacts = isar.contacts;
IsarCollection workPlaces = isar.workPlaces;

void addContact(Contact contact){
  isar.writeTxn(() => contacts.put(contact));
}
void deleteContact(int id){
  isar.writeTxn(() => contacts.delete(id));
}

List<Contact>? filterContacts(String searchTerm){
  List<Contact>? _result;
  _result = isar.contacts.where()
      .nameWordsElementStartsWith(searchTerm)
      .or()
      .numberStartsWith(searchTerm)
      .findAllSync();
  return _result;
}
Stream contactsStream(){
  Stream _stream = contacts.where().build().watch(initialReturn: true);
  return _stream;
}

void createWorkPlace(workPlace workPlace){
  isar.writeTxn(() => workPlaces.put(workPlace));
}