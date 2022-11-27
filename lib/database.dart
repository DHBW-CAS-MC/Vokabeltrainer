// @dart=2.9

import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:convert';
import 'package:path_provider/path_provider.dart';

// class Db extends StatefulWidget {
//   @override
//   State createState() => new DbState();
// }

// class DbState extends State<Db> {
//   TextEditingController key = new TextEditingController();
//   TextEditingController value = new TextEditingController();

//   File jsonFile;
//   Directory dir;
//   String fileName = "db.json";
//   bool fileExist = false;
//   Map<String, String> fileContent;

//   @override
//   void initState() {
//     super.initState();
//     getApplicationDocumentsDirectory().then((Directory directory) {
//       dir = directory;
//       jsonFile = new File(dir.path + "/" + fileName);
//       fileExist = jsonFile.existsSync();
//       if (fileExist)
//         this.setState(
//             () => fileContent = json.decode(jsonFile.readAsStringSync()));
//     });
//   }

//   void createFile(Map<String, String> content, Directory dir, String fileName) {
//     File file = new File(dir.path + "/" + fileName);
//     file.createSync();
//     fileExist = true;
//     file.writeAsStringSync(json.encode(content));
//   }

//   void writeToFile(String key, String value) {
//     print('writing');
//     Map<String, String> content = {key: value};
//     if (fileExist) {
//       Map<String, String> jsonFileContent =
//           json.decode(jsonFile.readAsStringSync());
//       jsonFileContent.addAll(content);
//       jsonFile.writeAsStringSync(json.encode(jsonFileContent));
//     } else {
//       print("no File!");
//       createFile(content, dir, fileName);
//     }
//     this.setState(() => fileContent = json.decode(jsonFile.readAsStringSync()));
//   }
// }

class Db {
  String fileName = "db.json";
  bool fileExist = false;
  var fileContent;
  var jsonFile;
  var dir;

  void initState() {
    getApplicationDocumentsDirectory().then((Directory directory) {
      dir = directory;
      jsonFile = new File(dir.path + "/" + fileName);
      fileExist = jsonFile.existsSync();
      if (fileExist) fileContent = json.decode(jsonFile.readAsStringSync());
    });
  }

  void writeToFile(key, value) {
    print('writing');
    Map<String, String> content = {key: value};
    if (fileExist) {
      Map<String, String> jsonFileContent =
          json.decode(jsonFile.readAsStringSync());
      jsonFileContent.addAll(content);
      jsonFile.writeAsStringSync(json.encode(jsonFileContent));
    } else {
      print("no File!");
    }
  }

  List getDb() {
    var filePath = "/" + fileName;
    var input = File(Directory.current.path + filePath).readAsStringSync();
    var map = jsonDecode(input);
    return map;
  }

  void deleteWord(index) {
    var filePath = "/" + fileName;
    List map = getDb();
    map.removeAt(index);
    var jsonMap = json.encode(map);
    File(Directory.current.path + filePath).writeAsStringSync(jsonMap);
  }

  void writeWord(key, value) {
    var filePath = "/" + fileName;
    List map = getDb();
    map.add({key, value});
    var jsonMap = json.encode(map);
    File(Directory.current.path + filePath).writeAsStringSync(jsonMap);
  }
}

// class Test7 {
//   final String kFileName = 'test.json';
//   TextEditingController _controllerKey, _controllerValue;
//   bool _fileExists = false;
//   File _filePath;

//   // First initialization of _json (if there is no json in the file)
//   Map<String, dynamic> _json = {};
//   String _jsonString;

//   Future<String> get _localPath async {
//     final directory = await getApplicationDocumentsDirectory();
//     return directory.path;
//   }

//   Future<File> get _localFile async {
//     final path = await _localPath;
//     return File('$path/$kFileName');
//   }

//   void writeJson(String key, dynamic value) async {
//     // Initialize the local _filePath
//     final _filePath = await _localFile;

//     //1. Create _newJson<Map> from input<TextField>
//     Map<String, dynamic> _newJson = {key: value};
//     print('1.(_writeJson) _newJson: $_newJson');

//     //2. Update _json by adding _newJson<Map> -> _json<Map>
//     _json.addAll(_newJson);
//     print('2.(_writeJson) _json(updated): $_json');

//     //3. Convert _json ->_jsonString
//     _jsonString = jsonEncode(_json);
//     print('3.(_writeJson) _jsonString: $_jsonString\n - \n');

//     //4. Write _jsonString to the _filePath
//     _filePath.writeAsString(_jsonString);
//   }

//   Future readJson() async {
//     // Initialize _filePath
//     _filePath = await _localFile;

//     // 0. Check whether the _file exists
//     _fileExists = await _filePath.exists();
//     print('0. File exists? $_fileExists');

//     // If the _file exists->read it: update initialized _json by what's in the _file
//     if (_fileExists) {
//       try {
//         //1. Read _jsonString<String> from the _file.
//         _jsonString = await _filePath.readAsString();
//         print('1.(_readJson) _jsonString: $_jsonString');

//         //2. Update initialized _json by converting _jsonString<String>->_json<Map>
//         _json = jsonDecode(_jsonString);
//         print('2.(_readJson) _json: $_json \n - \n');
//         return _jsonString;
//       } catch (e) {
//         // Print exception errors
//         print('Tried reading _file error: $e');
//         // If encountering an error, return null
//       }
//     }
//   }
// }