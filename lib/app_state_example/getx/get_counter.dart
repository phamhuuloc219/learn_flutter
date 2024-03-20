import 'package:flutter/material.dart';
import 'package:get/get.dart';

// class Controller extends GetxController{
//   final _count =0.obs;
//   int get count => _count.value;
//
//   void tang(){
//     _count.value++;
//   }
//   void giam(){
//     _count.value--;
//   }
// }
// class PageGetxCounter extends StatelessWidget {
//   PageGetxCounter({super.key});
//   final c = Get.put(Controller());
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("GetX Demo")
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             ElevatedButton(
//                 onPressed: () {
//                   c.tang();
//                 },
//                 child: Text("+")
//             ),
//             Text("Sử dụng OBX")
//             ,
//             Obx(() => Text("${c._count}")
//             ),
//             Text("Sử dụng Controller")
//             ,
//             GetX<Controller>(
//                 builder: (controller) => Text("${controller._count}"),
//             ),
//             ElevatedButton(
//                 onPressed: () {
//                   c.giam();
//                 },
//                 child: Text("-")
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
class Controller extends GetxController{
  int _counter=0;
  int get counter => _counter;
  static Controller get(String tag){
    return Get.find(tag: tag);
  }
  void tang1(){
    _counter++;
    update(["01"]);
  }
  void tang2(){
    _counter++;
    update(["02"]);
  }
}

class SimpleStateBindings extends Bindings{

  @override
  void dependencies() {
    Get.put(Controller(),permanent: true,tag: "tag");
  }
}

class SimpleStateHome extends StatelessWidget {
  const SimpleStateHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Binding Demo"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Get.to(PageSimpleState(),binding: SimpleStateBindings());
          },
          child: Text("Simple State"),
        ),
      ),
    );
  }
}


class PageSimpleState extends StatelessWidget {
  PageSimpleState({super.key});
  //final c = Get.put(Controller(),permanent: true,tag: "tag");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Simple State Demo"),
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
                      Controller.get("tag").tang1();
                    },
                    child: Text("+ 01")
                ),

                GetBuilder(
                  init: Controller.get("tag"),
                  tag: "tag",
                  id: "01",
                    builder: (controller) => Text("${controller.counter}"),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
                      Controller.get("tag").tang2();

                    },
                    child: Text("+ 02")
                ),
                GetBuilder(
                  init: Controller.get("tag"),
                  tag: "tag",
                  id: "02",
                  builder: (controller) => Text("${controller.counter}"),
                )
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
            Get.to(PageNext()); // to -> off
          },
        child: Text("Next"),
      ),
    );
  }
}
class PageNext extends StatelessWidget {
  const PageNext({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Router Management Demo"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          children: [
            Text("hello")
          ],
        ),
      ),
    );
  }
}

