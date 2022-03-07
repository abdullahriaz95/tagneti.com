import 'package:abdullahriaz95_dot_com/utilities/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../ar_theme.dart';

class SmallLayoutOtherNoteworthyProjects extends StatefulWidget {
  @override
  _SmallLayoutOtherNoteworthyProjectsState createState() =>
      _SmallLayoutOtherNoteworthyProjectsState();
}

class _SmallLayoutOtherNoteworthyProjectsState
    extends State<SmallLayoutOtherNoteworthyProjects> {
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
                fontSize: 22,
                fontWeight: FontWeight.w600),
          ),
          SizedBox(height: 30),
          ListView(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: List.generate(Utils.projectList.length, (index) {
              return _gridItemLayout(index, context);
            }),
          )
        ],
      ),
    );
  }

  Padding _gridItemLayout(int index, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 6),
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
              Row(
                children: [
                  Icon(
                    Icons.folder_outlined,
                    size: 30,
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
              SizedBox(height: 12),
              Text(
                Utils.projectList[index].title,
                style: Theme.of(context).textTheme.headline6.copyWith(
                    color: MyTheme.highlightedTextColor, fontSize: 14),
              ),
              SizedBox(height: 12),
              Text(
                Utils.projectList[index].description,
                style: Theme.of(context)
                    .textTheme
                    .bodyText1
                    .copyWith(fontSize: 12, height: 1.6),
                overflow: TextOverflow.fade,
              ),
              SizedBox(height: 12),
              Text(
                Utils.projectList[index].techStack,
                style: Theme.of(context)
                    .textTheme
                    .bodyText2
                    .copyWith(fontWeight: FontWeight.w200, fontSize: 11),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
