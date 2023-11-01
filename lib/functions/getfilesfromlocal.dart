import 'dart:convert';

import 'package:flutter_storage_path/flutter_storage_path.dart';

List files = [];
class GetLocalVideos {
  static List<String> folders = [];
  static List files = [];
  static void getVideos() async {
    final video = await StoragePath.videoPath;
    final jsonofPaths = await jsonDecode(video!);
    files = jsonofPaths;
    folders = jsonofPaths[''];
  }
}
