import 'package:contacts_service/contacts_service.dart';

class ContactHelper {
  static Future<List<Contact>> getContacts() async {
    try {
      // 연락처 가져오기
      Iterable<Contact> contacts = await ContactsService.getContacts();

      // Iterable을 List로 변환하여 반환
      print(contacts);
      return contacts.toList();
    } catch (e) {
      // 오류 처리
      print('Error fetching contacts: $e');
      return []; // 빈 목록 반환
    }
  }
}
