import 'package:flutter/material.dart';
import 'package:phuong_trinh_flutter/components/app_elevated_button.dart';
import 'package:phuong_trinh_flutter/components/app_text_field.dart';
import 'package:phuong_trinh_flutter/untils/phuong_trinh.dart';

class HomePage2 extends StatefulWidget {
  const HomePage2({super.key, required this.title});
  final String title;

  @override
  State<HomePage2> createState() => _HomePage2State();
}

class _HomePage2State extends State<HomePage2> {
  TextEditingController aController = TextEditingController();
  TextEditingController bController = TextEditingController();
  TextEditingController cController = TextEditingController();
  String kq = '';

  String get isValidate {
    String st = '';
    try {
      st = 'a';
      double.parse(aController.text.trim());
      st = 'b';
      double.parse(bController.text.trim());
      st = 'c';
      double.parse(cController.text.trim());
    } catch (_) {
      return st;
    }
    return 'valid';
  }

  String format(double a) {
    String st = a.toStringAsFixed(4);
    while ((st[st.length - 1] == '.') || (st[st.length - 1] == '0')) {
      st = st.substring(0, st.length - 1);
    }
    return st;
  }

  void _caculate() {
    if (isValidate != 'valid') {
      kq = '';
      setState(() {});
      final snackBar = SnackBar(
        content: Text('$isValidate phải là số 👮'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      return;
    }

    double a = double.parse(aController.text.trim());
    double b = double.parse(bController.text.trim());
    double c = double.parse(cController.text.trim());

    List<double>? results = PhuongTrinh.pt(a, b, c);

    if (results == null) {
      kq = 'Phương Trình Vô Số Nghiệm';
    } else if (results.isEmpty) {
      kq = 'Phương Trình Vô Nghiệm';
    } else if (results.length == 1) {
      double x = results[0];
      kq = 'x = ${format(x)}';
    } else {
      double x1 = results[0];
      double x2 = results[1];
      kq = 'x1 = ${format(x1)}, x2 = ${format(x2)}';
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey,
          centerTitle: true,
          leading:
              const Icon(Icons.abc_outlined, size: 30.0, color: Colors.red),
          title: const Text('Giải Phương Trình',
              style: TextStyle(color: Colors.red, fontSize: 20.0)),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0)
                .copyWith(top: 40.0, bottom: 20.0),
            child: Column(
              children: [
                const Text(
                  "a *x ^ 2 + b * 2 + c = 0",
                  style: TextStyle(color: Colors.red, fontSize: 20.0),
                ),
                const SizedBox(height: 40.0),
                AppTextField(
                  controller: aController,
                  hintText: 'Nhập a: ',
                  labelText: 'Nhập a: ',
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(height: 20.0),
                AppTextField(
                  controller: bController,
                  hintText: 'Nhập b: ',
                  labelText: 'Nhập b: ',
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(height: 20.0),
                AppTextField(
                  controller: cController,
                  hintText: 'Nhập c: ',
                  labelText: 'Nhập c: ',
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(height: 40.0),
                AppElevatedButton(
                  onPressed: () {
                    _caculate();
                  },
                  text: 'Caculate',
                ),
                const SizedBox(height: 20.0),
                Row(
                  children: [
                    const Text(
                      'result',
                      style: TextStyle(color: Colors.red, fontSize: 20.0),
                    ),
                    const SizedBox(width: 20.0),
                    Text(
                      kq,
                      style:
                          const TextStyle(color: Colors.grey, fontSize: 18.0),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
