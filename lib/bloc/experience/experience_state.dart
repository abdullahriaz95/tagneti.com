part of 'experience_bloc.dart';

@immutable
abstract class ExperienceState {}

class ExperienceInitial extends ExperienceState {
  final Experience experience;
  final List<String> companiesList;
  ExperienceInitial(this.experience, this.companiesList);
}
