import 'package:flutter/material.dart';
import 'package:learn_flutter/app_state_example/list_provider/app_state.dart';
import 'package:provider/provider.dart';
import 'package:badges/badges.dart' as badges;

class GioHangApp extends StatelessWidget {
  const GioHangApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppGioHangState(),
      child: MaterialApp(
        home:GioHangHomePage(),
        debugShowCheckedModeBanner: false,
      ),

    );
  }
}
class GioHangHomePage extends StatelessWidget {
  const GioHangHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var c=context.watch<AppGioHangState>();
    return Scaffold(
      appBar: AppBar(
        title: Text("Fruit Store"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [

          Padding(
            padding: const EdgeInsets.only(right:20,),
            child: badges.Badge(
              badgeContent: Text("${c.soLuongMHGH}"),
              child: Icon(Icons.shopping_cart_outlined),
              onTap:() => Navigator.of(context).push(MaterialPageRoute(builder: (context) => GioHang(),)),
            ),
          )
        ],
      ),
      body: ListView.separated(
          itemBuilder: (context, index) {
            return ListTile(
              title: Text("${c.dssp[index]}"),
              trailing: IconButton(
                  onPressed: () {
                    var appState= context.read<AppGioHangState>();
                    appState.themVaoGioHang(index);
                  },
                  icon: c.kiemTraMH_CoTrongGH(index)==false? Icon(Icons.add):Icon(Icons.check),
              ),
            );
          },
          separatorBuilder: (context, index) => Divider(thickness: 1.5,),
          itemCount: c.dssp.length,
      ),
    );
  }
}
class GioHang extends StatelessWidget {
  const GioHang({super.key});

  @override
  Widget build(BuildContext context) {
    var c = context.watch<AppGioHangState>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Shopping Cart"),
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView.separated(
                    itemBuilder: (context, index) {
                    int id = c.gioHang[index];
                    return ListTile(
                        title: Text("${c.dssp[id]}"),
                        trailing: IconButton(
                            onPressed: () {
                            var appState = context.read<AppGioHangState>();
                                appState.xoaSanPham(c.dssp[id]);
                            },
                            icon: Icon(Icons.remove_circle_outline),
                        ),
                        );
                    },
                      separatorBuilder: (context, index) => Divider(thickness: 1.5),
                      itemCount: c.gioHang.length,
                    ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 15,bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text("Tổng số tiền: "),
                Text("${c.tienMuaHang()} nvd" , style: TextStyle(color: Colors.red),)
              ],
            ),
          ),
        ],
      )
    );
  }
}