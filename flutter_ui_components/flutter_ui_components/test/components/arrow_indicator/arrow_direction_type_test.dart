import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ui_components/src/components/arrow_indicator/arrow_indicator.dart';

Future main() async {
  group('ArrowDirectionType', () {
    group('color property', () {
      test('ArrowDirectionType.up.color is $kUpColor', () {
        expect(ArrowDirectionType.up.color, kUpColor);
      });
      test('ArrowDirectionType.down.color is $kDownColor', () {
        expect(ArrowDirectionType.down.color, kDownColor);
      });
    });
  });
}
