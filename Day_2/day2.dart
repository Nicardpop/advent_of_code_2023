// ignore_for_file: unused_local_variable

import 'dart:convert';
import 'dart:async';
import 'dart:io';

void main() async {
  final inpFile = new File('inp.txt');

  Stream<String> Lines = inpFile
      .openRead()
      .transform(utf8.decoder) // Decode bytes
      .transform(LineSplitter()); //   Convert into individual lines!

  try {
    int result = 0;
    await for (var line in Lines) {
      result += Finder(line);
    }
    print(result);
  } catch (e) {
    print("error:$e");
  }
}

// function !:
int Finder(var line) {
  // id part :
  List<String> id_split_1 = line.split(':');
  var id_split1_2 = id_split_1[0].split(' ');

  var id = (int.parse(id_split1_2[1]));

  // semicolne part :

  var semi_split = id_split_1[1].split(';');
  for (int i = 0; i < semi_split.length; i++) {
    // print(semi_split[i] + "\n");
  }
  // comma part :

  var comma_split = [];
  for (int i = 0; i < semi_split.length; i++) {
    if (semi_split[i].contains(',')) {
      comma_split.add(semi_split[i].split(','));
    } else {
      comma_split.add(semi_split[i]);
    }
  }
// checking for impossible amounts :
  for (var i = 0; i < comma_split.length; i++) {
    for (var j = 0; j < comma_split[i].length; j++) {
      if (comma_split[i][j].contains('blue')) {
        var list = comma_split[i][j].split(' ');
        if (int.parse(list[1]) > 14) {
          return 0;
        } else {
          print("done! blue");
          continue;
        }
      } else {
        print("Error: blue!");
      }
      if (comma_split[i][j].contains('red')) {
        var list = comma_split[i][j].split(' ');
        if (int.parse(list[1]) > 12) {
          return 0;
        } else {
          print("done! red");
          continue;
        }
      } else {
        print("Error: red!");
      }
      if (comma_split[i][j].contains('green')) {
        var list = comma_split[i][j].split(' ');
        if (int.parse(list[1]) > 13) {
          return 0;
        } else {
          print("done! green");
          continue;
        }
      } else {
        print("Error : green!");
      }
    }
  }
  return id;
}
