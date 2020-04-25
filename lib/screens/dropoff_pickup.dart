import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:zero/data/collector.dart';
import 'package:zero/data/collector_model.dart';
import 'package:zero/data/recycling_center.dart';
import 'package:zero/data/recycling_center_model.dart';

class DropOffPickUpScreen extends StatefulWidget {
  @override
  _DropOffPickUpScreen createState() => _DropOffPickUpScreen();
}

class _DropOffPickUpScreen extends State<DropOffPickUpScreen> {
  final Map<int, Widget> dropOffPickUpControlWidgets = const <int, Widget>{
    0: Text(
      'Drop It Off Myself',
      ),
    1: Text(
      'Arrange A Pick Up',
      )
  };
  int segmentedControlValue = 0;
  bool displayDropOffView = true;
  
  Widget _buildDropOffView(List<RecyclingCenter> recyclingCenters) {
    return Text('drop off');
  }

  Widget _buildPickUpView(List<Collector> collectors) {
    return Column(
      children: <Widget>[
        Text(
          'Enter Your Preferred Time and Place',
          style: TextStyle(
            color: Color(0xff36622B),
            fontWeight: FontWeight.bold
          ),
        ),
        Padding(
          padding: EdgeInsets.all(20),
          child: Row(
            children: <Widget>[
              Expanded(
                child: 
                Padding(
                  padding: EdgeInsets.all(2),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    color: Color(0xffEFEFEF),
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.all(12),
                          child: Row(children: <Widget>[
                          Text(
                            'Date',
                            style: new TextStyle(
                            color: Color(0xff36622B)
                            ),
                          ),
                          Expanded(child: SizedBox(width: 1,),),
                          Icon(
                            CupertinoIcons.pencil,
                            color: Color(0xff729D39),
                          )
                        ],),
                        ),
                        SizedBox(height: 18,),
                        Padding(
                          padding: EdgeInsets.all(12),
                          child: Text(
                            '20th April',
                            style: new TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                              color: Color(0xff36622B)
                              ),
                          )
                        )
                      ],
                    ),
                  ),
                )
              ),
              Expanded(
                child: 
                Padding(
                  padding: EdgeInsets.all(2),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    color: Color(0xffEFEFEF),
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.all(12),
                          child: Row(children: <Widget>[
                          Text(
                            'Time',
                            style: new TextStyle(
                            color: Color(0xff36622B)
                            ),
                          ),
                          Expanded(child: SizedBox(width: 1,),),
                          Icon(
                            CupertinoIcons.pencil,
                            color: Color(0xff729D39),
                          )
                        ],),
                        ),
                        SizedBox(height: 18,),
                        Padding(
                          padding: EdgeInsets.all(12),
                          child: Text(
                            '15:30',
                            style: new TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                              color: Color(0xff36622B)
                              ),
                          )
                        )
                      ],
                    ),
                  ),
                )
              ),
            ],
          ),
        ),
        Row(
          children: <Widget>[

          ],
        ),
        Text(
          'Select Your Preferred Collector',
          style: TextStyle(
            color: Color(0xff36622B),
            fontWeight: FontWeight.bold
          ),
        ),
        // ListView.builder(
        //   scrollDirection: Axis.horizontal,
        //   itemCount: collectors.length,
        //   itemBuilder: (context, i) {
        //     return Card(
        //       shape: RoundedRectangleBorder(
        //         borderRadius: BorderRadius.circular(15.0),
        //       ),
        //       color: Color(0xffEFEFEF),
        //       child: Row(
        //         children: <Widget>[
                  
        //         ],
        //       ),
        //     );
        //   },
        // ),
        RaisedButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          color: Color(0xff36622B),
          onPressed: () {
            // Navigator.of(context).push<void>(MaterialPageRoute(
            //   builder: (context) => DropOffPickUpScreen(),
            //   fullscreenDialog: false,
            // ));   
          },
          child: const Text(
            'Book a time',
            style: TextStyle(
              color: Colors.white
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final recyclingCenterModel = ScopedModel.of<RecyclingCenterModel>(context, rebuildOnChange: true);
    final collectorModel = ScopedModel.of<CollectorModel>(context, rebuildOnChange: true);

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(
          color: Colors.black
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsets.all(24),
            child: CupertinoSlidingSegmentedControl(
              thumbColor: Color(0xff36622B),
              children: dropOffPickUpControlWidgets, 
              onValueChanged: (int val) {
                this.setState(() {
                  segmentedControlValue = val;
                  displayDropOffView = val == 0;
                });
              },
              groupValue: segmentedControlValue,
              ),
          ), 
          displayDropOffView ? _buildDropOffView(recyclingCenterModel.recyclingCenters) : _buildPickUpView(collectorModel.collectors),
        ],
      ),
    );
  }
}