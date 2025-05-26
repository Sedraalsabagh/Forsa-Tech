// lib/presentation/screen/widget/menu_row.dart

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'tab_item.dart';
import 'menu_item.dart';

class MenuRow extends StatelessWidget {
  final MenuItemModel menuItem;
  final TabItem currentTab;
  final ValueChanged<TabItem> onTap;

  const MenuRow({
    Key? key,
    required this.menuItem,
    required this.currentTab,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isActive = menuItem.tab == currentTab;

    return ListTile(
      leading: Icon(
        menuItem.icon,
        color: isActive ? Colors.blue : Colors.grey,
      ),
      title: Text(
        menuItem.title,
        style: TextStyle(
          color: isActive ? Colors.blue : Colors.grey,
          fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
        ),
      ),
      onTap: () => onTap(menuItem.tab),
    );
  }
}
