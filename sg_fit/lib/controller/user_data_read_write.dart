import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

// Get the File Path
Future<String> get _localPath async {
  final directory = await getApplicationDocumentsDirectory();
  print(directory);
  return directory.path;
}

// Gets the location of the file
Future<File> get _localFileisRegistered async {
  final path = await _localPath;
  return new File('$path/isuserregisteredornot.txt');
}

Future<File> get _localFileAge async {
  final path = await _localPath;
  return new File('$path/age.txt');
}

Future<File> get _localFileGender async {
  final path = await _localPath;
  return new File('$path/gender.txt');
}

Future<File> get _localFileHeight async {
  final path = await _localPath;
  return new File('$path/height.txt');
}

Future<File> get _localFileWeight async {
  final path = await _localPath;
  return new File('$path/weight.txt');
}

// Write to the file
Future<File> writeToFileisRegistered(String message) async {
  final file = await _localFileisRegistered;
  return file.writeAsString(message);
}

Future<File> writeToFileAge(String message) async {
  final file = await _localFileAge;
  return file.writeAsString(message);
}

Future<File> writeToFileGender(String message) async {
  final file = await _localFileGender;
  return file.writeAsString(message);
}

Future<File> writeToFileHeight(String message) async {
  final file = await _localFileHeight;
  return file.writeAsString(message);
}

Future<File> writeToFileWeight(String message) async {
  final file = await _localFileWeight;
  return file.writeAsString(message);
}

// Read from the file
Future<String> readFromFile() async {
  try {
    final file = await _localFileisRegistered;
    return await file.readAsString();
  } catch (e) {
    return "No Files to read";
  }
}

// Read Age
Future<String> readFromFileAge() async {
  try {
    final file = await _localFileAge;
    return await file.readAsString();
  } catch (e) {
    return "No Files to read";
  }
}

// Read Weight
Future<String> readFromFileWeight() async {
  try {
    final file = await _localFileWeight;
    return await file.readAsString();
  } catch (e) {
    return "No Files to read";
  }
}
