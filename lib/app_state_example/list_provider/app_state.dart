import 'dart:math';

import 'package:flutter/foundation.dart';

class AppGioHangState extends ChangeNotifier{
  List<String> _dssp = [
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
  List<int> _gioHang=[];
  int _soLuongMHGH=0;
  List<String> get dssp=>_dssp;
  List<int> get gia => _dssp.map((e) => Random().nextInt(100)*1000).toList();
  List<int> get gioHang=>_gioHang;
  int get soLuongMHGH=>_gioHang.length;
  themVaoGioHang(int index){
    if(kiemTraMH_CoTrongGH(index)==false) {
      _gioHang.add(index);
      notifyListeners();
    }
  }
  bool kiemTraMH_CoTrongGH(int index){
    for(int i=0 ; i<gioHang.length ; i++){
      if(gioHang[i]==index){
        return true;
      }
    }
    return false;
  }
  void xoaSanPham(String product) {
    int indexToRemove = _dssp.indexOf(product);
    if (indexToRemove != -1 && _gioHang.contains(indexToRemove)) {
      _gioHang.remove(indexToRemove);
      notifyListeners();
    }
  }
  int tienMuaHang(){
    int t=0;
    for(int i in gioHang)
      t+=gia[i];
    return t;
  }
}