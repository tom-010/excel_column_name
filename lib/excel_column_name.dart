String toColumnName(int columnIndex) {
  
  if(columnIndex < 0) {
    return '-${_toColumnNameOneBased((-columnIndex-1) +1)}';  
  }
  return _toColumnNameOneBased(columnIndex + 1);
}

String _toColumnNameOneBased(int n) {
  if (n == 0) {
    return '';
  }
  final q = (n - 1) ~/ 26;
  final r = (n - 1) % 26;
  return _toColumnNameOneBased(q) + alphabet[r];
}

int fromColumnName(String columnName) {
  if(columnName.startsWith('-')) {
    return -_fromColumnNameOneBased(columnName.substring(1));
  }
  return _fromColumnNameOneBased(columnName) - 1;
}

int _fromColumnNameOneBased(String columnName) {
  int res = 0;
  for(final ch in columnName.split('')) {
    res = res * 26 + (alphabetToIndex[ch]!+1);
  }
  return res;
}

const List<String> alphabet = [
  'A',
  'B',
  'C',
  'D',
  'E',
  'F',
  'G',
  'H',
  'I',
  'J',
  'K',
  'L',
  'M',
  'N',
  'O',
  'P',
  'Q',
  'R',
  'S',
  'T',
  'U',
  'V',
  'W',
  'X',
  'Y',
  'Z',
];

const Map<String, int> alphabetToIndex = {
  'A': 0,
  'B': 1,
  'C': 2,
  'D': 3,
  'E': 4,
  'F': 5,
  'G': 6,
  'H': 7,
  'I': 8,
  'J': 9,
  'K': 10,
  'L': 11,
  'M': 12,
  'N': 13,
  'O': 14,
  'P': 15,
  'Q': 16,
  'R': 17,
  'S': 18,
  'T': 19,
  'U': 20,
  'V': 21,
  'W': 22,
  'X': 23,
  'Y': 24,
  'Z': 25,
};
