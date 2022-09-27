class StudentModel {
  int? id;
  String? rollno;
  String? name;
  String? password;

  StudentModel(this.rollno, this.name, this.password, this.id);

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "rollno": rollno,
      "name": name,
      "password": password,
    };
  }

  StudentModel.fromJSon(Map<String, dynamic> mp) {
    id = mp["id"];
    rollno = mp["rollno"];
    name = mp["name"];
    password = mp["mp"];
  }
}
