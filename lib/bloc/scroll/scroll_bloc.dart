import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'scroll_event.dart';
part 'scroll_state.dart';

class ScrollBloc extends Bloc<ScrollEvent, ScrollState> {
  ScrollBloc() : super(ScrollInitial());

  @override
  Stream<ScrollState> mapEventToState(
    ScrollEvent event,
  ) async* {
    if (event is ScrollToSectionEvent) {
      print('scroll bloc - ${event.sectionName}');
      yield ScrollToSectionState(scrollSection: event.sectionName);
    }
  }
}
