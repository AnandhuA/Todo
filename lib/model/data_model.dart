class DataModel {
  String? title;
  String? date;

  DataModel({required this.title, required this.date});

  DataModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    date = json['data'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['name'] = title;
    data['age'] = date;

    return data;
  }
}
