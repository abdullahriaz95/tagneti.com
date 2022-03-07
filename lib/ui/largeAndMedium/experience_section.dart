import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tagneti/ar_theme.dart';
import 'package:tagneti/bloc/experience/experience_bloc.dart';
import 'package:tagneti/models/experience.dart';
import 'package:tagneti/ui/largeAndMedium/experience_animated_bar.dart';
import 'package:tagneti/utilities/utils.dart';
import 'package:tagneti/widgets/heading.dart';

class ExperienceSection extends StatefulWidget {
  @override
  _ExperienceSectionState createState() => _ExperienceSectionState();
}

class _ExperienceSectionState extends State<ExperienceSection> {
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

      return Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _companiesList(listOfCompanies, experience),
              SizedBox(width: 32),
              _experienceTextSection(experience, context),
              SizedBox(
                width: 100,
              )
            ],
          ),
        ],
      );
    });
  }

  Expanded _experienceTextSection(Experience experience, BuildContext context) {
    return Expanded(
      child: Column(
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
                // return Text('data');
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
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _companiesList(List<String> listOfCompanies, Experience experience) {
    return Row(
      children: [
        ExperienceAnimatedBar(),
        Container(
          width: 150,
          child: ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
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
                    width: 150,
                    height: 40,
                    color: (listOfCompanies[i] == experience.companyName) ||
                            (listOfCompanies[i] == hoverExperience)
                        ? MyTheme.selectedListColor
                        : Colors.transparent,
                    child: Align(
                      alignment: Alignment.centerLeft,
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
        ),
      ],
    );
  }
}
