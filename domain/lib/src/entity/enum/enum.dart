import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

enum InitialAppRoute {
  login,
  main,
}

enum Gender {
  male(ServerRequestResponseConstants.male),
  female(ServerRequestResponseConstants.female),
  other(ServerRequestResponseConstants.other),
  unknown(ServerRequestResponseConstants.unknown);

  const Gender(this.serverValue);
  final int serverValue;

  static const defaultValue = unknown;
}

enum LanguageCode {
  en(
    localeCode: LocaleConstants.en,
    serverValue: ServerRequestResponseConstants.en,
  ),
  ja(
    localeCode: LocaleConstants.ja,
    serverValue: ServerRequestResponseConstants.ja,
  );

  const LanguageCode({
    required this.localeCode,
    required this.serverValue,
  });
  final String localeCode;
  final String serverValue;

  static const defaultValue = ja;
}

enum NotificationType {
  unknown,
  newPost,
  liked;

  static const defaultValue = unknown;
}

enum BottomTab {
  home(icon: Icon(Icons.menu), activeIcon: Icon(Icons.menu,)),
  search(icon: Icon(Icons.people), activeIcon: Icon(Icons.people)),
  myPage(icon: Icon(Icons.settings), activeIcon: Icon(Icons.settings));

  const BottomTab({
    required this.icon,
    required this.activeIcon,
  });
  final Icon icon;
  final Icon activeIcon;

  String get title {
    switch (this) {
      case BottomTab.home:
        return 'Nhà hàng';
      case BottomTab.search:
        return 'Nhân Viên';
      case BottomTab.myPage:
        return 'setting';
    }
  }
}
