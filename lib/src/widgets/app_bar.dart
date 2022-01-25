import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ux_research/src/utilities/break_points.dart';
import 'package:ux_research/src/utilities/color.dart';

class HomeAppBar extends StatelessWidget with PreferredSizeWidget {
  final double appBarHeight = 100.0;

  // Test Func
  void tempFunc() {
    print("TEST LOG");
  }

  @override
  get preferredSize => Size.fromHeight(appBarHeight);

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    print(MediaQuery.of(context).size.width);
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          AppBar(
            foregroundColor: kDarkGrey,
            backgroundColor: Colors.transparent,
            automaticallyImplyLeading: false,
            elevation: 0,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Icon(Icons.ac_unit_sharp),
                actionButtons(screenWidth)
              ],
            ),
          ),
        ],
      ),
    );
  }

  // AppBar 우측 버튼 리스트 , Desktop 레이아웃일 때 호출됨.
  Widget actionButtons(double screenWidth) {
    if (screenWidth > kDesktopBreakPoint) {
      return Row(
        children: [
          actionButton("Home", tempFunc()),
          actionButton("About", tempFunc()),
          actionButton("Contact", tempFunc()),
          IconButton(
            icon: SvgPicture.asset("icons/search_ic.svg"),
            onPressed: () {},
          )
        ],
      );
    } else {
      return IconButton(
        icon: SvgPicture.asset("icons/menu_bar_ic.svg"),
        onPressed: () {},
      );
    }
  }

  // 우측 버튼
  Container actionButton(String content, void tempFunc) {
    return Container(
      margin: const EdgeInsets.only(right: 50),
      child: TextButton(
        onPressed: () {
          print("Hello");
        },
        child: Text(
          content,
          style: const TextStyle(
              fontWeight: FontWeight.w300, fontSize: 16, color: kDarkGrey),
        ),
      ),
    );
  }
}
