import 'package:flutter/material.dart';
import 'package:newbytebank/database/dao/contact_dao.dart';
import 'package:newbytebank/models/contact.dart';

// ignore: use_key_in_widget_constructors
class ContactForm extends StatefulWidget {
  @override
  State<ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _accountNumberController =
      TextEditingController();
  final ContactDao _dao = ContactDao();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("New Contact"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _nameController,
              style: const TextStyle(
                fontSize: 24.0,
              ),
              decoration: const InputDecoration(
                labelText: 'Full Name',
                hintText: 'Name',
                hintStyle: TextStyle(
                  color: Colors.white,
                ),
                labelStyle: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: TextField(
                controller: _accountNumberController,
                style: const TextStyle(
                  fontSize: 24.0,
                ),
                decoration: const InputDecoration(
                  labelText: 'Account Number',
                  hintText: '0000',
                  hintStyle: TextStyle(
                    color: Colors.white,
                  ),
                  labelStyle: TextStyle(
                    color: Colors.white,
                  ),
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: SizedBox(
                width: double.maxFinite,
                child: ElevatedButton(
                  onPressed: () {
                    final String? name = _nameController.text;
                    final int? accountNumber =
                        int.tryParse(_accountNumberController.text);
                    final Contact newContact =
                        Contact(0, name!, accountNumber!);
                    _dao.save(newContact).then((id) => Navigator.pop(context));
                  },
                  child: const Text("Create"),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

// void _createContact(context, name, accountNumber) {
//   if (name != null && accountNumber != null) {

//     // Navigator.pop(context, newContact);
//     // debugPrint('$transferenciaCriada');
//     // ScaffoldMessenger.of(context).showSnackBar(
//     //   SnackBar(
//     //     content: Text('$newContact'),
//     //   ),
//     // );
//   }
// }
