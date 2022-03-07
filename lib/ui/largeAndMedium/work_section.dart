import 'package:abdullahriaz95_dot_com/utilities/utils.dart';
import 'package:abdullahriaz95_dot_com/widgets/heading.dart';
import 'package:abdullahriaz95_dot_com/widgets/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../ar_theme.dart';

class WorkSection extends StatefulWidget {
  @override
  _WorkSectionState createState() => _WorkSectionState();
}

class _WorkSectionState extends State<WorkSection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          heading(context, '03.  ', 'Some Things I\'ve Built'),
          SizedBox(height: 50),
          ListView.separated(
            separatorBuilder: (context, i) {
              return SizedBox(
                height: 120,
              );
            },
            itemCount: Utils.workList.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, i) {
              return _workLayout(context, i);
            },
          ),
        ],
      ),
    );
  }

  Row _workLayout(BuildContext context, int i) {
    return Row(
      children: [
        Expanded(
          child: Stack(
            children: [
              _imageLayer(context, Utils.workList[i].imagePath, i),
              _frontLayer(
                  context,
                  Utils.workList[i].title,
                  Utils.workList[i].description,
                  Utils.workList[i].techStack,
                  Utils.workList[i].androidUrl,
                  Utils.workList[i].iosUrl,
                  i)
            ],
          ),
        ),
      ],
    );
  }

  Widget _frontLayer(BuildContext context, String title, String description,
      String techStack, String androidUrl, String iosUrl, int index) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        index % 2 == 0 ? Expanded(child: Container()) : Container(),
        Container(
          height: ResponsiveWidget.isMediumScreen(context) ? 300 : 400,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: index % 2 == 0
                ? CrossAxisAlignment.end
                : CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: GoogleFonts.montserrat(
                    color: MyTheme.highlightedTextColor,
                    fontSize:
                        ResponsiveWidget.isMediumScreen(context) ? 18 : 22,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 24),
              Material(
                color: Colors.transparent,
                elevation: 12,
                child: Container(
                  width: ResponsiveWidget.isMediumScreen(context) ? 400 : 600,
                  padding: EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(2)),
                    color: MyTheme.selectedListColor,
                  ),
                  child: Text(
                    description,
                    maxLines: ResponsiveWidget.isMediumScreen(context) ? 5 : 7,
                    style: Theme.of(context).textTheme.bodyText1.copyWith(
                        fontSize:
                            ResponsiveWidget.isMediumScreen(context) ? 13 : 16),
                  ),
                ),
              ),
              SizedBox(height: 24),
              Row(
                children: [
                  if (androidUrl != null)
                    IconButton(
                        icon: Icon(
                          Icons.android_rounded,
                          color: MyTheme.normalTextColor,
                          size: 30,
                        ),
                        onPressed: () {
                          Utils.launchURL(androidUrl);
                        }),
                  if (iosUrl != null)
                    SizedBox(
                      width: 12,
                    ),
                  if (iosUrl != null)
                    GestureDetector(
                      onTap: () {
                        Utils.launchURL(iosUrl);
                      },
                      child: SvgPicture.asset('assets/icons/apple.svg',
                          height: 30,
                          width: 30,
                          fit: BoxFit.fitHeight,
                          color: MyTheme.normalTextColor),
                    ),
                ],
              ),
              SizedBox(height: 24),
              Text(
                techStack,
                style: Theme.of(context)
                    .textTheme
                    .bodyText2
                    .copyWith(fontWeight: FontWeight.w200),
              ),
            ],
          ),
        ),
        index % 2 != 0 ? Expanded(child: Container()) : Container(),
      ],
    );
  }

  Row _imageLayer(BuildContext context, String imagePath, int index) {
    return Row(
      children: [
        index % 2 != 0
            ? SizedBox(
                width: ResponsiveWidget.isMediumScreen(context) ? 200 : 400,
              )
            : Container(),
        Expanded(
          child: ClipRRect(
            child: ColorFiltered(
              colorFilter: ColorFilter.mode(
                  Theme.of(context).accentColor.withOpacity(0.7),
                  BlendMode.multiply),
              child: Image.asset(
                imagePath,
                fit: BoxFit.fitHeight,
                alignment: Alignment.centerLeft,
                height: ResponsiveWidget.isMediumScreen(context) ? 300 : 400,
              ),
            ),
          ),
        ),
        index % 2 == 0
            ? SizedBox(
                width: ResponsiveWidget.isMediumScreen(context) ? 200 : 400,
              )
            : Container(),
      ],
    );
  }
}
