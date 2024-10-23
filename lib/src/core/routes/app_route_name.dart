import "package:flutter/material.dart";

@immutable
final class AppRouteName {
  static const String splash = "/splashPage";
  static const String welcomePage = "/welcome";

  static const String login = "/login";
  static const String register = "register";
  static const String forgetPassword = "forgetPassword";

  static const String catalog = "/catalog";
  static const String chats = "/chats";
  static const String orders = "/orders";
  static const String notification = "/notification";
  static const String more = "/more";

  /// catalog sub pages
  static const String catalogDetail = "catalogDetail";
  static const String categoryDetail = "categoryDetail";
  static const String favorite = "favorite";
  static const String support = "support";
  static const String search = "search";
  static const String catalogItemInfo = "catalogItemInfo";



  /// more sub pages
static const String myKWorks = "my-kWorks";
static const String hidden = "hidden";
static const String viewed = "viewed";
static const String profile = "profile";
static const String setting = "setting";
static const String blockedUsers = "block-users";


}
