import 'package:flutter/material.dart';
import 'package:page_view_indicator/page_view_indicator.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:zero/data/preparation_step.dart';
import 'package:zero/data/recycleable_model.dart';
import 'package:zero/screens/dropoff_pickup.dart';
import 'package:zero/widgets/preparation_step_card.dart';

class InstructionsScreen extends StatefulWidget {
  final int id;

  InstructionsScreen(this.id);

  @override
  _InstructionsScreenState createState() => _InstructionsScreenState();
}

class _InstructionsScreenState extends State<InstructionsScreen> {
  final pageIndexNotifier = ValueNotifier<int>(0);

  PageController _controller = PageController(
    initialPage: 0,
    viewportFraction: 0.8,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _buildInstructionsView(List<PreparationStep> preparationSteps) {
    return PageView.builder(
      onPageChanged: (index) => pageIndexNotifier.value = index,
      itemCount: preparationSteps.length,
      itemBuilder: (context, i) {
        return Padding(
          padding: EdgeInsets.all(4),
          child: new PreparationStepCard(preparationSteps[i], i + 1)
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    final appState = ScopedModel.of<RecycleableModel>(context, rebuildOnChange: true);
    final recycleable = appState.getRecycleable(widget.id);

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(
          color: Colors.black
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          new Padding(
            padding: EdgeInsets.only(left: 20, right: 20, top: 20),
            child: Text(
            "How to Prepare ${recycleable.name}",
            style: new TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
              color: Color(0xff36622B)
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 20),
            child: _buildInstructionsView(recycleable.preparationSteps),
            height: 350,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: PageViewIndicator(
                  pageIndexNotifier: pageIndexNotifier,
                  length: recycleable.preparationSteps.length,
                  normalBuilder: (animationController, index) => Circle(
                        size: 8.0,
                        color: Color(0xffC4C4C4),
                  ),
                  highlightedBuilder: (animationController, index) => ScaleTransition(
                        scale: CurvedAnimation(
                          parent: animationController,
                          curve: Curves.ease,
                        ),
                        child: Circle(
                          size: 12.0,
                          color: Color(0xff729D39),
                        ),
                  ),
                ),
              )
            ]
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  color: Color(0xff36622B),
                  onPressed: () {
                    Navigator.of(context).push<void>(MaterialPageRoute(
                      builder: (context) => DropOffPickUpScreen(),
                      fullscreenDialog: false,
                    ));   
                  },
                  child: const Text(
                    'Throw It',
                    style: TextStyle(
                      color: Colors.white
                    ),
                  ),
                ),
              )
            ]
          ),
        ],
      ),
    );
  }
}