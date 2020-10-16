import 'dart:async';
import 'dart:math' show Random;

class MentalCalc {
  // ignore: close_sinks
  final _calcController = StreamController<int>();
  final _outputController = StreamController<String>();
  final _stopController = StreamController<Null>();

  // sinkに入力するメソッドのGetter
  Function(int) get add => _calcController.sink.add;

  //出力streamのGetter
  Stream<String> get onAdd => _outputController.stream;
  Stream<String> get onStop => _stopController.stream;

// 合計値
  int _sum = 0;

  MentalCalc(int repeat) {
    _calcController.stream.listen((count) {
      if (count < repeat + 1) {
        // 1～99の数を出力側に渡すとともに、それまでの数に足し合わせる
        var num = Random().nextInt(99) + 1;
        _outputController.sink.add('$num');
        _sum += num;
      } else {
        // 合計値を出力側に渡し、停止の連絡も行う
        _outputController.sink.add('答えは$_sum');
        _stopController.sink.add(null);
      }
    });
  }
}
