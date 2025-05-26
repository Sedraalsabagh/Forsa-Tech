// lib/presentation/screen/widget/side_menu.dart

import 'package:flutter/material.dart';
import 'tab_item.dart';
import 'menu_item.dart';
import 'menu_row.dart';



class SideMenu extends StatelessWidget {
  final TabItem currentTab;
  final ValueChanged<TabItem> onTabSelected;

  const SideMenu({
    Key? key,
    required this.currentTab,
    required this.onTabSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final menuItems = [
      MenuItemModel(tab: TabItem.home, icon: Icons.home, title: 'Home'),
      MenuItemModel(tab: TabItem.search, icon: Icons.search, title: 'Search'),
      MenuItemModel(tab: TabItem.favorites, icon: Icons.favorite, title: 'Favorites'),
      MenuItemModel(tab: TabItem.chat, icon: Icons.chat, title: 'Chat'),
      MenuItemModel(tab: TabItem.profile, icon: Icons.person, title: 'Profile'),
    ];

    return Drawer(
      child: ListView(
        children: menuItems
            .map((item) => MenuRow(
                  menuItem: item,
                  currentTab: currentTab,
                  onTap: onTabSelected,
                ))
            .toList(),
      ),
    );
  }
}
