import 'dart:convert';
import 'dart:io';

void main() async {
  print("Started...!");

  final inpFile = new File('inp.txt');
  Stream<String> lines = inpFile
      .openRead()
      .transform(utf8.decoder) // decode
      .transform(LineSplitter()); // split into lines
  try {
    num result = 0;

    // for loop :

    await for (var line in lines) {
      // function :
      result += finder(line);
    }
    print("The result :$result");
  } catch (e) {
    print("Error $e");
  }
}

int finder(var line) {
  // funciton core:
  final split_1 = line.split(':');
  // winning number and the randoms :
  final number = split_1[1].split('|');
  final N_winning = number[0].split(' ');
  final N_random = number[1].split(' ');
  final CN_W = [];
  final CN_R = [];
  // colection of the id :
  final id_split = split_1[0].split(' ');
  var id = id_split[0];
  var points = 0;

  // cleaning the data :
  for (var number in N_winning) {
    number.isNotEmpty == true ? CN_W.add(number) : "this is false";
  }
  for (var number in N_random) {
    number.isNotEmpty == true ? CN_R.add(number) : "this is false";
  }

  for (var num in CN_R) {
    CN_W.contains(num) && points == 0
        ? (points++)
        : CN_W.contains(num) && points > 0
            ? points = 2 * points
            : print("$num dosnt exits!");
  }

  return points;
}
