class MyComment {
  final String title, thumbnailUrl, url;
  final int id;
  bool _posted = false;

  MyComment({required this.url, required this.id, required this.title, required this.thumbnailUrl});

  bool get isposted => _posted;
  set toggle(String anyletter){
    _posted = true;
  }

  factory MyComment.fromJson(Map json)=> MyComment(
    id: json["id"], 
    url: json["url"],
    title: json["title"], 
    thumbnailUrl: json["thumbnailUrl"]
    );

  Map<String, dynamic> tojson() => {
    "title" : title,
    "thumbnail" : 'https://www.google.com/s2/favicons?sz=64&domain_url=yahoo.com',
    "url" : 'https://yahoo.com'
  };
}
