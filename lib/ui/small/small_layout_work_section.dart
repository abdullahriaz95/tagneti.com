import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tagneti/utilities/utils.dart';
import 'package:tagneti/widgets/heading.dart';

import '../../ar_theme.dart';

class SmallLayoutWorkSection extends StatefulWidget {
  @override
  _SmallLayoutWorkSectionState createState() => _SmallLayoutWorkSectionState();
}

class _SmallLayoutWorkSectionState extends State<SmallLayoutWorkSection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        heading(context, '03.  ', 'Some Things I\'ve Built'),
        SizedBox(height: 50),
        ListView.separated(
          separatorBuilder: (context, i) {
            return SizedBox(
              height: 80,
            );
          },
          itemCount: Utils.workList.length,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, i) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: _workLayout(context, i),
            );
          },
        ),
      ],
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
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment:
            index % 2 == 0 ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleFonts.montserrat(
                color: MyTheme.highlightedTextColor,
                fontSize: 16,
                fontWeight: FontWeight.w500),
          ),
          SizedBox(height: 16),
          Text(
            description,
            textAlign: index % 2 == 0 ? TextAlign.end : TextAlign.start,
            style: Theme.of(context)
                .textTheme
                .bodyText1
                .copyWith(fontSize: 13, height: 1.7),
          ),
          SizedBox(height: 16),
          Row(
            children: [
              if (androidUrl != null)
                IconButton(
                    icon: Icon(
                      Icons.android_rounded,
                      color: MyTheme.normalTextColor,
                      size: 20,
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
                      height: 20,
                      width: 20,
                      fit: BoxFit.fitHeight,
                      color: MyTheme.normalTextColor),
                ),
            ],
          ),
          SizedBox(height: 16),
          Text(
            techStack,
            style: Theme.of(context)
                .textTheme
                .bodyText2
                .copyWith(fontWeight: FontWeight.w200),
          ),
        ],
      ),
    );
  }

  Row _imageLayer(BuildContext context, String imagePath, int index) {
    return Row(
      children: [
        // index % 2 != 0 ? SizedBox(width: 100) : Container(),
        Expanded(
          child: ClipRRect(
            child: ColorFiltered(
              colorFilter: ColorFilter.mode(
                  Theme.of(context).primaryColor.withOpacity(0.95),
                  BlendMode.multiply),
              child: Image.asset(
                imagePath,
                fit: BoxFit.fitWidth,
                alignment: Alignment.centerLeft,
                width: double.infinity,
              ),
            ),
          ),
        ),
        // index % 2 == 0
        //     ? SizedBox(
        //         width: 100,
        //       )
        //     : Container(),
      ],
    );
  }
}
