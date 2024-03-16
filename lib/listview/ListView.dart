import 'dart:math';
import 'package:flutter/material.dart';

List<String> sps = [
  "Xoài",
  "Mít",
  "Ổi",
  "Cóc",
  "Me",
  "Sơ ri",
  "Mơ",
  "Bưởi",
  "Mận",
  "Sầu riêng",
  "Cam",
  "Quýt",
  "Nho",
  "Kiwi",
  "Táo",
  "Chôm chôm"
];

class ListViewPage extends StatelessWidget {
  const ListViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Cửa hàng trái cây"),
      ),
      body: ListView.separated(
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(Icons.food_bank),
            title: Text(sps[index]),
            subtitle: Text("Trái cây Việt Gap"),
            trailing: Text("${Random().nextInt(100)}.000 VND"),
          );
        },
        separatorBuilder: (context, index) => Divider(thickness: 1.5),
        itemCount: sps.length,
      ),
    );
  }
}
