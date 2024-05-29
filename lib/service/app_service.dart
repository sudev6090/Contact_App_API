import 'package:contact_app_api/model/contact_model.dart';
import 'package:dio/dio.dart';

class ClassName {
  Dio dio = Dio();
  Future<List<ContactModel>> fetchingContact() async {
    try {
      final response = await dio
          .get('https://contacts-management-server.onrender.com/api/contacts');
      if (response.statusCode == 200) {
        final List<dynamic> jsonData = response.data;
        return jsonData.map((json) => ContactModel.fromJson(json)).toList();
      } else {
        throw Exception('Unable to load data');
      }
    } catch (e) {
      throw e;
    }
  }

  Future<bool> deleteById(String id) async {
    final response = await dio.delete(
        'https://contacts-management-server.onrender.com/api/contacts/$id');
    return response.statusCode == 200;
  }

  Future<bool> postData(
      String name, String email, String address, String phone) async {
    final responce = await dio.post(
      'https://contacts-management-server.onrender.com/api/contacts',
      data: {"name": name, "email": email, "phone": phone, "address": address},
    );
    return responce.statusCode == 201;
  }

  Future<bool> updateData(String id, String name, String phone, String email,
      String address) async {
    final response = await dio.put(
        'https://contacts-management-server.onrender.com/api/contacts/$id',
        data: {
          "name": name,
          "email": email,
          "phone": phone,
          "address": address
        });
    return response.statusCode == 200;
  }
}
