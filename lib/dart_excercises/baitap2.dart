class SinhVien {
  String id, ten;
  String? ngaySinh, queQuan;
  SinhVien({required this.id, required this.ten, this.ngaySinh, this.queQuan});
  @override
  String toString() {
    return 'SinhVien{id:$id,ten:$ten,ngaySinh:$ngaySinh,queQuan:$queQuan}';
  }
}

class QLSV {
  List<SinhVien> list = [];
  void add(SinhVien sv) {
    list.add(sv);
  }

  void inDS() {
    list.forEach((sv) {
      print(sv.toString());
    });
  }

  void inDS2() {
    for (var sv in list) {
      print(sv.toString());
    }
  }
}
