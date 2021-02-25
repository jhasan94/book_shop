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
import 'package:book_shop/services/shared_preference.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Controller extends GetxController {
  //List of model class........
  final articleList = [].obs;
  final eventList = [].obs;
  final eBookList = [].obs;
  final homePageList = [].obs;
  final audioList = [].obs;
  final memberList = [].obs;
  var isLoading = true.obs;

  //login reg btn ..............
  var btnNameLogin = "Login".obs;
  var btnNameSignUp = "Register now".obs;

  //shared preference.......
  SharedPref sharedPref = SharedPref();

  Future loadSharedPrefs(String key) async {
    switch (key) {
      case "article":
        {
          try {
            var article = Article.fromJson(await sharedPref.read(key));
            print("data found");
            articleList.assign(article);
            sharedPref.setString("articleUpdateTime",
                articleList.first.data[0].updatedAt.toString());
            print(article.total.toString());
          } catch (Exception) {
            print("data not found");
          }
        }
        break;
      case "event":
        {
          try {
            var event = Event.fromJson(await sharedPref.read(key));
            eventList.assign(event);
            sharedPref.setString("eventUpdateTime",
                eventList.first.data[0].updatedAt.toString());
          } catch (Exception) {
            print("data not found");
          }
        }
        break;
      case "eBook":
        {
          try {
            var eBook = EBook.fromJson(await sharedPref.read(key));
            eBookList.assign(eBook);
            sharedPref.setString("eBookUpdateTime",
                eBookList.first.data[0].updatedAt.toString());
          } catch (Exception) {
            print("data not found");
          }
        }
        break;
      case "audio":
        {
          try {
            var audio = Audio.fromJson(await sharedPref.read(key));
            audioList.assign(audio);
            sharedPref.setString("audioUpdateTime",
                audioList.first.data[0].updatedAt.toString());
          } catch (Exception) {
            print("data not found");
          }
        }
        break;
      case "homePage":
        {
          try {
            var homePage = Article.fromJson(await sharedPref.read(key));
            homePageList.assign(homePage);
            sharedPref.setString("homePageUpdateTime",
                homePageList.first.data[0].updatedAt.toString());
          } catch (Exception) {
            print("data not found");
          }
        }
        break;
      default:
        {
          print("somthing is error in sahred preference");
        }
        break;
    }
  }

  // Future loadSharedPrefsArticle() async {
  //   try {
  //     var article = Article.fromJson(await sharedPref.read("article"));
  //     print("data found");
  //     articleList.assign(article);
  //     sharedPref.setString(
  //         "articleUpdateTime", articleList.first.data[0].updatedAt.toString());
  //     print(article.total.toString());
  //   } catch (Exception) {
  //     print("data not found");
  //   }
  // }
  //
  // Future loadSharedPrefsHomePage() async {
  //   try {
  //     var homePage = Article.fromJson(await sharedPref.read("homePage"));
  //     print("data found");
  //     homePageList.assign(homePage);
  //     sharedPref.setString("homePageUpdateTime",
  //         homePageList.first.data[0].updatedAt.toString());
  //   } catch (Exception) {
  //     print("data not found");
  //   }
  // }
  //
  // Future loadSharedPrefsEvent() async {
  //   try {
  //     var event = Event.fromJson(await sharedPref.read("event"));
  //     print("data found");
  //     eventList.assign(event);
  //     sharedPref.setString(
  //         "eventUpdateTime", eventList.first.data[0].updatedAt.toString());
  //   } catch (Exception) {
  //     print("data not found");
  //   }
  // }
  //
  // Future loadSharedPrefsEBook() async {
  //   try {
  //     var eBook = EBook.fromJson(await sharedPref.read("eBook"));
  //     print("data found");
  //     eBookList.assign(eBook);
  //     sharedPref.setString(
  //         "eBookUpdateTime", eBookList.first.data[0].updatedAt.toString());
  //   } catch (Exception) {
  //     print("data not found");
  //   }
  // }
  //
  // Future loadSharedPrefsAudio() async {
  //   try {
  //     var audio = Audio.fromJson(await sharedPref.read("audio"));
  //     print("data found");
  //     audioList.assign(audio);
  //     sharedPref.setString(
  //         "audioUpdateTime", audioList.first.data[0].updatedAt.toString());
  //   } catch (Exception) {
  //     print("data not found");
  //   }
  // }

  @override
  void onInit() {
    fetchHomepage();
    fetchEBook();
    fetchAudio();
    fetchMemberList();
    fetchEvent();
    fetchArticle();
    super.onInit();
  }

  Future fetchArticle() async {
    isLoading(true);
    int timeout = 5;

    var client = http.Client();
    var article;
    String url = Api.article_url;
    final prefs = await SharedPreferences.getInstance();

    try {
      var response = await client.get(url).timeout(Duration(seconds: timeout));
      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);
        //articleList.first.data[0].updatedAt != jsonMap["data"][0]["updated_at"]

        if (!prefs.containsKey("article") ||
            sharedPref.getString("ArticleUpdateTime") ==
                (jsonMap["data"][0]["updated_at"])) {
          article = Article.fromJson(jsonMap);
          print("api call....");
          print(sharedPref.getString("articleUpdateTime"));
          print(jsonMap["data"][0]["updated_at"]);
          await sharedPref.remove("article");
          await sharedPref.save("article", article);
        }
      }
      await loadSharedPrefs("article");
      //await sharedPref.remove("article");
      //await prefs.remove("updateTime");
    } on TimeoutException catch (Exception) {
      await loadSharedPrefs("article");
      print(Exception);
    } on SocketException catch (e) {
      await loadSharedPrefs("article");
      print(e);
    } on Error catch (e) {
      await loadSharedPrefs("article");
      print(e);
    } finally {
      isLoading(false);
    }
  }

  Future fetchHomepage() async {
    isLoading(true);
    int timeout = 5;

    var client = http.Client();
    var homePage;
    String url = Api.home_url;
    final prefs = await SharedPreferences.getInstance();

    try {
      isLoading(true);
      var response = await client.get(url).timeout(Duration(seconds: timeout));
      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);

        if (!prefs.containsKey("homePage") ||
            sharedPref.getString("homePageUpdateTime") ==
                (jsonMap["data"][0]["updated_at"])) {
          homePage = HomePage.fromJson(jsonMap);
          await sharedPref.remove("homePage");
          await sharedPref.save("homePage", homePage);
        }
      }
      await loadSharedPrefs("homePage");
    } on TimeoutException catch (Exception) {
      await loadSharedPrefs("homePage");
      print(Exception);
    } on SocketException catch (e) {
      await loadSharedPrefs("homePage");
      print(e);
    } on Error catch (e) {
      await loadSharedPrefs("homePage");
      print(e);
    } finally {
      isLoading(false);
    }
  }

  Future fetchEBook() async {
    isLoading(true);
    int timeout = 5;

    var client = http.Client();
    var eBook;
    String url = Api.ebook_url;
    final prefs = await SharedPreferences.getInstance();

    try {
      var response = await client.get(url).timeout(Duration(seconds: timeout));
      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);

        if (!prefs.containsKey("eBook") ||
            sharedPref.getString("eBookUpdateTime") ==
                (jsonMap["data"][0]["updated_at"])) {
          eBook = EBook.fromJson(jsonMap);
          await sharedPref.remove("eBook");
          await sharedPref.save("eBook", eBook);
        }
      }
      await loadSharedPrefs("eBook");
    } on TimeoutException catch (Exception) {
      await loadSharedPrefs("eBook");
      print(Exception);
    } on SocketException catch (e) {
      await loadSharedPrefs("eBook");
      print(e);
    } on Error catch (e) {
      await loadSharedPrefs("eBook");
      print(e);
    } finally {
      isLoading(false);
    }
  }

  Future fetchAudio() async {
    isLoading(true);
    int timeout = 5;

    var client = http.Client();
    var audio;
    String url = Api.Audio_url;
    final prefs = await SharedPreferences.getInstance();

    try {
      var response = await client.get(url).timeout(Duration(seconds: timeout));
      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);

        if (!prefs.containsKey("audio") ||
            sharedPref.getString("audioUpdateTime") ==
                (jsonMap["data"][0]["updated_at"])) {
          audio = Audio.fromJson(jsonMap);
          await sharedPref.remove("audio");
          await sharedPref.save("audio", audio);
        }
      }
      await loadSharedPrefs("audio");
    } on TimeoutException catch (Exception) {
      await loadSharedPrefs("audio");
      print(Exception);
    } on SocketException catch (e) {
      await loadSharedPrefs("audio");
      print(e);
    } on Error catch (e) {
      await loadSharedPrefs("audio");
      print(e);
    } finally {
      isLoading(false);
    }
  }

  Future fetchMemberList() async {
    var client = http.Client();
    var members;
    String url = Api.sizas_center_url;
    try {
      isLoading(true);
      var response = await client.get(url);
      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);
        members = SizasCenter.fromJson(jsonMap);
        memberList.assign(members);
      }
    } catch (Exception) {
      print(Exception);
    } finally {
      isLoading(false);
    }
  }

  Future fetchEvent() async {
    isLoading(true);
    int timeout = 5;

    var client = http.Client();
    var event;
    String url = Api.event_url;
    final prefs = await SharedPreferences.getInstance();

    try {
      var response = await client.get(url).timeout(Duration(seconds: timeout));
      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);

        if (!prefs.containsKey("event") ||
            sharedPref.getString("eventUpdateTime") ==
                (jsonMap["data"][0]["updated_at"])) {
          event = Event.fromJson(jsonMap);
          await sharedPref.remove("event");
          await sharedPref.save("event", event);
        }
      }
      await loadSharedPrefs("event");
    } on TimeoutException catch (Exception) {
      await loadSharedPrefs("event");
      print(Exception);
    } on SocketException catch (e) {
      await loadSharedPrefs("event");
      print(e);
    } on Error catch (e) {
      await loadSharedPrefs("event");
      print(e);
    } finally {
      isLoading(false);
    }
  }
}
