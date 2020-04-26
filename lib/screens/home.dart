import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:zero/data/recycleable.dart';
import 'package:zero/data/recycleable_model.dart';
import 'package:zero/screens/directory.dart';
import 'package:zero/screens/dropoff_pickup.dart';
import 'package:zero/screens/instructions.dart';
import 'package:zero/screens/rewards.dart';
import 'package:zero/widgets/recycleable_headline.dart';
import 'package:zero/widgets/search_bar.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = TextEditingController();
  final focusNode = FocusNode();
  String terms = '';

  @override
  void initState() {
    super.initState();
    controller.addListener(_onTextChanged);
  }

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  void _onTextChanged() {
    setState(() => terms = controller.text);
  }

  Widget _createSearchBox() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: SearchBar(
        controller: controller,
        focusNode: focusNode,
      ),
    );
  }

  Widget _buildPopularResults(List<Recycleable> recycleables) {
    
    return ListView.builder(
      padding: EdgeInsets.only(left: 20, right: 20),
      scrollDirection: Axis.horizontal,
      itemCount: recycleables.length,
      itemBuilder: (context, i) {
        return Padding(
          padding: EdgeInsets.all(4),
          child: new GestureDetector(
            onTap: () => {
              Navigator.of(context).push<void>(MaterialPageRoute(
                builder: (context) => InstructionsScreen(recycleables[i].id),
                fullscreenDialog: false,
              ))
            },
            child: Chip(
              label: Text(
                recycleables[i].name, 
                style: new TextStyle(color: Color(0xff36622B)),
              ),
              backgroundColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: Color(0xff36622B)), 
                  borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
            ),
          )
        );
      },
    );
  }

  Widget _buildSearchResults(List<Recycleable> recycleables) {
    return ListView.builder(
      padding: EdgeInsets.only(top:0),
      itemCount: recycleables.length,
      itemBuilder: (context, i) {
        return Padding(
          padding: EdgeInsets.all(16),
          child: RecycleableHeadline(recycleables[i]),
        );
      },
    );
 }


  @override
  Widget build(BuildContext context) {
    final model = ScopedModel.of<RecycleableModel>(context, rebuildOnChange: true);

    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          iconTheme: IconThemeData(
            color: Colors.black
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  new Padding(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: Text(
                    "How to Prepare Your Recycleables",
                    style: new TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color: Color(0xff36622B)
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  _createSearchBox(),
                  new Container(
                    child: _buildPopularResults(model.popularRecycleables),
                    height: 40,
                  )
                ],
              ),
              flex: 2,
            ),
            Expanded(
              child: _buildSearchResults(model.searchRecycleables(terms)),
            )
          ] 
        ),
        drawer: Drawer(
          child: Container(
            color: Color(0xff36622B),
            child:         ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 24,
                      width: 24,
                      color: Colors.black,
                    ),
                  ],
                )
              ),
              new Container(
                color: Color(0xff36622B),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: []
                      ),
                      flex: 1,
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          ListTile(
                            leading: Icon(
                              CupertinoIcons.person_solid,
                              color: Colors.white,
                            ),
                            title: Text(
                              'Account',
                              style: new TextStyle(
                                color: Colors.white
                              ),
                            )
                          ),
                          ListTile(
                            leading: Icon(
                              CupertinoIcons.search,
                              color: Colors.white,
                            ),
                            title: Text(
                              'Sort Waste',
                              style: new TextStyle(
                                color: Colors.white
                              ),
                            ),
                            onTap: () {
                              Navigator.of(context).push<void>(MaterialPageRoute(
                                builder: (context) => HomeScreen(),
                                fullscreenDialog: false,
                              ));                     
                            },
                          ),
                          ListTile(
                            leading: Icon(
                              CupertinoIcons.book_solid,
                              color: Colors.white,
                            ),
                            title: Text(
                              'Directory',
                              style: new TextStyle(
                                color: Colors.white
                              ),
                            ),
                            onTap: () {
                              Navigator.of(context).push<void>(MaterialPageRoute(
                                builder: (context) => DirectoryScreen(),
                                fullscreenDialog: false,
                              ));                     
                            },
                          ),            
                          ListTile(
                            leading: Icon(
                              CupertinoIcons.down_arrow,
                              color: Colors.white,
                            ),
                            title: Text(
                              'Drop-off Points',
                              style: new TextStyle(
                                color: Colors.white
                              ),
                            ),
                            onTap: () {
                              Navigator.of(context).push<void>(MaterialPageRoute(
                                builder: (context) => DropOffPickUpScreen(),
                                fullscreenDialog: false,
                              ));                     
                            },
                          ),
                          ListTile(
                            leading: Icon(
                              CupertinoIcons.heart_solid,
                              color: Colors.white,
                            ),
                            title: Text(
                              'Rewards',
                              style: new TextStyle(
                                color: Colors.white
                              ),
                            ),
                            onTap: () {
                              Navigator.of(context).push<void>(MaterialPageRoute(
                                builder: (context) => RewardsScreen(),
                                fullscreenDialog: false,
                              ));                     
                            },
                          ),
                          ListTile(
                            leading: Icon(
                              CupertinoIcons.restart,
                              color: Colors.white,
                            ),
                            title: Text(
                              'History',
                              style: new TextStyle(
                                color: Colors.white
                              ),
                            )
                          ),
                          ListTile(
                            leading: Icon(
                              CupertinoIcons.gear_solid,
                              color: Colors.white,
                            ),
                            title: Text(
                              'Settings',
                              style: new TextStyle(
                                color: Colors.white
                              ),
                            )
                          ),            
                          ListTile(
                            leading: Icon(
                              CupertinoIcons.reply_thick_solid,
                              color: Colors.white,
                            ),
                            title: Text(
                              'Help',
                              style: new TextStyle(
                                color: Colors.white
                              ),
                            )
                          ),
                        ]
                    ),
                      flex: 3,
                    ),
                  ],
              )
              )            
            ],
          ),
          )
        ),
      );

  }
}