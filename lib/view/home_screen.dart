import 'package:contact_app_api/controller/contact_provider.dart';
import 'package:contact_app_api/view/add_screen.dart';
import 'package:contact_app_api/view/edit_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ContactProvider>(context);
    provider.getAll();
    return Scaffold(
      appBar: AppBar(
        title: const Text('API CONTACTS APP'),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: provider.getAll(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          } else {
            return snapshot.data?.length == 0
                ? const Center(
                    child: Text('NO Contacts Avalable'),
                  )
                : ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      final person = snapshot.data![index];

                      return ListTile(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => EditScreen(
                                    contactId: person.id,
                                  )));
                        },
                        title: Text(person.name.toString()),
                        subtitle: Text(person.phone.toString()),
                        trailing: ElevatedButton(
                          onPressed: () {
                            provider.deleteContacts(person.id.toString());
                          },
                          child: const Text('Delete'),
                        ),
                      );
                    },
                  );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => const AddScreen()));
        },
        child: const Text('ADD'),
      ),
    );
  }
}
