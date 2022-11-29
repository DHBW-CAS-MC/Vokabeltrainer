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

  Future<void> deleteWord(index) async {
    await init();
    var jsonMap;
    if (fileContent.length == 1 &&
        fileContent[0]['question'] != 'Bitte neue Vokabel hinzufügen') {
      fileContent.removeAt(index);
      jsonMap = json.encode(defaultFileContent);
    } else if (fileContent.length == 1 &&
        fileContent[0]['question'] == 'Bitte neue Vokabel hinzufügen') {
      jsonMap = json.encode(fileContent);
    } else if (fileContent.length >= 1 &&
        fileContent[0]['question'] == 'Bitte neue Vokabel hinzufügen') {
      fileContent.removeAt(0);
      jsonMap = json.encode(fileContent);
    } else if (fileContent.length >= 1 &&
        fileContent[0]['question'] != 'Bitte neue Vokabel hinzufügen') {
      fileContent.removeAt(index);
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
    if (fileContent[0]['question'] == 'Bitte neue Vokabel hinzufügen') {
      await deleteWord(0);
    }
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

  Future<void> deleteWord(index) async {
    await init();
    var jsonMap;
    if (fileContent.length == 1 &&
        fileContent[0]['question'] != 'Bitte neue Vokabel hinzufügen') {
      fileContent.removeAt(index);
      jsonMap = json.encode(defaultFileContent);
    } else if (fileContent.length == 1 &&
        fileContent[0]['question'] == 'Bitte neue Vokabel hinzufügen') {
      jsonMap = json.encode(fileContent);
    } else if (fileContent.length >= 1 &&
        fileContent[0]['question'] == 'Bitte neue Vokabel hinzufügen') {
      fileContent.removeAt(0);
      jsonMap = json.encode(fileContent);
    } else if (fileContent.length >= 1 &&
        fileContent[0]['question'] != 'Bitte neue Vokabel hinzufügen') {
      fileContent.removeAt(index);
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
    if (fileContent[0]['question'] == 'Bitte neue Vokabel hinzufügen') {
      await deleteWord(0);
    }
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

  Future<void> deleteWord(index) async {
    await init();
    var jsonMap;
    if (fileContent.length == 1 &&
        fileContent[0]['question'] != 'Bitte neue Vokabel hinzufügen') {
      fileContent.removeAt(index);
      jsonMap = json.encode(defaultFileContent);
    } else if (fileContent.length == 1 &&
        fileContent[0]['question'] == 'Bitte neue Vokabel hinzufügen') {
      jsonMap = json.encode(fileContent);
    } else if (fileContent.length >= 1 &&
        fileContent[0]['question'] == 'Bitte neue Vokabel hinzufügen') {
      fileContent.removeAt(0);
      jsonMap = json.encode(fileContent);
    } else if (fileContent.length >= 1 &&
        fileContent[0]['question'] != 'Bitte neue Vokabel hinzufügen') {
      fileContent.removeAt(index);
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
    if (fileContent[0]['question'] == 'Bitte neue Vokabel hinzufügen') {
      await deleteWord(0);
    }
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

  Future<void> deleteWord(index) async {
    await init();
    var jsonMap;
    if (fileContent.length == 1 &&
        fileContent[0]['question'] != 'Bitte neue Vokabel hinzufügen') {
      fileContent.removeAt(index);
      jsonMap = json.encode(defaultFileContent);
    } else if (fileContent.length == 1 &&
        fileContent[0]['question'] == 'Bitte neue Vokabel hinzufügen') {
      jsonMap = json.encode(fileContent);
    } else if (fileContent.length >= 1 &&
        fileContent[0]['question'] == 'Bitte neue Vokabel hinzufügen') {
      fileContent.removeAt(0);
      jsonMap = json.encode(fileContent);
    } else if (fileContent.length >= 1 &&
        fileContent[0]['question'] != 'Bitte neue Vokabel hinzufügen') {
      fileContent.removeAt(index);
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
    if (fileContent[0]['question'] == 'Bitte neue Vokabel hinzufügen') {
      await deleteWord(0);
    }
  }
}
