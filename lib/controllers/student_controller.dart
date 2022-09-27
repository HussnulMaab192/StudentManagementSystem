import 'package:flite/screens/models/student.dart';
import 'package:flite/screens/provider/sqllite.dart';
import 'package:get/get.dart';

class StudentController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    gettask();
  }

  List list = [];
  var studentsList = <StudentModel>[];
  Future<void> addToTask(StudentModel std) async {
    DbHelper.insertIntoDb(std);
    update();
  }

  gettask() async {
    List<Map<String, dynamic>>? students = await DbHelper.showData();
    studentsList
        .assignAll(students!.map((e) => StudentModel.fromJSon(e)).toList());
    update();
  }

  Future<void> searchForStudent(String name) async {
    list = await DbHelper.searchForStudent(name);
    update();
  }

  Future<void> updateForStudent(String name, String rollno) async {
    await DbHelper.updateStudent(name, rollno);
    update();
  }
}
