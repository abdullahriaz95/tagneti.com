import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tagneti/ui/largeAndMedium/experience_section.dart';
import 'package:tagneti/ui/largeAndMedium/top_nav_bar.dart';
import 'package:tagneti/ui/largeAndMedium/welcome_section.dart';
import 'package:tagneti/ui/largeAndMedium/work_section.dart';
import 'package:tagneti/widgets/responsive.dart';
import 'package:tagneti/widgets/sliver_app_bar_custom_delegate.dart';

import 'about_section.dart';
import 'contact_section.dart';
import 'other_note_worthy_projects.dart';

class MainLargeMediumContent extends StatefulWidget {
  @override
  _MainLargeMediumContentState createState() => _MainLargeMediumContentState();
}

class _MainLargeMediumContentState extends State<MainLargeMediumContent> {
  ScrollController _scrollController;

  GlobalKey _welcomeKey = GlobalKey();
  GlobalKey _aboutKey = GlobalKey();
  GlobalKey _experienceKey = GlobalKey();
  GlobalKey _workKey = GlobalKey();
  GlobalKey _contactKey = GlobalKey();

  @override
  void initState() {
    _scrollController = ScrollController();
    super.initState();
  }

  void _scrollToWidget(String name) {
    GlobalKey globalKey;
    switch (name) {
      case 'About':
        globalKey = _aboutKey;
        break;
      case 'Experience':
        globalKey = _experienceKey;
        break;
      case 'Work':
        globalKey = _workKey;
        break;
      case 'Contact':
        globalKey = _contactKey;
        break;
      case 'Welcome':
        globalKey = _welcomeKey;
        break;
      default:
        globalKey = _welcomeKey;
    }
    if (name == 'Welcome')
      _scrollController.animateTo(0,
          duration: Duration(seconds: 1), curve: Curves.easeInOut);
    else
      _scrollController.animateTo(_getYPosition(globalKey).abs(),
          duration: Duration(seconds: 1), curve: Curves.easeInOut);
  }

  double _getYPosition(GlobalKey _globalKey) {
    RenderBox box = _globalKey.currentContext.findRenderObject();
    Offset position = box.localToGlobal(Offset(0, _scrollController.offset));
    return position.dy - 100;
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: _scrollController,
      slivers: [
        // SliverPersistentHeader(
        //   floating: true,
        //   delegate: SliverAppBarDelegate(
        //     minHeight: 100,
        //     maxHeight: 100,
        //     child: TopNavBar(_scrollToWidget),
        //   ),
        // ),
        SliverList(
          delegate: SliverChildListDelegate(
            [
              Container(key: _welcomeKey, child: WelcomeSection()),
              // Row(
              //   children: [
              //     Flexible(
              //       child: Container(),
              //       flex: 1,
              //     ),
              //     Flexible(
              //       flex: ResponsiveWidget.isMediumScreen(context) ? 5 : 4,
              //       child: Container(
              //         child: Column(
              //           children: [
              //             SizedBox(height: 200),
              //             Container(key: _aboutKey, child: AboutSection()),
              //             SizedBox(height: 200),
              //             Padding(
              //               padding: EdgeInsets.only(
              //                   left: ResponsiveWidget.isMediumScreen(context)
              //                       ? 0
              //                       : 60),
              //               child: Container(
              //                   key: _experienceKey,
              //                   child: ExperienceSection()),
              //             ),
              //             SizedBox(height: 200),
              //             Container(key: _workKey, child: WorkSection()),
              //             SizedBox(height: 200),
              //             OtherNoteworthyProjects(),
              //             SizedBox(height: 200),
              //             Container(key: _contactKey, child: ContactSection()),
              //           ],
              //         ),
              //       ),
              //     ),
              //     Flexible(
              //       child: Container(),
              //       flex: 1,
              //     ),
              //   ],
              // ),
              SizedBox(height: 32),
            ],
          ),
        ),
      ],
    );
  }
}
