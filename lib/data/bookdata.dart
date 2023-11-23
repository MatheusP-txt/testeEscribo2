import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class BookData {
  String id;
  String bookCover;
  String bookTitle;
  String author;
  String downloadUrl;
  bool isFavorite;

  BookData({
    required this.id,
    required this.bookCover,
    required this.bookTitle,
    required this.author,
    required this.downloadUrl,
    this.isFavorite = false,
  });

  factory BookData.fromJson(Map<String, dynamic> json) {
    return BookData(
      id: json["id"].toString(),
      bookCover: json["cover_url"],
      bookTitle: json["title"],
      author: json["author"],
      downloadUrl: json["download_url"],
    );
  }

  Future<File> downloadBook() async {
    var response = await http.get(Uri.parse(downloadUrl));

    Directory? dir = await getExternalStorageDirectory();

    String path = '${dir!.path}/$id.epub';

    File file = File(path);

    await file.writeAsBytes(response.bodyBytes);

    return file;
  }
}
