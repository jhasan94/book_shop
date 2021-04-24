import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:book_shop/api.dart';
import 'package:book_shop/models/article_model.dart';
import 'package:book_shop/models/audio_model.dart';
import 'package:book_shop/models/e_book_model.dart';
import 'package:book_shop/models/event_model.dart';
import 'package:book_shop/models/home_page_model.dart';
import 'package:book_shop/models/sizas_center_model.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';

class Controller extends GetxController {
  //List of model class........
  final articleList = [].obs;
  final eventList = [].obs;
  final eBookList = [].obs;
  final homePageList = [].obs;
  final audioList = [].obs;
  final memberList = [].obs;
  var isLoading = true.obs;
  Box box;

  var article;
  var homePage;
  var eBook;
  var audio;
  var event;
  var members;

  //login reg btn ..............
  var btnNameLogin = "Login".obs;
  var btnNameSignUp = "Register now".obs;

  loadDataFromDB(String key) async {
    switch (key) {
      case "article":
        {
          var jsonMap = json.decode(await box.get(key));
          article = Article.fromJson(jsonMap);
          articleList.clear();
          articleList.assign(article);
        }
        break;
      case "event":
        {
          var jsonMap = json.decode(await box.get(key));
          event = Event.fromJson(jsonMap);
          eventList.clear();
          eventList.assign(event);
        }
        break;
      case "eBook":
        {
          var jsonMap = json.decode(await box.get(key));
          eBook = EBook.fromJson(jsonMap);
          eBookList.clear();
          eBookList.assign(eBook);
        }
        break;
      case "homePage":
        {
          var jsonMap = json.decode(await box.get(key));
          homePage = HomePage.fromJson(jsonMap);
          homePageList.clear();
          homePageList.assign(homePage);
        }
        break;
      case "audio":
        {
          var jsonMap = json.decode(await box.get(key));
          audio = Audio.fromJson(jsonMap);
          audioList.clear();
          audioList.assign(audio);
        }
        break;
      default:
        {
          print("somthing is error in sahred preference");
        }
        break;
    }
  }

  @override
  Future<void> onInit() async {
    await Hive.initFlutter();
    box = await Hive.openBox("jsonDataBox");
    fetchHomepage();
    fetchEBook();
    fetchAudio();
    //fetchMemberList();
    fetchEvent();
    fetchArticle();
    fetchArticle();
    super.onInit();
  }

  Future fetchArticle() async {
    isLoading(true);
    var client = http.Client();
    String url = Api.article_url;

    try {
      var response = await client.get(url);
      if (response.statusCode == 200) {
        var jsonString = response.body;
        //var a = isUpdate();
        //var b;
        //  || b == a needed this conditions for checking the update list

        if (!box.containsKey('article')) {
          await box.put("article", jsonString);
        }
      }
      await loadDataFromDB('article');
    } on SocketException catch (e) {
      loadDataFromDB('article');
      print(e);
    } on Error catch (e) {
      loadDataFromDB('article');
      print(e);
    } finally {
      isLoading(false);
    }
  }

  Future fetchHomepage() async {
    isLoading(true);
    var client = http.Client();
    String url = Api.home_url;

    try {
      var response = await client.get(url);
      if (response.statusCode == 200) {
        var jsonString = response.body;
        if (!box.containsKey('homePage')) {
          await box.put('homePage', jsonString);
        }
      }
      await loadDataFromDB('homePage');
    } on SocketException catch (e) {
      loadDataFromDB('homePage');
      print(e);
    } on Error catch (e) {
      loadDataFromDB('homePage');
      print(e);
    } finally {
      isLoading(false);
    }
  }

  Future fetchEBook() async {
    isLoading(true);
    var client = http.Client();
    String url = Api.ebook_url;

    try {
      var response = await client.get(url);
      if (response.statusCode == 200) {
        var jsonString = response.body;
        if (!box.containsKey('eBook')) {
          await box.put("eBook", jsonString);
        }
      }
      await loadDataFromDB('eBook');
    } on SocketException catch (e) {
      loadDataFromDB('eBook');
      print(e);
    } on Error catch (e) {
      loadDataFromDB('eBook');
      print(e);
    } finally {
      isLoading(false);
    }
  }

  Future fetchAudio() async {
    isLoading(true);
    var client = http.Client();
    String url = Api.Audio_url;

    try {
      var response = await client.get(url);
      if (response.statusCode == 200) {
        var jsonString = response.body;
        if (!box.containsKey('audio')) {
          await box.put("audio", jsonString);
        }
      }
      await loadDataFromDB('audio');
    } on SocketException catch (e) {
      loadDataFromDB('audio');
      print(e);
    } on Error catch (e) {
      loadDataFromDB('audio');
      print(e);
    } finally {
      isLoading(false);
    }
  }

  Future fetchEvent() async {
    isLoading(true);
    var client = http.Client();
    String url = Api.event_url;

    try {
      var response = await client.get(url);
      if (response.statusCode == 200) {
        var jsonString = response.body;
        if (!box.containsKey('event')) {
          await box.put("event", jsonString);
        }
      }
      await loadDataFromDB('event');
    } on SocketException catch (e) {
      loadDataFromDB('event');
      print(e);
    } on Error catch (e) {
      loadDataFromDB('event');
      print(e);
    } finally {
      isLoading(false);
    }
  }
}
