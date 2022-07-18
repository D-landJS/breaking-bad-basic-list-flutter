class Character {
  int? id;
  String? name;
  String? img;
  String? nickname;

  Character.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    img = json['img'];
    nickname = json['nickname'];
  }
}
