
import 'package:flutter/material.dart';

class Event extends StatelessWidget {
  @override
  final Map<String, dynamic> data;
  //dictionary that I need for each event data

  Event(
      {required this.data});

  Widget build(BuildContext context) {

    Map<String, dynamic> getColor = {
      'ACM': Colors.blue[900],
      'ACM-W': Colors.pink[700],
      'Competitive Programming': Colors.orange[900],
      'BroncoSec': Colors.red[900],
      'AI Collaborate': Colors.blue[300],
      //gonna change this to date time value
    };
    return
      Column(
     children:[ const SizedBox(height:20),
        Container(
            width: 300, //width of the events  holder
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.white,
                width: 0,
              ),
            ),
            child: Column(children: [
              Container(
                width: 300, // get the width of the image
                height: 300, // Set the height of the container

                child:


                GestureDetector(
                  onTap: () {
                    showDialog(//displays the expanded dialog modal of image
                      context: context,
                      barrierDismissible: true,
                      builder: (BuildContext context) {
                        return Center(
                            child: Container(
                              width: 400,
                              height: 400,
                              child: Center(
                                child: Image.asset('lib/images/img.png'),
                              ),
                            ),


                        );
                      },
                    );

                  }, //change this when we fetch from firebase...
                  child: Image.asset('lib/images/img.png'),
                )

              ),
              const SizedBox(height: 10),
              Container(
                width: 300,

                child: Wrap(
                  spacing: 8, // Horizontal space between children
                  runSpacing: 10, // Vertical space between lines
                  children: List.generate(
                    data['tags'].length,
                        (index) {
                      return DecoratedBox(
                        decoration: BoxDecoration(
                          color: getColor[data['tags'][index]],
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(4),
                          child: Text(
                            '${data['tags'][index]}',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 8,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              Container(
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text('${data['name']}',
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            fontFamily: 'Lato',
                          )))),
              Container(
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Location: ${data['location']}',
                          style: TextStyle(
                            color:
                                Colors.blue[900], // Set the text color to white
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            fontFamily: 'Lato',
                          )))),
              const SizedBox(height: 8),
              Container(
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        '${data['date']}',
                        style: TextStyle(
                          color:
                              Colors.blue[400],
                          fontWeight: FontWeight.normal,
                          fontSize: 10,
                          fontFamily: 'Lato',
                        ),
                      ))),
              const SizedBox(height: 8),
              Container(
                  child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '${data['description']}',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.normal,
                    fontSize: 10,
                    fontFamily: 'Lato',
                  ),
                ),
              )),
             const SizedBox(height: 8),
              Container(
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Row(children: [
                        ElevatedButton(
                          onPressed: () {
                            // Handle sign up
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue[900],
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(20),
                            ),
                            padding: EdgeInsets.symmetric(
                                vertical: 1, horizontal: 1),
                            minimumSize: Size(60, 30),
                          ),
                          child: Text(
                            ' Sign up',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.normal,
                              fontSize: 10,
                              fontFamily: 'Lato',
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        ElevatedButton(
                          onPressed: () {
                            //handle more info
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                              side: BorderSide(
                                  color: Colors.blue[900]!, width: 1),
                              //need ! as Color? needs to check if null, this is to tell its not null
                            ),
                            padding: EdgeInsets.symmetric(
                                vertical: 1, horizontal: 1),
                            minimumSize: Size(60, 30),
                          ),
                          child: Text(
                            'More Info',
                            style: TextStyle(
                              color: Colors.blue[900],
                              fontWeight: FontWeight.normal,
                              fontSize: 10,
                              fontFamily: 'Lato',
                            ),
                          ),
                        )
                      ]))),
            ]))]);
  }
}
