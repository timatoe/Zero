import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:zero/data/reward.dart';
import 'package:zero/data/reward_model.dart';

class RewardsScreen extends StatelessWidget {
  Widget _buildRewardsView(List<Reward> rewards) {
    return ListView.builder(
      itemCount: rewards.length,
      itemBuilder: (context, i) {
        return Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          color: Color(0xffEFEFEF),
          child: Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(16),
                child: Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage(
                        rewards[i].imageAssetPath
                      ),
                    ),
                  ),
                ),
              ),
              Column(
                children: <Widget>[
                  Text(
                    rewards[i].name,
                    style: new TextStyle(
                    color: Color(0xff36622B),
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    ),
                  ),
                  Text(
                    rewards[i].price,
                    style: new TextStyle(
                    color: Color(0xff36622B)
                    ),
                  ),
                  SizedBox(height: 32,),
                  Text(
                    rewards[i].description,
                    style: new TextStyle(
                    color: Color(0xff36622B)
                    ),
                  ),
                ],
              )
            ],
          )
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final model = ScopedModel.of<RewardModel>(context, rebuildOnChange: true);

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(
          color: Colors.black
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            Expanded(
              child:  _buildRewardsView(model.rewards),
            )
          ],
        )
      )
    );
  }
}