import 'package:contact_app_api/controller/contact_provider.dart';
import 'package:contact_app_api/model/contact_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddScreen extends StatelessWidget {
  const AddScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ContactProvider>(context);
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(
                hintText: 'Name',
              ),
              controller: provider.nameController,
            ),
            TextField(
              decoration: const InputDecoration(
                hintText: 'Phone',
              ),
              controller: provider.phoneController,
            ),
            TextField(
              decoration: const InputDecoration(
                hintText: 'Email',
              ),
              controller: provider.emailController,
            ),
            TextField(
              decoration: const InputDecoration(
                hintText: 'Address',
              ),
              controller: provider.addressController,
            ),
            ElevatedButton(
                onPressed: () {
                  provider.addContacts(
                      context,
                      ContactModel(
                          address: provider.addressController.text,
                          email: provider.emailController.text,
                          name: provider.nameController.text,
                          phone: int.tryParse(provider.phoneController.text)));
                },
                child: const Text('ADD'))
          ],
        ),
      ),
    );
  }
}
