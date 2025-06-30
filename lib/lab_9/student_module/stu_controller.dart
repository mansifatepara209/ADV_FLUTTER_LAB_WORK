import 'package:adv_flutter_labs/database/my_database.dart';
import 'package:adv_flutter_labs/import_export.dart';

class StuController extends GetxController {
  RxList<StuModel> stuList = <StuModel>[].obs;
  late Database db;
  GlobalKey<FormState> formKey = GlobalKey();
  var nameController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    MyDatabase().initDatabase().then((value) {
      db = value;
      getStuList();
    });
  }

  Future<void> getStuList() async {
    List<Map<String, Object?>> students = await db.rawQuery(
      'SELECT * FROM $TBL_STUDENT',
    );
    for (var element in students) {
      stuList.add(StuModel().fromMap(element));
    }
  }

  String? getValidationMessage(value){
    if(value == null){
      return MSG_VALID_VALUE;
    }
    return null;
  }

  Future<void> addStuToTblStudent({name}) async {
    await db.insert(TBL_STUDENT, StuModel(stuName: name).toMap());
    await getStuList();
  }
}