import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class ContactsServiceView extends StatefulWidget {
  const ContactsServiceView({super.key});

  @override
  State<ContactsServiceView> createState() => _ContactsServiceState();
}

class _ContactsServiceState extends State<ContactsServiceView> {
  @override
  void initState() {
    super.initState();
  }

  Future<void> getContacts() async {
    // Get all contacts on device
    List<Contact> contacts = await ContactsService.getContacts();

    // print all contacts

    contacts.forEach((contact) {
      print("nombre ${contact.displayName}");
      print("email ${contact.emails}");
      print("direccion ${contact.postalAddresses}");

      if (contact.phones?.first != null) {
        contact.phones?.forEach((element) {
          print("telefono ${element.value}");
        });
      }
      ;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Contacts Plugin Example')),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            ElevatedButton(
              child: const Text('Contacts list'),
              onPressed: () => getContacts(),
            ),
          ],
        ),
      ),
    );
  }
}
