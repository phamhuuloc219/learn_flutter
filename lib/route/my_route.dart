import 'package:flutter/material.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});
  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  String? data;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title:Text("First Page"),
      ),
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(data??"Waitting..."),
            ElevatedButton(
              onPressed: ()async {
                data = await Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => SecondPage(data: "Cảm ơn",),)
                );
                setState(() {

                });
              },
              child: Text("to Second",),
            ),
          ],
        ),

      ) ,
    );
  }
}
class SecondPage extends StatefulWidget {
  final String? data;
  const SecondPage({super.key,this.data});
  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title:Text("Second Page"),
      ),
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(widget.data??"Waitting!"),
            ElevatedButton(
              onPressed: ()async {
                Navigator.of(context).pop("Hello world");
              },
              child: Text("To First Page",),
            ),
          ],
        ),
      ),
    );
  }
}