import 'package:devloper_app/presentaion/screen/widget/tab_item.dart';
import 'package:flutter/material.dart';
import 'rive_icon_model.dart';

class MenuItemModel {
  MenuItemModel({
    this.id,
    this.title = "",
    required this.tab, // هنا نقوم بتغيير riveIcon إلى tab من نوع TabItem
    required this.icon,
  });

  UniqueKey? id = UniqueKey();
  String title;
  TabItem tab; // تغيير من riveIcon إلى tab
  IconData icon;

  static List<MenuItemModel> menuItems = [
    MenuItemModel(
      title: "Home",
      tab: TabItem.home, // استخدمنا TabItem هنا
      icon: Icons.home,
    ),
    MenuItemModel(
      title: "Search",
      tab: TabItem.search,
      icon: Icons.search,
    ),
    MenuItemModel(
      title: "Favorites",
      tab: TabItem.favorites,
      icon: Icons.favorite,
    ),
    MenuItemModel(
      title: "Help",
      tab: TabItem.chat,
      icon: Icons.chat,
    ),
  ];
}
