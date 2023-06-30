class SourceModel{
  String? id, name;

  SourceModel({this.id = '', required this.name});

  Map<String, dynamic> toJson(){
    return {
      'id': id,
      'name': name,
    };
  }

  factory SourceModel.fromJson(Map<String, dynamic> json){
    return SourceModel(
      id: json['id'],
      name: json['name']);
  }
}