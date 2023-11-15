import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'DBhelper.dart';
import 'AddTransactionPage.dart';
import 'models/addata.dart';

class AddDriverPage extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController licensePlateController = TextEditingController();
  // const AddDriverPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tambah Tukang Ojek'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Nama'),
            ),
            TextField(
              controller: licensePlateController,
              decoration: InputDecoration(labelText: 'Nomor Polisi'),
            ),
            ElevatedButton(
              onPressed: () async {
                await DBHelper().insertDriver(Driver(
                  name: nameController.text, licensePlate: '', id: 1,
                ));
                Navigator.pop(context);
              },
              child: Text('Simpan'),
            ),
          ],
        ),
      ),
    );
  }
}
