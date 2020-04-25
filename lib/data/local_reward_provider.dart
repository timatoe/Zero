import 'package:zero/data/reward.dart';

class LocalRewardProvider {
  static List<Reward> rewards = [
    Reward(
      id: 1,
      name: 'Net Moc face wash',
      price: '95 points',
      description: 'Sap hang chang Sen',
      imageAssetPath: 'assets/images/reward1.jpg'
    ),
    Reward(
      id: 2,
      name: 'Net Xua hair serum',
      price: '320 points',
      description: 'Sap hang chang Sen',
      imageAssetPath: 'assets/images/reward2.jpg'
    ),
    Reward(
      id: 3,
      name: 'Eggplant tooth powder',
      price: '50 points',
      description: 'Sap hang chang Sen',
      imageAssetPath: 'assets/images/reward3.jpg'
    ),
    Reward(
      id: 4,
      name: 'Beeswax food wrap',
      price: '1337 points',
      description: 'Sap hang chang Sen',
      imageAssetPath: 'assets/images/reward4.jpg'
    ),
  ];
}