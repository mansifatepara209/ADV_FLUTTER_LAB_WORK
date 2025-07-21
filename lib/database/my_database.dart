import 'package:adv_flutter_labs/import_export.dart';

class MyDatabase {
  Future<Database> initDatabase() async =>
      await openDatabase(
        '${getDatabasesPath()}+/$DB_NAME',
        version: 1,
        onCreate: (db, version) async {
          await db.execute(
            'CREATE TABLE $TBL_STUDENT ('
                '$COL_STU_ID INTEGER PRIMARY KEY AUTOINCREMENT,'
                '$COL_STU_NAME TEXT,'
                '$COL_ENROLLMENT_NO TEXT,'
                '$COL_EMAIL TEXT,'
                '$COL_PHONENUMBER TEXT,'
                '$COL_BRANCH TEXT,'
                '$COL_CGPA INTEGER,'
                '$COL_12TH_GRADE TEXT'
                ')',
          );
        },
      );
}
  //here if database(openDatabase) is found on this location then given database otherwise create this database.
  //if version 1 hoi to onCreate method call thashe ane pchi version vadhshe to pchi onUpgrade call thashe ane jo version mathi pachal jaie to onDownGrade use thashe.
  //pehli var database create thai 6 etle version 1 aapvanu otherwise je vharyu hoi e