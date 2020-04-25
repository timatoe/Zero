import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:zero/data/collector_model.dart';
import 'package:zero/data/recycleable_model.dart';
import 'package:zero/data/recycling_center_model.dart';
import 'package:zero/data/reward_model.dart';
import 'package:zero/screens/home.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]);
  
  runApp(
    ScopedModel<RecycleableModel>(
      model: RecycleableModel()..load(),
      child: ScopedModel<RecyclingCenterModel>(
        model: RecyclingCenterModel()..load(),
        child: ScopedModel<CollectorModel>(
          model: CollectorModel()..load(),
          child: ScopedModel<RewardModel>(
            model: RewardModel()..load(),
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                brightness: Brightness.light,
              ),
              home: HomeScreen(),
            ),
          )
        )
      )
    )
  );
}
