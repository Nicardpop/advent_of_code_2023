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
    num sec_result = 0;
    await for (var line in Lines) {
      //result += Finder(line);
      sec_result += Finder_2(line);
    }
    //print(result);
    print("Sum results :$sec_result \n");
  } catch (e) {
    print("error:$e");
  }
}

// function PART 1!:
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

// function PART 2!:

int Finder_2(var line) {
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

  var b_min = 0, r_min = 0, g_min = 0;
// checking for impossible amounts :
  for (var i = 0; i < comma_split.length; i++) {
    for (var j = 0; j < comma_split[i].length; j++) {
      if (comma_split[i][j].contains('blue')) {
        var list = comma_split[i][j].split(' ');
        var blue = int.parse(list[1]);
        if (blue > b_min && blue != 0) b_min = blue;
        print("done! $blue blue");
        if (b_min == 0) {
          b_min += 100;
          print("Error!");
        }
      }
      if (comma_split[i][j].contains('red')) {
        var list = comma_split[i][j].split(' ');
        var red = int.parse(list[1]);
        if (red > r_min && red != 0) r_min = red;
        print("done! $red red");
        if (r_min == 0) {
          r_min += 100;
          print("Error!");
        }
      }
      if (comma_split[i][j].contains('green')) {
        var list = comma_split[i][j].split(' ');
        var green = int.parse(list[1]);
        if (green > g_min && green != 0) g_min = green;
        print("done! $green green");
        if (g_min == 0) {
          g_min += 100;
          print("Error!");
        }
      }
    }
  }
  print("Game ${id} few :$b_min blue, $r_min red, $g_min green");
  return b_min * r_min * g_min;
}
