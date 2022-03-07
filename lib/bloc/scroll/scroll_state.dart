part of 'scroll_bloc.dart';

@immutable
abstract class ScrollState {}

class ScrollInitial extends ScrollState {}

class ScrollToSectionState extends ScrollState {
  final String scrollSection;
  ScrollToSectionState({
    this.scrollSection,
  });
}
