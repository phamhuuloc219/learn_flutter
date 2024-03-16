import 'dart:math';

void main()async{
  // bai tap 4
  /*List<String> list = ["Nha Trang", "Huế","TP.HCM", "Hà Nội", "Bình Dương"];
  List<int> cd=list.map((e) => e.length).toList();
  print(list);
  print(cd);
  cd.forEach((element) {
    print(element*element);
  });*/
  // end bt4
  //////////////////////////////////////////////////////////////////////////////////
  // bai tap 5
    // Cach 1
  print("waiting...");
  int num = await lateNum();
  print(num);
    // Cach 2
  print("2 waiting...");
  lateNum().then((value) => print(value));
  // check chan/le
  lateNum().then((value) {
    if (value%2==0) {
      print("$value la so chan");
    }
    else {
      print("$value la so le");
    }

  });
  //
  print("end");
  //end bt5


}
Future<int> lateNum()async{
  var  num=await Future.delayed(
    Duration(seconds: 3),
    () => Random().nextInt(100),
  );
  return num;
}