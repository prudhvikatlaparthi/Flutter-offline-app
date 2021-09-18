import 'package:floor/floor.dart';

final qList = [
  '''ALTER TABLE Customer ADD COLUMN email TEXT'''
];

final migration2to3 = Migration(2, 3, (database) async {
  await Future.forEach(qList, (String item) async {
    await database.execute(item);
  });
});
