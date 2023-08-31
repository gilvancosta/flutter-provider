// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class ProviderController extends ChangeNotifier {
  String name = 'Zoe Saldana';
  String email = 'user2023@gmail.com';
  String imgAvatar = 'https://yt3.googleusercontent.com/rY0nqXPcrDPkbmxVZk0ZjoZRCWIZjBY7Q2XsBzvr6Ca9WvCa4Z28yupewm-rHqiu3w6GVficDQ=s900-c-k-c0x00ffffff-no-rj';
  String birthday = '01/01/2023';

  void alterarDados() {
    name = 'Maria Madalena';
    email = 'maria2023@gmail';
    imgAvatar = 'https://i.pravatar.cc/200';
    birthday = '01/01/2080';
    notifyListeners();
  }

  void changeAvatar(String url) {
    imgAvatar = url;
    notifyListeners();
  }

  void changeName(String nome) {
    name = nome;
    notifyListeners();
  }
}
