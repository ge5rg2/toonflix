class WebtoonModel {
  final String title, thumb, id;

  WebtoonModel.fromJson(Map<String, dynamic> json)
      : thumb = json['thumb'],
        title = json['title'],
        id = json['id'];
}
