import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:acm_mobile/components/logo.dart';
import 'package:acm_mobile/components/event.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  DateTime dateSelection = DateTime.now();
  //state for time, what we will pass in from calendar
  bool dropDown = false;
  bool openCalendar = false;

  //this is to represent a document we will get for firebase, definitely need to change the date and tags..

  Map<String, dynamic> testData = {//dynamic means dictionary for any type
    'name': 'HACK FOR HUMANITY',
    'location': 'SCDI',
    'tags': [
      'ACM',
      'ACM-W',
      'Competitive Programming',
      'BroncoSec',
      'AI Collaborate'
    ],
    'date': 'Feb 17, 2024, 9:00 am - Feb 18, 2024, 2:00 pm',
    'description':
        'Hack for Humanity is an opportunity to identify and solve pressing social issues using your creativity and code. We host a series of workshops, bring experienced mentors, and create networking opportunities with industry professionals. Come enjoy the free food, free merch, and exciting events planned!',
  };


  //List<Map<String, dynamic>> testList = [];, we may need 2 to save the original value
  List<Map<String, dynamic>> testList = [];

  @override
  void initState() {
    //when the page would initially render


    super.initState();


    //probably call the API here first, assuming the way we call events from most recent.





    //just adding data to the list..(replace with setting it to the api here
    testList.add(Map<String, dynamic>.from(testData));
    testList.add(Map<String, dynamic>.from(testData));
  }

  void selectDate(DateTime date) {
    //we can pass this function as a parameter into the calendar component
    setState(() {
      dateSelection = date;
    });
    // Call the function to filter API for new date
    onDateSelected(dateSelection);
    //we will filter data, if we click on the same day, we should return the same data

  }

  List<Map<String, dynamic>> onDateSelected(DateTime date) {
    //filter existing data from API based on the date...
    //and return either filtered data, or all if null

    //set new list to filtered list and then return here
    return testList;//change to the filtered data from testList...

  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Logo(),
          actions: [
            IconButton(
              icon: Icon(Icons.calendar_today, color: Colors.blue[900]),
              onPressed: () {
                //we will pass in the selectDate function here.
              },
            ),
            SizedBox(width: 1),
            IconButton(
              icon: Icon(
                  Icons.menu),
              color: Colors.blue[900],
              onPressed: () {
                // Perhaps a useState here to render the dropdown menu.(dropDown)
              },
            ),
          ],
          bottom: PreferredSize(
            //just the groove in the bottom of the appBar
            preferredSize: const Size.fromHeight(2.0),
            child: Container(
              color: Colors.grey[400],
              height: 1.0,
            ),
          ),
        ),
        body: Center(
            child: Container(
                child: Column(children:
          //add loader here? like  Loading ? <loader/> : data..
                  List.generate(
                    testList.length,(index){
                      return Event(data: testList[index]);
                  })


         //list of all the posts
                    ))));
  }
}
