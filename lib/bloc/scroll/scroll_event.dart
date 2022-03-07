part of 'scroll_bloc.dart';

@immutable
abstract class ScrollEvent {}

class ScrollToSectionEvent extends ScrollEvent {
  final String sectionName;
  ScrollToSectionEvent({
    this.sectionName,
  });
}
