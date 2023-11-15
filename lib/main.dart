import 'package:assesppbl/DBhelper.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'AddDriverPage.dart';
import 'AddTransactionPage.dart';
import 'models/addata.dart';
import 'DBhelper.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('OPANGATIMIN'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddDriverPage()),
                );
              },
              child: Text('Tambah Tukang Ojek'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddTransactionPage()),
                );
              },
              child: Text('Tambah Transaksi'),
            ),
            ElevatedButton(
              onPressed: () async {
                List<Driver> drivers = await DBHelper().getDrivers();
                Map<String, int> dailyReport = {};
                for (Driver driver in drivers) {
                  int totalAmount = 0;
                  for (Order order in driver.order) {
                    if (order.date.day == DateTime.now().day &&
                        order.date.month == DateTime.now().month &&
                        order.date.year == DateTime.now().year) {
                      totalAmount += order.amount;
                    }
                  }
                  dailyReport[driver.name] = totalAmount;
                }
                print("Laporan Harian: $dailyReport");
              },
              child: Text('Generate Laporan'),
            ),
          ],
        ),
      ),
    );
  }
}
