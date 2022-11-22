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

class WriteDb {
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

  List getTestDb() {
    var filePath = "/" + fileName;
    var input = File(Directory.current.path + filePath).readAsStringSync();
    var map = jsonDecode(input);
    var test = map['test']['de-en'];
    return test;
  }
}
