import 'dart:async';

import 'package:abdullahriaz95_dot_com/models/experience.dart';
import 'package:abdullahriaz95_dot_com/utilities/utils.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'experience_event.dart';
part 'experience_state.dart';

//todo: remove the listOfCompanies and use list of experiences for that
class ExperienceBloc extends Bloc<ExperienceEvent, ExperienceState> {
  ExperienceBloc()
      : super(ExperienceInitial(Utils.upworkExperience, Utils.listOfCompanies));

  @override
  Stream<ExperienceState> mapEventToState(
    ExperienceEvent event,
  ) async* {
    if (event is ChangeExperience) {
      yield ExperienceInitial(event.experience, Utils.listOfCompanies);
    }
  }
}
