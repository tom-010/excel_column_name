import 'package:excel_column_name/excel_column_name.dart';
import 'package:test/test.dart';

void main() {
  group('to_column_name', () {
    test('single letters', () {
      expect(toColumnName(0), 'A');
      expect(toColumnName(1), 'B');
      expect(toColumnName(25), 'Z');
    });

    test('double letters', () {
      expect(toColumnName(26), 'AA');
    });

    test('multiple letters', () {
      expect(toColumnName(859), 'AGB');
    });

    test('negative', () {
      expect(toColumnName(-1), '-A');
      expect(toColumnName(-2), '-B');
      expect(toColumnName(-859), '-AGA');
    });

  });

  group('from column name', () {
    test('single letters', () {
      expect(fromColumnName('A'), 0);
      expect(fromColumnName('B'), 1);
      expect(fromColumnName('Z'), 25);
    });

    test('double letters', () {
      expect(fromColumnName('AA'), 26);
    });

    test('negative', () {
      expect(fromColumnName('-A'), -1);
      expect(fromColumnName('-B'), -2);
      expect(fromColumnName('-AGA'), -859);
    });
  });

  test('roundtrip', () {
    for(int i=-10000; i<10000; i++) {
      expect(fromColumnName(toColumnName(i)), i);
    }
  });
}
