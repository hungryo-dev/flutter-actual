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
  int index = 0;
  late TabController controller;

  @override
  void dispose() {
    controller.removeListener(tabListener);
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState

    controller = TabController(length: 4, vsync: this);
    controller.addListener(tabListener);
  }

  void tabListener() {
    setState(() {
      index = controller.index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: '코팩 딜리버리',
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: PRIMARY_COLOR,
          unselectedItemColor: BODY_TEXT_COLOR,
          selectedFontSize: 10,
          unselectedFontSize: 10,
          type: BottomNavigationBarType.fixed,
          onTap: (int index) {
            // setState(() {
            //   this.index = index;
            // });
            controller.animateTo(index);
          },
          currentIndex: index,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: '홈',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.fastfood_outlined),
              label: '음식',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.receipt_long_outlined),
              label: '주문',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              label: '프로필',
            ),
          ]),
      child: TabBarView(
        physics: const NeverScrollableScrollPhysics(), //좌우측 스크롤 금지
        controller: controller,
        children: [
          const RestaurantScreen(),
          Center(
            child: Container(
              child: const Text('음식'),
            ),
          ),
          Center(
            child: Container(
              child: const Text('주문'),
            ),
          ),
          Center(
            child: Container(
              child: const Text('프로필'),
            ),
          ),
        ],
      ),
    );
  }
}
