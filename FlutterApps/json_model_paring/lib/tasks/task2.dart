// [
//   {"id": 1, "type": "text", "content": "Hello, how are you?"},
//   {"id": 2, "type": "image", "url": "https://example.com/image.jpg"},
//   {"id": 3, "type": "video", "url": "https://example.com/video.mp4", "duration": 120}
// ]


import 'dart:convert';

abstract class Message{
  final int id;
  final String type;
  Message({required this.id , required this.type});

  factory Message.fromJson(Map<String,dynamic> json){
    switch(json['type'])
    {
      case 'text' : return TextMessage.fromJson(json);

      case 'image': return ImageMessage.fromJson(json);

      case 'video' : return VideoMessage.fromJson(json);

      default : throw Exception('Unknow Type');
    }
  }

  Map<String , dynamic> toJson();
}

class TextMessage extends Message{
  String content;
  
  TextMessage({required int id , required this.content}):super(id: id, type: 'text');

  factory TextMessage.fromJson(Map<String,dynamic> json)
  {
    return TextMessage(
      id: json['id'],
      content: json['content']);
  }

  @override
  Map<String,dynamic> toJson() => {'id' : id, 'type' : type, 'content' : content};
}

class ImageMessage extends Message{
  String url;
  ImageMessage({required int id , required this.url}):super(id: id,type: 'image');
  
  factory ImageMessage.fromJson(Map<String,dynamic> json){
    return ImageMessage(id: json['id'], url: json['url']);
  }
  @override
  Map<String,dynamic> toJson() => {'id' : id, 'type' : type , 'url' : url};
}

class VideoMessage extends Message{
  String url;
  int duration;
  VideoMessage({required int id , required this.url , required this.duration}):super(id: id,type: 'video');

  factory VideoMessage.fromJson(Map<String ,dynamic> json)
  {
    return VideoMessage(id: json['id'], url: json['url'], duration: json['duration']);
  }

  @override
  Map<String,dynamic> toJson() => {'id' : id , 'type' : type , 'url' : url , 'duration' : duration };
}

void main(){
  String jsonString = '''
[
  {"id": 1, "type": "text", "content": "Hello, how are you?"},
  {"id": 2, "type": "image", "url": "https://example.com/image.jpg"},
  {"id": 3, "type": "video", "url": "https://example.com/video.mp4", "duration": 120}
]
''';

List<dynamic> jsonData = jsonDecode(jsonString);

List<Message> messages = jsonData.map((e) => Message.fromJson(e)).toList();

for( var message in messages)
{
  if( message is TextMessage )
  {
    print('Text : ${message.content}');
  }

  else if( message is ImageMessage )
  {
    print('ImageUrl : ${message.url}');
  }

  else if( message is VideoMessage )
  {
    print('VideoUrl : ${message.url} , duration : ${message.duration}');
  }
}
}