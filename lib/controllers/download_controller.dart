// import 'package:get/get.dart';
//
// class DownloadController extends GetxController {
//   double _progress = 0;
//   get downloadProgress => _progress;
//
//   void startDownloading() async {
//     _progress = null;
//     notifyListeners();
//
//     final url =
//         'https://file-examples.com/wp-content/uploads/2017/11/file_example_MP3_5MG.mp3';
//     final request = Request('GET', Uri.parse(url));
//     final StreamedResponse response = await Client().send(request);
//
//     final contentLength = response.contentLength;
//
//     _progress = 0;
//     notifyListeners();
//
//     List<int> bytes = [];
//
//     final file = await _getFile('song.mp3');
//     response.stream.listen(
//       (List<int> newBytes) {
//         bytes.addAll(newBytes);
//         final downloadedLength = bytes.length;
//         _progress = downloadedLength / contentLength;
//         notifyListeners();
//       },
//       onDone: () async {
//         _progress = 0;
//         notifyListeners();
//         await file.writeAsBytes(bytes);
//       },
//       onError: (e) {
//         print(e);
//       },
//       cancelOnError: true,
//     );
//   }
//
//   Future<File> _getFile(String filename) async {
//     final dir = await getApplicationDocumentsDirectory();
//     return File("${dir.path}/$filename");
//   }
// }
