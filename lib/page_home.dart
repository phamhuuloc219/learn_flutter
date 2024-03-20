import 'package:flutter/material.dart';
import 'package:learn_flutter/app_state_example/getx/get_counter.dart';
import 'package:learn_flutter/app_state_example/page_counter.dart';
import 'package:learn_flutter/form/page_form_mathang.dart';
import 'package:learn_flutter/hoahau.dart';
import 'package:learn_flutter/listview/ListView.dart';
import 'package:learn_flutter/route/my_route.dart';
import 'app_state_example/list_provider/gio_hang_app.dart';

class PageHome extends StatelessWidget {
  const PageHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("MyApp"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              _buildButton(context, label: "Temp", destination: HoaHauPage()),
              _buildButton(context, label: "ListView", destination: ListViewPage()),
              _buildButton(context, label:"Route", destination: FirstPage()),
              _buildButton(context, label: "VD Provider", destination: CounterStateProvider()),
              _buildButton(context, label: "Fruit Store", destination: GioHangApp()),
              _buildButton(context, label: "Form", destination: PageFormMatHang()),
              //_buildButton(context, label: "GetX", destination: PageGetxCounter()),
              _buildButton(context, label: "Simple State", destination: SimpleStateHome()),
            ],
          ),
        ),
      ),
    );
  }
}
Widget _buildButton(BuildContext context, {required String label, required Widget destination}){
  return Container(
    width: 180,
    child: ElevatedButton(
        onPressed: (){
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => destination,)
          );
        },
        child: Text(label)
    ),
  );
}