import 'dart:convert';

import 'package:fisheller_app/models/consumer.dart';
import 'package:fisheller_app/models/order.dart';
import 'package:fisheller_app/models/post.dart';
import 'package:fisheller_app/models/vendor.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MySharedPreferences {
  MySharedPreferences._privateConstructor();

  static final MySharedPreferences instance =
      MySharedPreferences._privateConstructor();
  setBooleanValue(String key, bool value) async {
    SharedPreferences myPrefs = await SharedPreferences.getInstance();
    myPrefs.setBool(key, value);
  }

  Future<bool> getBooleanValue(String key) async {
    SharedPreferences myPrefs = await SharedPreferences.getInstance();
    return myPrefs.getBool(key) ?? false;
  }

  Future<String> getCurrentUser(String key) async {
    SharedPreferences myPrefs = await SharedPreferences.getInstance();
    return myPrefs.getString(key);
  }

  setCurrentUser(String key, String value) async {
    SharedPreferences myPrefs = await SharedPreferences.getInstance();
    myPrefs.setString(key, value);
  }

  setConsumer(String key, Consumer value) async {
    SharedPreferences myPrefs = await SharedPreferences.getInstance();

    List<String> consumers = myPrefs.getStringList("consumers");
    if(consumers == null)
      consumers = List<String>();
    String encoding = json.encode(value.toJson());
    print("SET SET");
    print(consumers);
    print(consumers.contains(value.email));
    if(!consumers.contains(value.email)) {
      consumers.add(value.email);
      myPrefs.setStringList("consumers", consumers);
    }

    myPrefs.setString(key, encoding);
  }

  initializeEverything() async {
    SharedPreferences myPrefs = await SharedPreferences.getInstance();
    myPrefs.setStringList("consumers", new List<String>());
    myPrefs.setStringList("vendors", new List<String>());
    myPrefs.setStringList("posts", new List<String>());
  }

  getConsumers() async {
    SharedPreferences myPrefs = await SharedPreferences.getInstance();
    return myPrefs.getStringList("consumers");
  }

  getUser(String key) async {
    SharedPreferences myPrefs = await SharedPreferences.getInstance();
    return json.decode(myPrefs.getString(key));
  }

  setVendor(String key, Vendor value) async {
    SharedPreferences myPrefs = await SharedPreferences.getInstance();

    List<String> vendors = myPrefs.getStringList("vendors");
    if(vendors == null)
      vendors = List<String>();
    String encoding = json.encode(value.toJson());
    if(!vendors.contains(value.email)) {
      vendors.add(value.email);
      myPrefs.setStringList("vendors", vendors);
    }

    myPrefs.setString(key, encoding);
  }

  setPost(Post value) async {
    SharedPreferences myPrefs = await SharedPreferences.getInstance();
    List<String> posts = myPrefs.getStringList("posts");
    if(posts == null)
      posts = List<String>();
    posts.add(json.encode(value.toJson()));
    myPrefs.setStringList("posts", posts);
  }

  getPosts() async {
    SharedPreferences myPrefs = await SharedPreferences.getInstance();
    List<String> postsS = myPrefs.getStringList("posts");
    List<Post> posts = List.from(postsS.map((e) => Post.fromJson(json.decode(myPrefs.getString(e)))));
    return posts;
  }

}

getPosts(){
  return MySharedPreferences.instance.getPosts().then((value) {
    return value;
  });
}

getCurrentUserObject() {
  return MySharedPreferences.instance.getCurrentUser("currentUser").then((email) {
    return MySharedPreferences.instance.getUser(email).then((value) {
      return Consumer.fromJson(value);
    });
  });
}

setCurrentUserObject(Order o) {
  MySharedPreferences.instance.getCurrentUser("currentUser").then((email) {
    MySharedPreferences.instance.getUser(email).then((consumer) {
      Consumer c = Consumer.fromJson(consumer);
      c.bookings.add(o);
      MySharedPreferences.instance.setConsumer(email,c);
    });
  });
}

removeBookingFromCurrentUser(Order o) {
  MySharedPreferences.instance.getCurrentUser("currentUser").then((email) {
    MySharedPreferences.instance.getUser(email).then((consumer) {
      Consumer c = Consumer.fromJson(consumer);
      if(c.bookings.isNotEmpty)
        c.bookings.removeLast();
      MySharedPreferences.instance.setConsumer(email,c);
    });
  });
}

paySeafoodFromCurrentUser(Order o) {
  MySharedPreferences.instance.getCurrentUser("currentUser").then((email) {
    MySharedPreferences.instance.getUser(email).then((consumer) {
      Consumer c = Consumer.fromJson(consumer);
      if(c.bookings.isNotEmpty)
        c.bookings.removeLast();
      c.purchases.add(o);
      MySharedPreferences.instance.setConsumer(email,c);
    });
  });
}

isConsumer(){
  return MySharedPreferences.instance.getCurrentUser("currentUser").then((email) {
    List<String> consumers = MySharedPreferences.instance.getConsumers();
    return consumers.contains(email);
  });
}

