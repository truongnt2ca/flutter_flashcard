
String formatWord(String word) {
  if (word.contains('(')) {
    int index = word.indexOf('(');
    return '${word.substring(0, index)}\n${word.substring(index)}';
  }
  return word;
}