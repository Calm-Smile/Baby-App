
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:localnotification/demo_localization.dart';



class MyApp4 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final title = "ListView List";

    List choices =  [
      Choice(

          title: DemoLocalization.of(context).translate('r1'),
          date: '1 June 2019',
          description:
          DemoLocalization.of(context).translate('r2'),
          imglink:
          'assets/5.jpg'),
      Choice(

          title: DemoLocalization.of(context).translate('r3'),
          date: '1 June 2016',
          description:
          DemoLocalization.of(context).translate('r4'),
          imglink:
          'assets/4.jpg'),
      Choice(

          title: DemoLocalization.of(context).translate('r5'),
          date: '1 June 2019',
          description:
          DemoLocalization.of(context).translate('r6'),
          imglink:
          'assets/3.jpg'),
      Choice(

          title: DemoLocalization.of(context).translate('r7'),
          date: '1 June 2017',
          description:
          DemoLocalization.of(context).translate('r8'),
          imglink:
          'assets/2.jpg'),
      Choice(

          title: DemoLocalization.of(context).translate('r9'),
          date: '1 June 2018',
          description:
          DemoLocalization.of(context).translate('r10'),
          imglink:
          'assets/1.jpg'),

    ];

    return MaterialApp(
        title: title,
        home: Scaffold(
            body: new ListView(
                shrinkWrap: true,
                padding: const EdgeInsets.all(20.0),
                children: List.generate(choices.length, (index) {
                  return Center(

                    child: ChoiceCard(
                        choice: choices[index], item: choices[index]),
                  );
                }))),
        supportedLocales: [
        Locale("en", "US"),
    Locale("ar", "OM")
    ], localizationsDelegates: [
    DemoLocalization.delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    ],
    localeResolutionCallback: (locale, supportedLocales)
    {
    for(var supportedLocale in supportedLocales)
    {
    if(supportedLocale.languageCode == locale.languageCode && supportedLocale.countryCode == locale.countryCode)
    return supportedLocale;
    }
    return supportedLocales.first;
    },
    );
  }
}

class Choice {
  final String otap;
  final String title;
  final String date;
  final String description;
  final String imglink;


  const Choice({this.otap, this.title, this.date, this.description, this.imglink});
}

class ChoiceCard extends StatelessWidget {
  const ChoiceCard(
      {Key key,
        this.choice,
        this.otap,
        @required this.item,
        this.selected: false})
      : super(key: key);

  final Choice choice;

  final Choice otap;

  final Choice item;

  final bool selected;

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.display1;
    final String txt=DemoLocalization.of(context).translate('s4');
    if (selected)
      textStyle = textStyle.copyWith(color: Colors.lightGreenAccent[400]);

    return Card(
        color: Colors.white,

        child: Column(

          children: [

            new Container(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(choice.imglink)),
            new Container(
              padding: const EdgeInsets.all(10.0),
              child: ExpansionTile(
                title: Text(choice.title,style: Theme.of(context).textTheme.title),
                children: [
                  //Text(choice.title, style: Theme.of(context).textTheme.title),
                  //Text(choice.date,
                  //style: TextStyle(color: Colors.black.withOpacity(0.5))),"s4": "تم"
                  Text(choice.description, textScaleFactor: 1.3, softWrap: true, textDirection: (txt=="تم"? TextDirection.rtl : TextDirection.ltr), ),
                ], childrenPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
              ),
            )
          ], //textDirection: TextDirection.rtl,

          crossAxisAlignment: CrossAxisAlignment.start,
        ));
  }
}