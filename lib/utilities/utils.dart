import 'dart:math';
import 'dart:ui';

import 'package:tagneti/models/experience.dart';
import 'package:tagneti/models/project.dart';
import 'package:tagneti/models/work.dart';
import 'package:url_launcher/url_launcher.dart';

class Utils {
  static String resumeLink =
      'https://drive.google.com/file/d/1CumhCqsKPZz57SlxVtifrob_Kb1_2Hzk/view?usp=sharing';
  static void launchURL(String url) async =>
      await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';

  /* 
  Following is for Note Worthy Projects section.
  */

  static List<Project> projectList = [
    particleBackground,
    animateMyText,
    startupNameFinder,
    emailScrapper,
    writer,
    newsBucket,
    pulse,
    personalSitev1,
  ];

  static Project writer = Project(
      title: 'Writer - Notes & Painting',
      link:
          'https://play.google.com/store/apps/details?id=com.binarymosaic.notes.diary.paint',
      description:
          'Writer is a simple and awesome app that gives you a quick and simple notepad editing experience, diary writing, to do list and paint. Writer allows you to capture and organize your thoughts and ideas. This app helps you to manage your notes and daily schedules. It also provides feature of drawing and painting.',
      techStack: 'Kotlin  Android');

  static Project newsBucket = Project(
      title: 'News Bucket',
      link:
          'https://play.google.com/store/apps/details?id=newsBucket.abdullahriaz.com.newsBucket',
      description:
          'It gather news from the most authentic sources around the world like BBC, CNN, The New York Times, ESPN, ENGADGET, BuzzFeed, Mashable, The Wall Street Journal, The Verge and many more. Its simple design gives you a quick and easy access to categorized news as well. News Bucket is all you want to keep you updated of the incidents and events around the globe.',
      techStack: 'Java  Android');

  static Project pulse = Project(
      title: 'Pulse - Donate Blood',
      link: '',
      description:
          'Pulse is a blood donation app which helps you to search nearby active blood donors. Through pulse we can find and donate blood. It is a blood donation app which helps you to search blood donors nearby. It helps needy patients to search for blood donors in emergency. Pulse lets you to find and give blood.',
      techStack: 'Java  Android');

  static Project particleBackground = Project(
      title: 'Particle Background',
      link: 'https://pub.dev/packages/flutter_particle_background',
      description:
          'Flutter package published by me. A Flutter Particle Background package that makes your app more pleasant. This simple package is for both iOS and Android. This is a simple package which fills your screen background with different coloured particles, which gives a unique and pleasant feel to the app.',
      techStack: 'Dart  Flutter');

  static Project animateMyText = Project(
      title: 'Animate My Text',
      link: 'https://pub.dev/packages/animate_my_text',
      description:
          'Another flutter package published by me. A simple text appearance with animation which increases user experience. The text appears letter by letter giving you a wide variety of control like Duration, colors, size, etc.',
      techStack: 'Dart  Flutter');

  static Project startupNameFinder = Project(
      title: 'Startup Name Finder',
      link: '',
      description:
          'It\'s one of my fun little projects that I do now and then. Finding a startup name by first fetching a list of nouns from different databases on the internet. And then checking if the domain is available on GoDaddy site using Sillinium.',
      techStack: 'Python');

  static Project emailScrapper = Project(
      title: 'Email Scrapper',
      link: '',
      description:
          'Scrapping emails of hundreds of companies from different sites. Just another project having fun with the python language.',
      techStack: 'Python');

  static Project personalSitev1 = Project(
      title: 'Personal Site v1',
      link: 'https://abdullahriaz95.github.io/abdullah/#/',
      description: 'Version 1 of the personal site. Developed in 2020.',
      techStack: 'Dart  Flutter');

/* 
Following is for Work Section.
 */

  static List<Work> workList = [
    wholeHeartedly,
    elevateMe,
    dynamicMobility,
  ];
  static Work wholeHeartedly = Work(
      imagePath: 'assets/work/wholeheartedly_3.png',
      title: 'Wholeheartedly',
      description:
          'This app is for a client, T. Marie is a Relationship Analyst who specializes helping others on their journey to evolve their relational understanding. In this app, you can have chat based sessions with her regarding your immediate relationship issues, as well as engage in thought based forums that promote growth and challenge your mindset.',
      techStack: 'Dart   Flutter',
      androidUrl:
          'https://play.google.com/store/apps/details?id=com.abdullahriaz.wholeheartedly');
  static Work elevateMe = Work(
    imagePath: 'assets/work/elevateme_2.png',
    title: 'ElevateMe',
    description:
        'ElevateMe is a mobile app that overcomes all the issues we, and you, face when it comes to seeking therapy. The app let\'s you make appointments for online counseling. The client can pay via either Google Pay or Apple pay for the session or have monthly subscription and can have video/audio call with this therapist.',
    techStack: 'Dart   Flutter',
    androidUrl:
        'https://play.google.com/store/apps/details?id=com.elevateme.client',
  );
  static Work dynamicMobility = Work(
      imagePath: 'assets/work/dynamic_mobility_1.png',
      title: 'Dynamic Mobility',
      description:
          'The app uses image mapping feature for each joint where the user can specifically see the exercises to strengthen that particular joint by clicking it. It also have other features like Hydration Reminder and Health tracker.',
      techStack: 'Dart   Flutter',
      iosUrl: 'https://apps.apple.com/us/app/dynamic-mobility/id1532789114',
      androidUrl:
          'https://play.google.com/store/apps/details?id=com.abdullahriaz.skeletonimagemapping');

/* 
Following is for the Experience Section.
 */
  static List<String> listOfCompanies = [
    'Upwork',
    'Innowi',
    'Logicon',
    'Ozi Technology',
  ];

  static List<Experience> experiencesList = [
    upworkExperience,
    innowiExperience,
    logiconExperience,
    oziExperience
  ];

  static Experience upworkExperience = Experience(
      rank: 'Flutter Developer',
      companyName: 'Upwork',
      startingDate: 'Jan 2020',
      endingDate: 'Present',
      points: [
        'Write modern, performant, and robust code for a diverse array of client and internal projects.',
        'Work mostly in Dart language, with different other libraries and state management systems such as Bloc and Provider.',
        'Communicate and collaborate with multi-disciplinary teams of engineers, designers, producers, clients, and stakeholders on a daily basis.',
      ]);

  static Experience oziExperience = Experience(
      rank: 'Android Developer',
      companyName: 'Ozi Technology',
      startingDate: 'June 2018',
      endingDate: 'Jan 2019',
      points: [
        'Use of Firebase services including Firebase Database, Firebase Cloud Functions, Firebase Messaging and Analytics were a great part of work there.',
        'Also worked with In App Purchases and Admob Integration for native ads to earn revenue.',
        'Developed a lot variety of apps ranging from simple utilities apps to workout apps.',
      ]);
  static Experience logiconExperience = Experience(
      rank: 'Android Developer',
      companyName: 'Logicon',
      startingDate: 'Jan 2019',
      endingDate: 'July-2019',
      points: [
        'Worked on Android Architecture Components like Data Binding, Live Data, Room etc.',
        'Worked on different architectures, mainly on MVVM.',
        'Worked on features like Chat and Live Tracking.',
      ]);

  static Experience innowiExperience = Experience(
      rank: 'Android Developer',
      companyName: 'Innowi',
      startingDate: 'July 2019',
      endingDate: 'December 2020',
      points: [
        'Working on Android Open Source Project (AOSP) particularly on Framework layer.',
        'Integrated different Payment Gateways like Shift4 and CreditCall.',
        'Worked on Device Manager & Device Administrator roles and OEM Configurations for Android 9 and 10.',
      ]);

  static Color randomColor() {
    return Color(Random().nextInt(0xffffffff));
  }

  static void openCompanySite(String companyName) {
    if (companyName == 'Upwork') {
      Utils.launchURL('https://www.upwork.com/fl/abdullahriaz22');
    } else if (companyName == 'Ozi Technology') {
      Utils.launchURL('https://ozitechnology.com/');
    } else if (companyName == 'Innowi') {
      Utils.launchURL('https://innowi.com/');
    } else if (companyName == 'Logicon') {
      Utils.launchURL('https://logicon.tech/');
    }
  }
}
