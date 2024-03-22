import 'package:actual/common/const/colors.dart';
import 'package:actual/common/layout/default_layout.dart';
import 'package:actual/restaurant/view/restaurant_screen.dart';
import 'package:flutter/material.dart';

class RootTab extends StatefulWidget {
  const RootTab({super.key});

  @override
  State<RootTab> createState() => _RootTabState();
}

class _RootTabState extends State<RootTab> with SingleTickerProviderStateMixin {
  late TabController controller;
  int index = 0;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 4, vsync: this);

    controller.addListener(tabListener);
  }

  @override
  void dispose() {
    controller.removeListener(tabListener);
    super.dispose();
  }

  void tabListener() {
    setState(() {
      index = controller.index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: 'DY 딜리버리',
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: PRIMARY_COLOR,
          unselectedItemColor: BODY_TEXT_COLOR,
          selectedFontSize: 10.0,
          unselectedFontSize: 10.0,
          type: BottomNavigationBarType.fixed,
          onTap: (int index) {
            controller.animateTo(index);
          },
          currentIndex: index,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined), label: '홈'),
            BottomNavigationBarItem(
                icon: Icon(Icons.food_bank_outlined), label: '음식'),
            BottomNavigationBarItem(
                icon: Icon(Icons.receipt_long_outlined), label: '주문'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: '프로필'),
          ]),
      child: TabBarView(
          physics: const NeverScrollableScrollPhysics(),
          controller: controller,
          children: const [
            RestaurantScreen(),
            Center(
              child: Text("음식"),
            ),
            Center(
              child: Text("주문"),
            ),
            Center(
              child: Text("프로필"),
            )
          ]),
    );
  }
}
