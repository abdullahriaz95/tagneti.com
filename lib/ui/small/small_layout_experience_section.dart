import 'package:abdullahriaz95_dot_com/bloc/experience/experience_bloc.dart';
import 'package:abdullahriaz95_dot_com/models/experience.dart';
import 'package:abdullahriaz95_dot_com/ui/small/small_layout_experience_animated_bar.dart';
import 'package:abdullahriaz95_dot_com/utilities/utils.dart';
import 'package:abdullahriaz95_dot_com/widgets/heading.dart';
import 'package:abdullahriaz95_dot_com/widgets/responsive.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SmallLayoutExperienceSection extends StatefulWidget {
  @override
  _SmallLayoutExperienceSectionState createState() =>
      _SmallLayoutExperienceSectionState();
}

class _SmallLayoutExperienceSectionState
    extends State<SmallLayoutExperienceSection> {
  String hoverExperience = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          heading(context, '02.  ', 'Where I\'ve Worked'),
          SizedBox(height: 32),
          _experienceContent(),
        ],
      ),
    );
  }

  BlocBuilder<ExperienceBloc, ExperienceState> _experienceContent() {
    return BlocBuilder<ExperienceBloc, ExperienceState>(
        builder: (context, expState) {
      List<String> listOfCompanies =
          (expState as ExperienceInitial).companiesList;
      Experience experience = (expState as ExperienceInitial).experience;

      return Container(
        child: Column(
          children: [
            _companiesList(listOfCompanies, experience),
            SmallLayoutExperienceAnimatedBar(),
            SizedBox(height: 24),
            _experienceTextSection(experience, context),
          ],
        ),
      );
    });
  }

  Widget _experienceTextSection(Experience experience, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 8),
        RichText(
          text: TextSpan(
            children: <TextSpan>[
              TextSpan(
                text: '${experience.rank} ',
                style: Theme.of(context).textTheme.headline6,
              ),
              TextSpan(
                text: '@ ${experience.companyName}',
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    Utils.openCompanySite(experience.companyName);
                  },
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    .copyWith(color: Theme.of(context).accentColor),
              ),
            ],
          ),
        ),
        SizedBox(height: 8),
        Text(
          '${experience.startingDate} - ${experience.endingDate}',
          style: Theme.of(context)
              .textTheme
              .bodyText2
              .copyWith(fontWeight: FontWeight.w100),
        ),
        SizedBox(height: 16),
        Container(
          child: ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: experience.points.length,
            itemBuilder: (context, i) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 4.0),
                      child: Icon(
                        Icons.eco_rounded,
                        size: 12,
                        color: Theme.of(context).accentColor,
                      ),
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Expanded(
                      child: Text(
                        experience.points[i],
                        style: Theme.of(context).textTheme.bodyText1.copyWith(
                            fontSize: ResponsiveWidget.isSmallScreen(context)
                                ? 14
                                : 16),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _companiesList(List<String> listOfCompanies, Experience experience) {
    return Container(
      width: double.infinity,
      height: 40,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: listOfCompanies.length,
        itemBuilder: (context, i) {
          return MouseRegion(
            cursor: SystemMouseCursors.click,
            onEnter: (_) {
              setState(() {
                hoverExperience = listOfCompanies[i];
              });
            },
            onExit: (_) {
              setState(() {
                hoverExperience = '';
              });
            },
            child: GestureDetector(
              onTap: () {
                Experience exp = Utils.experiencesList
                    .where((exp) => exp.companyName == listOfCompanies[i])
                    .first;
                BlocProvider.of<ExperienceBloc>(context)
                    .add(ChangeExperience(experience: exp));
              },
              child: Container(
                width: 120,
                height: 30,
                child: Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 12.0),
                    child: Text(
                      listOfCompanies[i],
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2
                          .copyWith(fontWeight: FontWeight.w200),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
