import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tagneti/ar_theme.dart';
import 'package:tagneti/extensions/hover_extensions.dart';
import 'package:tagneti/utilities/utils.dart';
import 'package:tagneti/widgets/responsive.dart';

class OtherNoteworthyProjects extends StatefulWidget {
  @override
  _OtherNoteworthyProjectsState createState() =>
      _OtherNoteworthyProjectsState();
}

class _OtherNoteworthyProjectsState extends State<OtherNoteworthyProjects> {
  String iconHovered = '';
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Other Noteworthy Projects',
            style: GoogleFonts.montserrat(
                color: MyTheme.highlightedTextColor,
                fontSize: 28,
                fontWeight: FontWeight.w600),
          ),
          SizedBox(height: 60),
          GridView.count(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            crossAxisCount: ResponsiveWidget.isMediumScreen(context) ? 2 : 3,
            children: List.generate(Utils.projectList.length, (index) {
              return _gridItemLayout(index, context).moveUpOnHover;
            }),
          )
        ],
      ),
    );
  }

  Padding _gridItemLayout(int index, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: MyTheme.selectedListColor,
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 12,
              ),
              Row(
                children: [
                  Icon(
                    Icons.folder_outlined,
                    size: 40,
                    color: Theme.of(context).accentColor,
                  ),
                  Expanded(child: Container()),
                  Utils.projectList[index].link == ''
                      ? Container()
                      : MouseRegion(
                          cursor: SystemMouseCursors.click,
                          onEnter: (_) {
                            setState(() {
                              iconHovered = Utils.projectList[index].title;
                            });
                          },
                          onExit: (_) {
                            setState(() {
                              iconHovered = '';
                            });
                          },
                          child: GestureDetector(
                            onTap: () {
                              Utils.launchURL(Utils.projectList[index].link);
                            },
                            child: Icon(
                              Icons.link_rounded,
                              size: 24,
                              color:
                                  iconHovered == Utils.projectList[index].title
                                      ? Theme.of(context).accentColor
                                      : MyTheme.normalTextColor,
                            ),
                          ),
                        ),
                ],
              ),
              SizedBox(
                  height: ResponsiveWidget.isMediumScreen(context) ? 12 : 20),
              Text(
                Utils.projectList[index].title,
                style: Theme.of(context).textTheme.headline6.copyWith(
                    color: MyTheme.highlightedTextColor,
                    fontSize:
                        ResponsiveWidget.isMediumScreen(context) ? 16 : 18),
              ),
              SizedBox(height: 12),
              Text(
                Utils.projectList[index].description,
                style: Theme.of(context).textTheme.bodyText1.copyWith(
                    height: 1.3,
                    fontSize:
                        ResponsiveWidget.isMediumScreen(context) ? 13 : 14),
                overflow: TextOverflow.fade,
                maxLines: ResponsiveWidget.isMediumScreen(context) ? 8 : 5,
              ),
              SizedBox(
                  height: ResponsiveWidget.isMediumScreen(context) ? 12 : 24),
              Text(
                Utils.projectList[index].techStack,
                style: Theme.of(context).textTheme.bodyText2.copyWith(
                    fontWeight: FontWeight.w200,
                    fontSize:
                        ResponsiveWidget.isMediumScreen(context) ? 11 : 13),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
