import 'package:flutter/material.dart';
import 'package:flutter/src/animation/animation_controller.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/src/widgets/ticker_provider.dart';
import 'DBhelper.dart';
import 'AddDriverPage.dart';
import 'models/addata.dart';

class AddTransactionPage extends StatelessWidget {
  // const AddTransactionPage({super.key});
  final TextEditingController priceController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tambah Transaksi'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Dropdown to select driver
            // Implement dropdown based on the list of drivers in the database
            ElevatedButton(
              onPressed: () {},
              child: Text('Pilih Tukang Ojek'),
            ),
            TextField(
              controller: priceController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Harga'),
            ),
            ElevatedButton(
              onPressed: () async {
                // Save transaction to the database
                await DBHelper().insertOrder(Order(
                  driverName:
                      "Selected Driver", // Replace with the selected driver name
                  date: DateTime.now(),
                  amount: int.parse(priceController.text),
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
