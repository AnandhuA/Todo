import 'dart:convert';

import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:todo_app/model/data_model.dart';

List<DataModel> dataModelList = [];

addData({
  required String title,
  required String date,
}) async {
  final directory = await getTemporaryDirectory();
  final file = File('${directory.path}/my_file.json');

  file.writeAsStringSync(
    jsonEncode(
      {
        "event": title,
        "date": date,
      },
    ),
  );
  final addfile = File('${directory.path}/my_file.json');
  print(addfile);
  readData();
}

readData() async {
  final directory = await getTemporaryDirectory();
  final file = File('${directory.path}/my_file.json');
  if (file.existsSync()) {
    final jsonString = file.readAsStringSync();
    final jsonData = jsonDecode(jsonString);
    print(jsonData);
    return jsonData;
  } else {
    print('File not found.');
  }
}
