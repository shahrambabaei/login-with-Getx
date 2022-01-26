class Task {
  late bool completed;
  late String sId;
  late String description;
  late String owner;
  late String createdAt;
  late String updatedAt;
  late int iV;

  Task(
      {required this.completed,
      required this.sId,
      required this.description,
      required this.owner,
      required this.createdAt,
      required this.updatedAt,
      required this.iV});

  Task.fromJson(Map<String, dynamic> json) {
    completed = json['completed'];
    sId = json['_id'];
    description = json['description'];
    owner = json['owner'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['completed'] = completed;
    data['_id'] = sId;
    data['description'] = description;
    data['owner'] = owner;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    return data;
  }
}
