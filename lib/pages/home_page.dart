import 'package:flutter/material.dart';
import 'package:phuong_trinh_flutter/untils/phuong_trinh.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});
  final String title;
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController aController = TextEditingController();
  TextEditingController bController = TextEditingController();
  TextEditingController cController = TextEditingController();
  String kq = '';

  String get isValidate {
    String st = ' ';
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

  void _caculate() {
    if (isValidate != 'valid') {
      return;
    }
    double a = double.parse(aController.text.trim());
    double b = double.parse(bController.text.trim());
    double c = double.parse(cController.text.trim());
    (double?, double?)? results = PhuongTrinh.pt_2(a, b, c);
    if (results == null) {
      kq = 'Phương Trình Vô Số Nghiệm';
    } else if (results == (null, null)) {
      kq = 'Phương Trình Vô Nghiệm';
    } else if ((results.$1 != null) && (results.$2 == null)) {
      kq = 'Phương Trình Có 1 Nghiệm = ${results.$1!.toStringAsFixed(4)}';
    } else {
      kq =
          'x1 = ${results.$1!.toStringAsFixed(4)}, x2 = ${results.$2!.toStringAsFixed(4)}';
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.pink.withOpacity(0.2),
          leading: const Icon(
            Icons.abc_outlined,
            size: 30.0,
            color: Colors.red,
          ),
          title: Text(
            widget.title,
            style: const TextStyle(color: Colors.red, fontSize: 20.0),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0)
                .copyWith(top: 40.0, bottom: 20.0),
            child: Column(
              children: [
                const Text(
                  'A * X ^ 2 + B * X + C = 0',
                  style: TextStyle(color: Colors.red, fontSize: 20.0),
                ),
                const SizedBox(height: 40.0),
                TextField(
                  controller: aController,
                  decoration: InputDecoration(
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 20.0),
                    hintText: 'Nhập a',
                    hintStyle: const TextStyle(color: Colors.grey),
                    labelText: 'Nhập a',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16.0)),
                  ),
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(height: 20.0),
                TextField(
                  controller: bController,
                  decoration: InputDecoration(
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 20.0),
                    hintText: 'Nhập a',
                    hintStyle: const TextStyle(color: Colors.grey),
                    labelText: 'Nhập a',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16.0)),
                  ),
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(height: 20.0),
                TextField(
                  controller: cController,
                  decoration: InputDecoration(
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 20.0),
                    hintText: 'Nhập a',
                    hintStyle: const TextStyle(color: Colors.grey),
                    labelText: 'Nhập a',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16.0)),
                  ),
                  textInputAction: TextInputAction.done,
                ),
                const SizedBox(height: 40.0),
                ElevatedButton(
                  onPressed: () {
                    _caculate();
                  },
                  style: const ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(Colors.red)),
                  child: const Text(
                    'Caculate',
                    style: TextStyle(color: Colors.white, fontSize: 16.0),
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Result: ',
                      style: TextStyle(color: Colors.brown, fontSize: 16.0),
                    ),
                    const SizedBox(width: 20.0),
                    Expanded(
                      child: Text(
                        kq,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style:
                            const TextStyle(color: Colors.red, fontSize: 20.0),
                      ),
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
