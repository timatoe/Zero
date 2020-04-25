import 'package:scoped_model/scoped_model.dart';
import 'package:zero/data/local_reward_provider.dart';
import 'package:zero/data/reward.dart';

class RewardModel extends Model {

  List<Reward> _rewards;

  RewardModel() : _rewards = LocalRewardProvider.rewards;

  void load() {
  }

  List<Reward> get rewards => List<Reward>.from(_rewards);

}