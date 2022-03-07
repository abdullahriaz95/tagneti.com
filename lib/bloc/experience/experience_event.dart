part of 'experience_bloc.dart';

@immutable
abstract class ExperienceEvent {}

class ChangeExperience extends ExperienceEvent {
  final Experience experience;
  ChangeExperience({
    this.experience,
  });
}
