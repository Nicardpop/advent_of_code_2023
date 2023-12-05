import 'dart:convert';
import 'dart:io';

void main() async {
  final inpFile = new File('inp.txt');
  String symbols = "@ \$ # % & * - + = /";
  final symbolList = symbols.split(' ');
  print(symbolList);

  Stream<String> lines = inpFile
      .openRead()
      .transform(utf8.decoder) // decode utf8
      .transform(LineSplitter()); // splite to lines

  try {
    await for (var line in lines) {
      print(line);
    }
  } catch (e) {
    print("Error $e");
  }
}
