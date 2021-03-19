import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomTabBar extends StatelessWidget {
  final int currentIndex;
  final Function(int index) onTap;

  const BottomTabBar({
    Key key,
    @required this.currentIndex,
    @required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: _buildBottomItems(),
      currentIndex: currentIndex,
      selectedItemColor: Colors.orange,
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,
      elevation: 0,
      onTap: onTap,
    );
  }
}

BottomNavigationBarItem _buildBottomItem({IconData icon, String label}) {
  return BottomNavigationBarItem(
    icon: Icon(icon),
    label: label,
  );
}

List<BottomNavigationBarItem> _buildBottomItems() {
  return [
    _buildBottomItem(icon: Icons.list, label: 'All'),
    _buildBottomItem(icon: Icons.check_box_outlined, label: 'Complete'),
    _buildBottomItem(icon: Icons.check_box_outline_blank, label: 'Incomplete'),
  ];
}
