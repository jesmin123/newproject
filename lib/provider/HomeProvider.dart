import 'package:flutter/material.dart';
import 'package:newproject/constants/video%20file.dart';
import '../models/videoModel.dart';

class HomeProvider extends ChangeNotifier {
  List<VideoModel> _model = [];

  List<VideoModel> _favorites = [];

  List<VideoModel> get favorites => _favorites;

  set favorites(List<VideoModel> value) {
    _favorites = value;
    notifyListeners();
  }

  List<VideoModel> get model => _model;

  set model(List<VideoModel> value) {
    _model = value;
    notifyListeners();
  }

  void OnInit() {
    model = [];
    video.forEach((element) {
      var vid = VideoModel.fromJson(element);
      model.add(vid);
    });
  }
}
