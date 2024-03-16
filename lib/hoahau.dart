import 'package:flutter/material.dart';

class HoaHauPage extends StatefulWidget {
  const HoaHauPage({super.key});
  @override
  State<HoaHauPage> createState() => _HoaHauPageState();
}
class _HoaHauPageState extends State<HoaHauPage> {
  TextEditingController nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text("63.CNTT-1"),
          actions: [
            IconButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("Share cho ${nameController.text} với"),
                    duration: Duration(seconds: 5),
                    action: SnackBarAction(
                      onPressed: () {
                        ScaffoldMessenger.of(context).clearSnackBars();
                      },
                      label: "close",
                    ),
                  ));
                },
                icon: const Icon(Icons.share))
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 5,
              right: 5,
            ),
            child: Column(
              children: [
                Center(
                  child: Container(
                    width: 200,
                    height: 300,
                    child: Image.network(
                      "https://kenh14cdn.com/203336854389633024/2022/8/26/photo-7-16614769456291120286620.jpeg",
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                      labelText: "Name", hintText: "Nhập tên vào đây"),
                )
              ],
            ),
          ),
        ));
  }
}