import 'dart:developer';

import 'package:contact_app_api/model/contact_model.dart';
import 'package:contact_app_api/service/app_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ContactProvider extends ChangeNotifier {
  Dio dio = Dio();
  ClassName className = ClassName();

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  Future<List<ContactModel>> getAll() async {
    try {
      final response = await dio
          .get('https://contacts-management-server.onrender.com/api/contacts');
      if (response.statusCode == 200) {
        List<dynamic> jsonData = response.data;
        List<ContactModel> cntxt =
            jsonData.map((item) => ContactModel.fromJson(item)).toList();
        return cntxt;
      } else {
        throw Exception('ERROR');
      }
    } catch (e) {
      throw Exception('ERROR $e');
    }
  }

  Future<void> addContacts(context, ContactModel model) async {
    // ContactModel contactsModel = ContactModel(
    //   name: nameController.text.trim(),
    //   phone:int.tryParse(phoneController.text.trim()),
    //   address:addressController.text.trim(),
    //   email:emailController.text.trim(),
    // );
    try {
      final Response = await dio.post(
        'https://contacts-management-server.onrender.com/api/contacts',
        data: model.toJson(),
      );
      if (Response.statusCode == 201) {
        notifyListeners();
        Navigator.of(context).pop();
      } else {
        throw Exception('ERROR');
      }
    } catch (e) {
      throw Exception('ERROR');
    }
  }

  Future<void> updateContact(contactId, context) async {
    ContactModel contactsModel = ContactModel(
      name: nameController.text.trim(),
      phone: int.tryParse(phoneController.text.trim()),
      address: addressController.text.trim(),
      email: emailController.text.trim(),
    );
    try {
      final response = await dio.put(
        'https://contacts-management-server.onrender.com/api/contacts/$contactId',
        data: contactsModel.toJson(),
      );
      if (response.statusCode == 200) {
        notifyListeners();
        print('Contact UPDATED');
        Navigator.of(context).pop();
      } else {}
    } catch (e) {
      throw Exception('ERROR $e');
    }
  }

  Future<void> deleteContacts(String id) async {
    log(id);
    final response = await dio.delete(
      "https://contacts-management-server.onrender.com/api/contacts/$id",
    );

    if (response.statusCode == 200) {
      log('DELTED');
      notifyListeners();
    }
  }
}
