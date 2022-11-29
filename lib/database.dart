// @dart=2.9

import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:convert';
import 'package:path_provider/path_provider.dart';

class DbEnglish {
  File jsonFile;
  Directory dir;
  String fileName = "db_en.json";
  bool fileExist = false;
  List fileContent;
  List<Map> defaultFileContent = [
    {
      'question': 'Bitte neue Vokabel hinzufügen',
      'answer': 'Please add new vocabulary'
    }
  ];

  // kay.becher@dhbw-mannheim.de

  Future<void> init() async {
    await getApplicationDocumentsDirectory().then((Directory directory) {
      dir = directory;
      jsonFile = new File(dir.path + "/" + fileName);
      fileExist = jsonFile.existsSync();
      if (fileExist) {
        fileContent = json.decode(jsonFile.readAsStringSync());
      } else {
        var defaultjsonMap = json.encode(defaultFileContent);
        new File(dir.path + "/" + fileName).writeAsStringSync(defaultjsonMap);
        jsonFile = new File(dir.path + "/" + fileName);
        fileExist = jsonFile.existsSync();
        if (fileExist) {
          fileContent = json.decode(jsonFile.readAsStringSync()) as List;
        }
      }
    });
  }

  Future<List> getDb() async {
    await init();
    return fileContent;
  }

  void deleteWord(index) async {
    await init();
    var jsonMap;
    if (fileContent.length == 1 &&
        fileContent[0]['question'] != 'Bitte neue Vokabel hinzufügen') {
      fileContent.removeAt(index);
      jsonMap = json.encode(defaultFileContent);
    } else if (fileContent.length == 1 &&
        fileContent[0]['question'] == 'Bitte neue Vokabel hinzufügen') {
      //do nothing
    } else if (fileContent.length >= 1 &&
        fileContent[0]['question'] == 'Bitte neue Vokabel hinzufügen') {
      fileContent.removeAt(0);
      jsonMap = json.encode(fileContent);
    } else {
      fileContent.removeAt(index);
      jsonMap = json.encode(fileContent);
    }

    File(dir.path + "/" + fileName).writeAsStringSync(jsonMap);
  }

  void writeWord(key, value) async {
    await init();
    Map newMap = {'question': key, 'answer': value};
    fileContent.add(newMap);
    var jsonMap = json.encode(fileContent);
    File(dir.path + "/" + fileName).writeAsStringSync(jsonMap);
    await deleteWord(0);
  }
}

class DbSpanish {
  File jsonFile;
  Directory dir;
  String fileName = "db_es.json";
  bool fileExist = false;
  List fileContent;
  List<Map> defaultFileContent = [
    {
      'question': 'Bitte neue Vokabel hinzufügen',
      'answer': 'Por favor agregue nuevo vocabulario'
    }
  ];

  // kay.becher@dhbw-mannheim.de

  Future<void> init() async {
    await getApplicationDocumentsDirectory().then((Directory directory) {
      dir = directory;
      jsonFile = new File(dir.path + "/" + fileName);
      fileExist = jsonFile.existsSync();
      if (fileExist) {
        fileContent = json.decode(jsonFile.readAsStringSync());
      } else {
        var defaultjsonMap = json.encode(defaultFileContent);
        new File(dir.path + "/" + fileName).writeAsStringSync(defaultjsonMap);
        jsonFile = new File(dir.path + "/" + fileName);
        fileExist = jsonFile.existsSync();
        if (fileExist) {
          fileContent = json.decode(jsonFile.readAsStringSync()) as List;
        }
      }
    });
  }

  Future<List> getDb() async {
    await init();
    return fileContent;
  }

  void deleteWord(index) async {
    await init();
    var jsonMap;
    if (fileContent.length == 1 &&
        fileContent[0]['question'] != 'Bitte neue Vokabel hinzufügen') {
      fileContent.removeAt(index);
      jsonMap = json.encode(defaultFileContent);
    } else if (fileContent.length == 1 &&
        fileContent[0]['question'] == 'Bitte neue Vokabel hinzufügen') {
      //do nothing
    } else if (fileContent.length >= 1 &&
        fileContent[0]['question'] == 'Bitte neue Vokabel hinzufügen') {
      fileContent.removeAt(0);
      jsonMap = json.encode(fileContent);
    } else {
      fileContent.removeAt(index);
      jsonMap = json.encode(fileContent);
    }

    File(dir.path + "/" + fileName).writeAsStringSync(jsonMap);
  }

  void writeWord(key, value) async {
    await init();
    Map newMap = {'question': key, 'answer': value};
    fileContent.add(newMap);
    var jsonMap = json.encode(fileContent);
    File(dir.path + "/" + fileName).writeAsStringSync(jsonMap);
    await deleteWord(0);
  }
}

class DbFrench {
  File jsonFile;
  Directory dir;
  String fileName = "db_fr.json";
  bool fileExist = false;
  List fileContent;
  List<Map> defaultFileContent = [
    {
      'question': 'Bitte neue Vokabel hinzufügen',
      'answer': 'Veuillez ajouter un nouveau vocabulaire'
    }
  ];

  // kay.becher@dhbw-mannheim.de

  Future<void> init() async {
    await getApplicationDocumentsDirectory().then((Directory directory) {
      dir = directory;
      jsonFile = new File(dir.path + "/" + fileName);
      fileExist = jsonFile.existsSync();
      if (fileExist) {
        fileContent = json.decode(jsonFile.readAsStringSync());
      } else {
        var defaultjsonMap = json.encode(defaultFileContent);
        new File(dir.path + "/" + fileName).writeAsStringSync(defaultjsonMap);
        jsonFile = new File(dir.path + "/" + fileName);
        fileExist = jsonFile.existsSync();
        if (fileExist) {
          fileContent = json.decode(jsonFile.readAsStringSync()) as List;
        }
      }
    });
  }

  Future<List> getDb() async {
    await init();
    return fileContent;
  }

  void deleteWord(index) async {
    await init();
    var jsonMap;
    if (fileContent.length == 1 &&
        fileContent[0]['question'] != 'Bitte neue Vokabel hinzufügen') {
      fileContent.removeAt(index);
      jsonMap = json.encode(defaultFileContent);
    } else if (fileContent.length == 1 &&
        fileContent[0]['question'] == 'Bitte neue Vokabel hinzufügen') {
      //do nothing
    } else if (fileContent.length >= 1 &&
        fileContent[0]['question'] == 'Bitte neue Vokabel hinzufügen') {
      fileContent.removeAt(0);
      jsonMap = json.encode(fileContent);
    } else {
      fileContent.removeAt(index);
      jsonMap = json.encode(fileContent);
    }

    File(dir.path + "/" + fileName).writeAsStringSync(jsonMap);
  }

  void writeWord(key, value) async {
    await init();
    Map newMap = {'question': key, 'answer': value};
    fileContent.add(newMap);
    var jsonMap = json.encode(fileContent);
    File(dir.path + "/" + fileName).writeAsStringSync(jsonMap);
    await deleteWord(0);
  }
}

class DbItalian {
  File jsonFile;
  Directory dir;
  String fileName = "db_it.json";
  bool fileExist = false;
  List fileContent;
  List<Map> defaultFileContent = [
    {
      'question': 'Bitte neue Vokabel hinzufügen',
      'answer': 'Si prega di aggiungere un nuovo vocabolario'
    }
  ];

  // kay.becher@dhbw-mannheim.de

  Future<void> init() async {
    await getApplicationDocumentsDirectory().then((Directory directory) {
      dir = directory;
      jsonFile = new File(dir.path + "/" + fileName);
      fileExist = jsonFile.existsSync();
      if (fileExist) {
        fileContent = json.decode(jsonFile.readAsStringSync());
      } else {
        var defaultjsonMap = json.encode(defaultFileContent);
        new File(dir.path + "/" + fileName).writeAsStringSync(defaultjsonMap);
        jsonFile = new File(dir.path + "/" + fileName);
        fileExist = jsonFile.existsSync();
        if (fileExist) {
          fileContent = json.decode(jsonFile.readAsStringSync()) as List;
        }
      }
    });
  }

  Future<List> getDb() async {
    await init();
    return fileContent;
  }

  void deleteWord(index) async {
    await init();
    var jsonMap;
    if (fileContent.length == 1 &&
        fileContent[0]['question'] != 'Bitte neue Vokabel hinzufügen') {
      fileContent.removeAt(index);
      jsonMap = json.encode(defaultFileContent);
    } else if (fileContent.length == 1 &&
        fileContent[0]['question'] == 'Bitte neue Vokabel hinzufügen') {
      //do nothing
    } else if (fileContent.length >= 1 &&
        fileContent[0]['question'] == 'Bitte neue Vokabel hinzufügen') {
      fileContent.removeAt(0);
      jsonMap = json.encode(fileContent);
    } else {
      fileContent.removeAt(index);
      jsonMap = json.encode(fileContent);
    }

    File(dir.path + "/" + fileName).writeAsStringSync(jsonMap);
  }

  void writeWord(key, value) async {
    await init();
    Map newMap = {'question': key, 'answer': value};
    fileContent.add(newMap);
    var jsonMap = json.encode(fileContent);
    File(dir.path + "/" + fileName).writeAsStringSync(jsonMap);
    await deleteWord(0);
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
