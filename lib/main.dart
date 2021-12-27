import 'dart:async';
import 'dart:io';
//import 'dart:html';
//import 'dart:html';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
//import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:date_field/date_field.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:localnotification/demo_localization.dart';
import 'package:localnotification/list.dart';
//import 'package:localnotification/generated_plugin_registrant.dart';
//import 'package:sqflite/sqflite.dart';
import 'package:intl/intl.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
void main() {
  runApp(TabBarDemo());
}

class TabBarDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.home)),
                Tab(icon: Icon(Icons.baby_changing_station)),
                Tab(icon: Icon(Icons.access_time)),
              ],
            ),
            title: Text('تطعيمات طفلي'),
          ),

          body: TabBarView(
            children: [
              MyApp(),
              MyApp4(),//ListViewHome(),
              MyApp3(),
            ],
          ),
        ),
      ), supportedLocales: [
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
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();
  //String _email = '';
  @override
  void initState() {
    //super.initState();
    var initializationSettingsAndroid =
    AndroidInitializationSettings('flutter_devs');
    var initializationSettingsIOs = IOSInitializationSettings();
    var initSetttings = InitializationSettings(
        initializationSettingsAndroid, initializationSettingsIOs);

    flutterLocalNotificationsPlugin.initialize(initSetttings,
        onSelectNotification: onSelectNotification);
  }

  Future onSelectNotification(String payload) {
    //Navigator.restorablePush(context, (context, arguments) => NewScreen());
    //Navigator.push(context, MaterialPageRoute(builder: (context) => NewScreen()),);
  }

  //@override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     body: new Center(
  //
  //       child: Column(
  //         children: <Widget>[
  //     new Padding(
  //     padding: EdgeInsets.symmetric(vertical: 10.0),
  //   ),
  //           RaisedButton(
  //             onPressed: showNotification,
  //             child: new Text(
  //               'showNotification',
  //             ),
  //           ),
  //           RaisedButton(
  //             onPressed: cancelNotification,
  //             child: new Text(
  //               'cancelNotification',
  //             ),
  //           ),
  //           RaisedButton(
  //             onPressed: scheduleNotification,
  //             child: new Text(
  //               'scheduleNotification',
  //             ),
  //           ),
  //           RaisedButton(
  //             onPressed: showBigPictureNotification,
  //             child: new Text(
  //               'showBigPictureNotification',
  //             ),
  //           ),
  //           RaisedButton(
  //             onPressed: showNotificationMediaStyle,
  //             child: new Text(
  //               'showNotificationMediaStyle',
  //             ),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }
  String button = "";

  void _selectedButton(String selectedButton) {
    setState(() {
      button = selectedButton;
    });
  }

  @override
  Widget build(BuildContext context) {

    int count=2;
    return Scaffold(

      body: Column(children: [
        //new Text('app'),
        new Expanded(
          child: new Center(

            child: new Container(
              padding: EdgeInsets.symmetric(vertical: 15),
              //height: [EXPECTED_GRID_HEIGHT],
              child: GridView.count(
                crossAxisCount: 1,
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
                padding: EdgeInsets.all(10.0),
                children: [
                  Card(
                    elevation: 0,
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.all(Radius.circular(20)),

                      onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => SecondRoute()),);}, // Handle your callback.
                      splashColor: Colors.white.withOpacity(0.1),
                      child: Ink(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/33.jpg'),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Expanded(child: SizedBox()),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                              child: Text(DemoLocalization.of(context).translate('l1'), style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),),
                            ),
                          ],),
                        //color: Colors.white70,
                        //   child: Text("appointments",  style:
                        // TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0) ,
                        // ),
                      ),
                    ),
                  ),
                  Card(
                    color: Colors.transparent,
                    elevation: 0,
                    child: InkWell(
                      borderRadius: BorderRadius.all(Radius.circular(20)),

                      onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => NewScreen()),);}, // Handle your callback.
                      splashColor: Colors.white.withOpacity(0.1),
                      child: Ink(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/11.jpg'),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Expanded(child: SizedBox()),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                              child: Text(DemoLocalization.of(context).translate('l2'), style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),),
                            ),
                          ],),
                        //color: Colors.white70,
                        //   child: Text("appointments",  style:
                        // TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0) ,
                        // ),
                      ),
                    ),
                  ),
                  Card(
                    color: Colors.transparent,
                    elevation: 0,
                    child: InkWell(
                      borderRadius: BorderRadius.all(Radius.circular(20)),

                      onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => FirstRoute()),);}, // Handle your callback.
                      splashColor: Colors.white.withOpacity(0.1),
                      child: Ink(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/44.jpg'),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Expanded(child: SizedBox()),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                              child: Text(DemoLocalization.of(context).translate('l3'), style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),),
                            ),
                          ],),
                        //color: Colors.white70,
                        //   child: Text("appointments",  style:
                        // TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0) ,
                        // ),
                      ),
                    ),
                  ),
                  // Card(
                  //   color: Colors.transparent,
                  //   elevation: 0,
                  //   child: InkWell(
                  //     borderRadius: BorderRadius.all(Radius.circular(20)),
                  //
                  //     onTap: () {}, // Handle your callback.
                  //     splashColor: Colors.white.withOpacity(0.1),
                  //     child: Ink(
                  //       height: 100,
                  //       width: 100,
                  //       decoration: BoxDecoration(
                  //         image: DecorationImage(
                  //           image: AssetImage('assets/22.jpg'),
                  //           fit: BoxFit.cover,
                  //         ),
                  //         borderRadius: BorderRadius.all(Radius.circular(20)),
                  //       ),
                  //       ),
                  //       child: Column(
                  //         mainAxisAlignment: MainAxisAlignment.start,
                  //         crossAxisAlignment: CrossAxisAlignment.start,
                  //         children: <Widget>[
                  //           Expanded(child: SizedBox()),
                  //           Padding(
                  //             padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                  //             child: Text("title", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),),
                  //           ),
                  //         ],),
                  //       //color: Colors.white70,
                  //       //   child: Text("appointments",  style:
                  //       // TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0) ,
                  //       // ),
                  //     ),
                  //   ),
                  // ),

                ],
              ),
              //    new Container(
              //
              //    width: heightMain * 0.8,
              //    height: heightMain * 0.8,
              //    decoration: BoxDecoration(
              //      image: DecorationImage(
              //       image: AssetImage("assets/3.jpg"),
              //       fit: BoxFit.cover,),
              //     shape: BoxShape.circle,
            ),
          ),

        ),
      ],
      ), floatingActionButton: FloatingActionButton.extended(
      onPressed: () { _MyAppState().showNotification();

      },
      label: Text(DemoLocalization.of(context).translate('l4')),
      icon: Icon(Icons.notification_important),
      backgroundColor: Colors.blue,
    ),
    );
  }


  Future<void> showNotificationMediaStyle() async {
    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
      'media channel id',
      'media channel name',
      'media channel description',
      color: Colors.red,
      enableLights: true,
      largeIcon: DrawableResourceAndroidBitmap("flutter_devs"),
      styleInformation: MediaStyleInformation(),
    );
    var platformChannelSpecifics =
    NotificationDetails(androidPlatformChannelSpecifics, null);
    await flutterLocalNotificationsPlugin.show(
        0, DemoLocalization.of(context).translate('n1'), DemoLocalization.of(context).translate('n2'), platformChannelSpecifics);
  }

  Future<void> showBigPictureNotification() async {
    var bigPictureStyleInformation = BigPictureStyleInformation(
        DrawableResourceAndroidBitmap("flutter_devs"),
        largeIcon: DrawableResourceAndroidBitmap("flutter_devs"),
        contentTitle: 'flutter devs',
        htmlFormatContentTitle: true,
        summaryText: 'summaryText',
        htmlFormatSummaryText: true);
    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
        'big text channel id',
        'big text channel name',
        'big text channel description',
        styleInformation: bigPictureStyleInformation);
    var platformChannelSpecifics =
    NotificationDetails(androidPlatformChannelSpecifics, null);
    await flutterLocalNotificationsPlugin.show(
        0, 'big text title', 'silent body', platformChannelSpecifics,
        payload: "big image notifications");
  }

  Future<void> scheduleNotification() async {
    var scheduledNotificationDateTime =
    DateTime.now().add(Duration(seconds: 5));
    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
      'channel id',
      'channel name',
      'channel description',
      icon: 'flutter_devs',
      largeIcon: DrawableResourceAndroidBitmap('flutter_devs'), styleInformation: BigTextStyleInformation(''),
    );
    var iOSPlatformChannelSpecifics = IOSNotificationDetails();
    var platformChannelSpecifics = NotificationDetails(
        androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.schedule(
        0,
        'scheduled title',
        'scheduled body',
        scheduledNotificationDateTime,
        platformChannelSpecifics);
  }

  Future<void> cancelNotification() async {
    await flutterLocalNotificationsPlugin.cancel(0);
  }

  showNotification() async {
    var android = new AndroidNotificationDetails(
        'id', 'channel ', 'description',
        priority: Priority.High, importance: Importance.Max, styleInformation: BigTextStyleInformation(''));
    var iOS = new IOSNotificationDetails();
    var platform = new NotificationDetails(android, iOS);
    await flutterLocalNotificationsPlugin. show(
      0, "تذكير بالموعد", "هذا لتذكيرك بالموعد القادم .. اصطحبي طفلك إلى المستشفى لتلقي التطعيم.", platform,
    );

  }
}

// ignore: must_be_immutable
class NewScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(DemoLocalization.of(context).translate('n3')),

      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(backgroundImage: AssetImage("assets/3.jpg"), radius: 80,),
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20.0),
                child: Text(DemoLocalization.of(context).translate('t1'), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0)),
              ),
            ]
        ),
      ),floatingActionButton: FloatingActionButton(
      // When the user presses the button, show an alert dialog containing
      // the text that the user has entered into the text field.
      onPressed: () {
        Navigator.pop(context);
        //setState(() {});
      },
      tooltip: 'Set the value!',
      child: Icon(Icons.keyboard_arrow_right),
    ),
    );
  }
}

class FirstRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(DemoLocalization.of(context).translate('v1')),
      ),
      body: Center(

        child: new Text(
            DemoLocalization.of(context).translate('v2'),
            style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0)),

      ),
    );
  }
}

class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(DemoLocalization.of(context).translate('v3')),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 15),
          child: ListView(children: <Widget>[
            Center(

              child: Table(
                defaultColumnWidth: FixedColumnWidth(150.0),
                border: TableBorder.all(
                    color: Colors.black,
                    style: BorderStyle.solid,
                    width: 1),
                children: [
                  TableRow(children: [
                    Column(children: [Text(DemoLocalization.of(context)
                        .translate('tb'), style: TextStyle(fontSize: 24.0))
                    ]),
                    Column(children: [Text(DemoLocalization.of(context)
                        .translate('t2'), style: TextStyle(fontSize: 24.0))
                    ]),
                  ]),
                  TableRow(children: [
                    Column(children: [Text(DemoLocalization.of(context)
                        .translate('tt3'))]),
                    Column(children: [Text(DemoLocalization.of(context)
                        .translate('t3'))
                    ]),

                  ]),
                  TableRow(children: [
                    Column(children: [
                      Text(DemoLocalization.of(context)
                              .translate('tt4'))
                    ]),
                    Column(children: [Text(DemoLocalization.of(context)
                        .translate('t4'))
                    ]),

                  ]),
                  TableRow(children: [
                    Column(children: [Text(DemoLocalization.of(context)
                        .translate('tt5'))]),
                    Column(children: [Text(DemoLocalization.of(context)
                        .translate('t5'))
                    ]),

                  ]),
                  TableRow(children: [
                    Column(children: [
                      Text(DemoLocalization.of(context)
                          .translate('tt6'))
                    ]),
                    Column(children: [Text(DemoLocalization.of(context)
                        .translate('t6'))
                    ]),

                  ]),
                  TableRow(children: [
                    Column(children: [Text(DemoLocalization.of(context)
                        .translate('tt7'))]),
                    Column(children: [Text(DemoLocalization.of(context)
                        .translate('t7'))
                    ]),
                  ]),

                  TableRow(children: [
                    Column(
                        children: [Text(DemoLocalization.of(context)
                            .translate('tt8'))]),
                    Column(children: [Text(DemoLocalization.of(context)
                        .translate('t8'))
                    ]),
                  ]),

                  TableRow(children: [
                    Column(children: [Text(DemoLocalization.of(context)
                        .translate('tt9'))]),
                    Column(children: [Text(DemoLocalization.of(context)
                        .translate('t9'))
                    ]),
                  ]),

                  TableRow(children: [
                    Column(children: [
                      Text(DemoLocalization.of(context)
                          .translate('tt10'))
                    ]),
                    Column(children: [Text(DemoLocalization.of(context)
                        .translate('t10'))
                    ]),
                  ]),

                  TableRow(children: [
                    Column(children: [Text(DemoLocalization.of(context)
                        .translate('tt11'))]),
                    Column(children: [Text(DemoLocalization.of(context)
                        .translate('t11'))
                    ]),
                  ]),
                ],
              ),
            ),
          ],
          ),
        )
    );
  }
}





class MyApp3 extends StatefulWidget {

  @override
  _MyApp3 createState() => _MyApp3();
}

class _MyApp3 extends State<MyApp3> {

  DateTime selectedDate;
  int difference;
  double c1,c2,c3,c4,c5,c6,c7,c8;
  String formattedDate;

  @override
  void initState() {
    super.initState();
    _reads();
    _read();
  }

  @override
  Widget build(BuildContext context) {
    //var await str= _reads();
    if(formattedDate==null) formattedDate="";

    if(difference==null||difference<0)
      {difference=0;}
    if(difference>=60) c2=1; else
    c2=(60.0-difference.toDouble())/60;
    if(difference>=120) c3=1; else
    c3=(120.0-difference.toDouble())/120;
    c4=(180.0-difference.toDouble())/180;
    c5=(270.0-difference.toDouble())/270;
    c6=(360.0-difference.toDouble())/360;
    c7=(390.0-difference.toDouble())/390;
    c8=(540.0-difference.toDouble())/540;
    c1=(720.0-difference.toDouble())/720;
    //c9=(720.0-difference.toDouble())/720;

    return Scaffold(

      body: Center(
        child: ListView(
            children: <Widget>[
              // new Text(
              //   "read value from shared preference is:"+_email),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(DemoLocalization.of(context).translate('c3') + "$formattedDate",textAlign: TextAlign.center, style:
                TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0)),
              ),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 20),
                child: Text(DemoLocalization.of(context).translate('db') + difference.toString(),textAlign: TextAlign.center, style:
                TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0)),),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0),
              ),
              Padding(padding: EdgeInsets.symmetric(horizontal: 20),
                  child: DateTimeField(

                  decoration: InputDecoration(
                      hintText: DemoLocalization.of(context).translate('r12'), contentPadding: EdgeInsets.symmetric(horizontal: 10)),
                  selectedDate: selectedDate,
                  onDateSelected: (DateTime value) {
                    setState(() {

                      selectedDate = value;
                      //String formattedDate = DateFormat('yyyy-MM-dd').format(value);
                      //_incrementCounter(value.toIso8601String());
                      formattedDate = DateFormat('yyyy-MM-dd').format(value);

                      //_incrementCounter(formattedDate);
                    });
                  }),),
              Padding(
                padding: EdgeInsets.symmetric( horizontal: 10,vertical: 10),
                //child: Text(DemoLocalization.of(context).translate('r13')),
              child:

                    DateTimeFormField(
                      decoration: InputDecoration(
                        hintStyle: TextStyle(color: Colors.black45),
                        errorStyle: TextStyle(color: Colors.redAccent),
                        border: OutlineInputBorder(),
                        suffixIcon: Icon(Icons.event_note),
                        labelText: DemoLocalization.of(context).translate('r14'),
                      ),
                      mode: DateTimeFieldPickerMode.date,
                      autovalidateMode: AutovalidateMode.always,
                      validator: (e) =>
                      (e?.day ?? 0) == 1 ? 'Please not the first day' : null,
                      onDateSelected: (DateTime value) {
                        final birthday = DateTime(value.year, value.month, value.day);
                        final date2 = DateTime.now();
                        difference = date2.difference(birthday).inDays;

                        final DateFormat formatter = DateFormat('yyyy-MM-dd');
                        formattedDate = formatter.format(value);

                        _save();
                        _saves();
                        setState(() {});

                      },
                    ),

                  ),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 10),
                child: Text(DemoLocalization.of(context).translate('c10'),textAlign: TextAlign.center, style:
                TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0)),),
              new Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0),
              ),
              new CircularPercentIndicator(
                radius: 200.0,
                lineWidth: 13.0,
                animation: true,
                percent: ((c2==1.0)? 1 : 1.0-c2),
                center: new Text((c2==1.0)? DemoLocalization.of(context).translate('s4') : (c2*60).toInt().toString()+DemoLocalization.of(context).translate('c1'),
                  style:
                  new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                ),
                footer: new Text(
                  DemoLocalization.of(context).translate('c2'),
                  style:
                  new TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0),
                ),
                circularStrokeCap: CircularStrokeCap.round,
                progressColor: Colors.blue,
              ),
              new Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0),
              ),

              new CircularPercentIndicator(
                radius: 200.0,
                lineWidth: 13.0,
                animation: true,
                percent: (c3==1.0)?1:1-c3,
                center: new Text((c3==1.0)? DemoLocalization.of(context).translate('s4') : (c3*120).toInt().toString()+DemoLocalization.of(context).translate('c1'),
                  style:
                  new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                ),
                footer: new Text(
                  DemoLocalization.of(context).translate('c4'),
                  style:
                  new TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0),
                ),
                circularStrokeCap: CircularStrokeCap.round,
                progressColor: Colors.pink,
              ),
              new Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0),
              ),
              new CircularPercentIndicator(
                radius: 200.0,
                lineWidth: 13.0,
                animation: true,
                percent: ((c4==1.0)? 1 : 1.0-c4),
                center: new Text((c4==1.0)? DemoLocalization.of(context).translate('s4') : (c4*180).toInt().toString()+DemoLocalization.of(context).translate('c1'),
                  style:
                  new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                ),
                footer: new Text(
                  DemoLocalization.of(context).translate('c5'),
                  style:
                  new TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0),
                ),
                circularStrokeCap: CircularStrokeCap.round,
                progressColor: Colors.cyan,
              ),
              new Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0),
              ),
              new CircularPercentIndicator(
                radius: 200.0,
                lineWidth: 13.0,
                animation: true,
                percent: ((c5==1.0)? 1 : 1.0-c5),
                center: new Text((c5==1.0)? DemoLocalization.of(context).translate('s4') : (c5*270).toInt().toString()+DemoLocalization.of(context).translate('c1'),
                  style:
                  new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                ),
                footer: new Text(
                  DemoLocalization.of(context).translate('c6'),
                  style:
                  new TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0),
                ),
                circularStrokeCap: CircularStrokeCap.round,
                progressColor: Colors.indigo,
              ),
              new Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0),
              ),
              new CircularPercentIndicator(
                radius: 200.0,
                lineWidth: 13.0,
                animation: true,
                percent: ((c6==1.0)? 1 : 1.0-c6),
                center: new Text((c6==1.0)? DemoLocalization.of(context).translate('s4') : (c6*360).toInt().toString()+DemoLocalization.of(context).translate('c1'),
                  style:
                  new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                ),
                footer: new Text(
                  DemoLocalization.of(context).translate('c7'),
                  style:
                  new TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0),
                ),
                circularStrokeCap: CircularStrokeCap.round,
                progressColor: Colors.tealAccent,
              ),
              new Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0),
              ),
              new CircularPercentIndicator(
                radius: 200.0,
                lineWidth: 13.0,
                animation: true,
                percent: ((c7==1.0)? 1 : 1.0-c7),
                center: new Text((c7==1.0)? DemoLocalization.of(context).translate('s4') : (c7*390).toInt().toString()+DemoLocalization.of(context).translate('c1'),
                  style:
                  new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                ),
                footer: new Text(
                  DemoLocalization.of(context).translate('c8'),
                  style:
                  new TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0),
                ),
                circularStrokeCap: CircularStrokeCap.round,
                progressColor: Colors.teal,
              ),
              new Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0),
              ),
              new CircularPercentIndicator(
                radius: 200.0,
                lineWidth: 13.0,
                animation: true,
                percent: ((c8==1.0)? 1 : 1.0-c8),
                center: new Text((c8==1.0)? DemoLocalization.of(context).translate('s4') : (c8*540).toInt().toString()+DemoLocalization.of(context).translate('c1'),
                  style:
                  new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                ),
                footer: new Text(
                  DemoLocalization.of(context).translate('c9'),
                  style:
                  new TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0),
                ),
                circularStrokeCap: CircularStrokeCap.round,
                progressColor: Colors.deepOrangeAccent,
              ),
              new Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0),
              ),
              new CircularPercentIndicator(
                radius: 200.0,
                lineWidth: 13.0,
                animation: true,
                percent: ((c1==1.0)? 1 : 1.0-c1),
                center: new Text((c1==1.0)? DemoLocalization.of(context).translate('s4') : (c1*720).toInt().toString()+DemoLocalization.of(context).translate('c1'),
                  style:
                  new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                ),
                footer: new Text(
                  DemoLocalization.of(context).translate('s3'),
                  style:
                  new TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0),
                ),
                circularStrokeCap: CircularStrokeCap.round,
                progressColor: Colors.purple,
              ),
                    new Padding(
                      padding: EdgeInsets.symmetric(vertical: 30.0),
                    ),
                  ],
                ),
              )
    );
  }

  _read() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'my_key';
    difference = prefs.getInt(key) ?? 0;
    print('read: $difference');
  }

  _save() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'my_key';
    final value = difference;
    prefs.setInt(key, value);
    print('saved: $value');
  }
  _reads() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'my_s';
    formattedDate = prefs.getString(key) ?? "0";
    print('read: $formattedDate');
  }

  _saves() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'my_s';
    final value = formattedDate;
    prefs.setString(key, value);
    print('saved: $value');
  }
}