import 'calc.dart';

class Output {
  Output(MentalCalc calc) {
    // 値が来たらそのまま出力する
    calc.onAdd.listen((value) {
      print(value);
    });
  }
}
