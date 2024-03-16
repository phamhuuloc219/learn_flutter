import 'package:flutter/material.dart';
import 'package:learn_flutter/app_state_example/Counterstate.dart';
import 'package:provider/provider.dart';

class CounterStateProvider extends StatelessWidget {
  const CounterStateProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => CounterState(),
      child: PageCounter2(),
    );
  }
}
 class PageCounter extends StatelessWidget {
   PageCounter({super.key});
   int value = 0;
   @override
   Widget build(BuildContext context) {
     return Scaffold(
       appBar: AppBar(
         title: Text("VD Provider"),
       ),
       body: Center(
         child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
             ElevatedButton(
                 onPressed: () {
                   // đối tượng được trả về bởi read chỉ được sử dụng trong các sự kiện
                   value++;
                   var c = context.read<CounterState>();
                   c.tang();
                 },
                 child: Text("+")
             ),
             Consumer<CounterState>(
               builder: (context, value, child) {
                 return Column(
                   children: [
                     Text("${value.count}",style:
                     TextStyle(
                         fontSize: 20,
                         backgroundColor: Colors.amberAccent,
                         color: Colors.black),
                     ),
                     child?? Text("Chưa có widget")
                   ],
                 );
               },
               child: Text("Not rebuild $value"),
             ),
             ElevatedButton(
                 onPressed: () {
                   value--;
                   var c = context.read<CounterState>();
                   c.giam();
                 },
                 child: Text("-")
             ),
           ],
         ),
       ),
     );
   }
 }

 class PageCounter2 extends StatelessWidget {
   const PageCounter2({super.key});

   @override
   Widget build(BuildContext context) {
     //var c=context.watch<CounterState>();
     var c = Provider.of<CounterState>(context,listen: true);
     return Scaffold(
     appBar: AppBar(
       backgroundColor: Theme.of(context).colorScheme.inversePrimary,
       title: Text("VD2"),
     ),
       body: Center(
         child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
             ElevatedButton(onPressed: () {
               var c= context.read<CounterState>();
               c.tang();

             }, child: Text("+")),
             Text("${c.count}"),
             ElevatedButton(onPressed: () {
               var c= context.read<CounterState>();
               c.giam();
             }, child: Text("-")),
           ],
         ),
       ),
     );
   }
 }

