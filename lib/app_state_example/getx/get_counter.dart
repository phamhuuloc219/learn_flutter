import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Controller extends GetxController{
  final _count =0.obs;
  int get count => _count.value;

  void tang(){
    _count.value++;
  }
  void giam(){
    _count.value--;
  }
}
class PageGetxCounter extends StatelessWidget {
  PageGetxCounter({super.key});
  final c = Get.put(Controller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GetX Demo")
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  c.tang();
                },
                child: Text("+")
            ),
            Text("Sử dụng OBX")
            ,
            Obx(() => Text("${c._count}")
            ),
            Text("Sử dụng Controller")
            ,
            GetX<Controller>(
                builder: (controller) => Text("${controller._count}"),
            ),
            ElevatedButton(
                onPressed: () {
                  c.giam();
                },
                child: Text("_")
            ),
          ],
        ),
      ),
    );
  }
}
