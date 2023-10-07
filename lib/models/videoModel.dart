class VideoModel {
  var id;
  var title;
  var thumbnail;
  var duration;
  var uploadTime;
  var views;
  var author;
  var videoUrl;
  var description;
  var subscriber;

  VideoModel(
      this.id,
      this.title,
      this.thumbnail,
      this.duration,
      this.uploadTime,
      this.views,
      this.author,
      this.videoUrl,
      this.description,
      this.subscriber);

  VideoModel.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
    title = json['title'].toString();
    thumbnail = json['thumbnailUrl'].toString();
    duration = json['duration'].toString();
    uploadTime = json['uploadTime'].toString();
    views = json['views'].toString();
    author = json['author'].toString();
    videoUrl = json['videoUrl'].toString();
    description = json['description'].toString();
    subscriber = json['subscriber'].toString();
  }
}
