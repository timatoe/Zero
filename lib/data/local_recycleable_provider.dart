import 'package:zero/data/preparation_step.dart';
import 'package:zero/data/recycleable.dart';

class LocalRecycleableProvider {
  static List<Recycleable> recycleables = [
    Recycleable(
      id: 1,
      name: "Plastic Bottles",
      preparationSteps: [
        PreparationStep(
          instructions: "Remove any labels",
          imageAssetPath: 'assets/images/plasticbottle1.jpg'
        ),
        PreparationStep(
          instructions: "Fill the bottle with water and clean",
          imageAssetPath: 'assets/images/plasticbottle2.jpg'
        ),
        PreparationStep(
          instructions: "Allow bottle to dry",
          imageAssetPath: 'assets/images/plasticbottle3.jpg'
        ),
      ]
    ),
    Recycleable(
      id: 2,
      name: "Snack Cardboard Boxes",
      preparationSteps: []
    ),
    Recycleable(
      id: 3,
      name: "Glass Containers or Jars",
      preparationSteps: []
    ),
    Recycleable(
      id: 4,
      name: "Aluminium Cans",
      preparationSteps: []
    ),
  ];
}