import 'dart:io';
import 'dart:convert';
import 'dart:async';

int Finder(var line, List<String> c) {
  int j = line.length - 1;
  String result = '';
  int i = 0;
  while (i <= j) {
    bool found1 = c.contains(line[i]);
    if (found1) {
      result += line[i];
      break;
    } else {
      i++;
    }
  }
  while (j >= 0) {
    bool found2 = c.contains(line[j]);
    if (found2) {
      result += line[j];
      break;
    } else {
      j--;
    }
  }

  return int.parse(result);
}

void main() async {
  var sc = "1234567890";
  final c = sc.split(''); // [1, 2, 3, 4, 5, 6, 7, 8, 9, 0]

  final inpFile = new File('inp.txt');
  inpFile.readAsString().then((String contents) {
    //print(contents);
  });
// test :

  Stream<String> lines = inpFile
      .openRead()
      .transform(utf8.decoder) // Decode bytes to UTF-8.
      .transform(LineSplitter()); // Convert stream to individual lines.

  try {
    int result = 0;
    List<String> Sfile = [];
    await for (var line in lines) {
      result += Finder(line, c);
      print("result :$result");
    }
    print('File is now closed.');
  } catch (e) {
    print('Error: $e');
  }
}
