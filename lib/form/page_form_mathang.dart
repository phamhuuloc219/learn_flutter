import 'package:flutter/material.dart';
import 'package:learn_flutter/form/form_model.dart';

class PageFormMatHang extends StatelessWidget {
  PageFormMatHang({super.key});
  GlobalKey<FormState> formState=GlobalKey<FormState>();
  TextEditingController txtName = TextEditingController();
  TextEditingController txtSoLuong = TextEditingController();
  MatHang m = MatHang();
  String? dropdownValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Form Demo"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key:formState,
          autovalidateMode: AutovalidateMode.disabled ,
          child: Column(
            children: [
              TextFormField(
                controller: txtName,
                onSaved: (newValue) => m.name = newValue,
                validator: (value) => validateString(value),
                decoration: InputDecoration(
                  labelText: "Tên mặt hàng"
                ),
              ),
              DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    labelText: "Loại mặt hàng"
                  ),
                  onChanged:(value) => dropdownValue = value,
                  onSaved: (newValue) => m.loaiMH = newValue,
                  value: dropdownValue,
                  validator: (value) => validateString(value),
                  items: loaiMHs.map((
                      loaiMH) => DropdownMenuItem<String>(
                    child: Text("${loaiMH}"),
                    value: loaiMH,
                  )
                  ).toList(),
              ),
              TextFormField(
                controller: txtSoLuong,
                keyboardType: TextInputType.number,
                onSaved: (newValue) => m.soLuong = int.parse(newValue!),
                validator: (value) => validateSoLuong(value),
                decoration: InputDecoration(
                  labelText: "Số lượng"
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                      onPressed:() => _save(context),
                      child: Text("Save"))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  _save(BuildContext context) {
    if(formState.currentState!.validate()){
      formState.currentState!.save();
      hienThiDialog(context);
    }
  }

  validateString(String? value) {
    return value == null || value.isEmpty ? "Bạn chưa nhập dữ liệu" : null;
  }

  validateSoLuong(String? value) {
    if(value==null || value.isEmpty)
      return "Bạn chưa nhập số lượng";
    else
      return int.parse(value)<0 ? "Số lượng không được phép nhỏ hơn 0" : null;
  }

  void hienThiDialog(BuildContext context) {
    var diaLog= AlertDialog(
      title:Text("Thông báo"),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("Bạn đã nhập mặt hàng:"),
          Text("Tên MH:${m.name}"),
          Text("Loại MH:${m.loaiMH}"),
          Text("Số lượng:${m.soLuong}"),
        ],
      ),
      actions: [
        ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("OK"))
      ],
    );
    showDialog(
        context: context,
        builder: (context) => diaLog,
    );
  }
}
