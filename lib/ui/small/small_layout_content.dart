import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tagneti/bloc/scroll/scroll_bloc.dart';
import 'package:tagneti/ui/largeAndMedium/contact_section.dart';
import 'package:tagneti/ui/small/small_layout_about_section.dart';
import 'package:tagneti/ui/small/small_layout_experience_section.dart';
import 'package:tagneti/ui/small/small_layout_navigation_stack.dart';
import 'package:tagneti/ui/small/small_layout_other_noteworthy_projects.dart';
import 'package:tagneti/ui/small/small_layout_top_nav_bar.dart';
import 'package:tagneti/ui/small/small_layout_welcome_section.dart';
import 'package:tagneti/ui/small/small_layout_work_section.dart';
import 'package:tagneti/widgets/sliver_app_bar_custom_delegate.dart';

class SmallLayoutContent extends StatefulWidget {
  @override
  _SmallLayoutContentState createState() => _SmallLayoutContentState();
}

class _SmallLayoutContentState extends State<SmallLayoutContent> {
  ScrollController _scrollController = ScrollController();
  GlobalKey _welcomeKey = GlobalKey();
  GlobalKey _aboutKey = GlobalKey();
  GlobalKey _experienceKey = GlobalKey();
  GlobalKey _workKey = GlobalKey();
  GlobalKey _contactKey = GlobalKey();

  void _scrollToWidget(String name) {
    GlobalKey gk;
    switch (name) {
      case 'About':
        gk = _aboutKey;
        break;
      case 'Experience':
        gk = _experienceKey;
        break;
      case 'Work':
        gk = _workKey;
        break;
      case 'Contact':
        gk = _contactKey;
        break;
      case 'Welcome':
        gk = _welcomeKey;
        break;
      default:
        gk = _welcomeKey;
        break;
    }

    print('_scrollToWidget - $name');
    print('_scrollToWidget - $name');

    if (name == 'Welcome')
      _scrollController.animateTo(0,
          duration: Duration(seconds: 1), curve: Curves.easeInOut);
    else
      _scrollController.animateTo(_getYPosition(gk).abs(),
          duration: Duration(seconds: 1), curve: Curves.easeInOut);
  }

  double _getYPosition(GlobalKey _globalKey) {
    print('global Key found - $_globalKey');
    if (_globalKey.currentContext != null)
      print('global key current context is null');
    RenderBox box = _globalKey.currentContext.findRenderObject();
    Offset position = box.localToGlobal(Offset(0, _scrollController.offset));
    return position.dy - 80;
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ScrollBloc, ScrollState>(
      listener: (context, state) {
        if (state is ScrollToSectionState) {
          print('state found - ${state.scrollSection}');
          _scrollToWidget(state.scrollSection);
        }
      },
      child: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverPersistentHeader(
            floating: true,
            delegate: SliverAppBarDelegate(
              minHeight: 100,
              maxHeight: 100,
              child: SmallLayoutTopNavBar(_scrollToWidget),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                [
                  Container(
                      key: _welcomeKey, child: SmallLayoutWelcomeSection()),
                  Container(key: _aboutKey, child: SmallLayoutAboutSeciton()),
                  SizedBox(height: 100),
                  Container(
                      key: _experienceKey,
                      child: SmallLayoutExperienceSection()),
                  SizedBox(height: 100),
                  Container(key: _workKey, child: SmallLayoutWorkSection()),
                  SizedBox(height: 100),
                  SmallLayoutOtherNoteworthyProjects(),
                  SizedBox(height: 100),
                  Container(key: _contactKey, child: ContactSection()),
                  SizedBox(height: 100),
                  Container(child: SmallLayoutNavigationLayout()),
                  SizedBox(height: 32),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
