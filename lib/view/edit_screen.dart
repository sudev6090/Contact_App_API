import 'package:contact_app_api/controller/contact_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditScreen extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final contactId;
  const EditScreen({super.key, this.contactId});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ContactProvider>(context);
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          TextField(
            decoration: const InputDecoration(hintText: 'Name'),
            controller: provider.nameController,
          ),
          TextField(
            decoration: const InputDecoration(hintText: 'Phone'),
            controller: provider.phoneController,
          ),
          TextField(
            decoration: const InputDecoration(hintText: 'email'),
            controller: provider.emailController,
          ),
          TextField(
            decoration: const InputDecoration(hintText: 'Address'),
            controller: provider.addressController,
          ),
          ElevatedButton(
              onPressed: () {
                provider.updateContact(contactId, context);
              },
              child: const Text('CONFIRM'))
        ],
      ),
    );
  }
}
