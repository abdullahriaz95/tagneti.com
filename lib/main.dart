import 'package:abdullahriaz95_dot_com/ar_theme.dart';
import 'package:abdullahriaz95_dot_com/bloc/experience/experience_bloc.dart';
import 'package:abdullahriaz95_dot_com/bloc/scroll/scroll_bloc.dart';
import 'package:abdullahriaz95_dot_com/route_generator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// todo: add responsiveness in design
// todo: add bloc pattern
// todo: add a fireworks animation in Works Section

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ExperienceBloc()),
        BlocProvider(create: (context) => ScrollBloc()),
      ],
      child: MaterialApp(
        title: 'Abdullah Riaz',
        debugShowCheckedModeBanner: false,
        theme: MyTheme.arTheme(context),
        initialRoute: "/splash",
        onGenerateRoute: RouteGenerator.generateRoute,
      ),
    );
  }
}