import 'package:scoped_model/scoped_model.dart';
import 'package:zero/data/local_recycling_center_provider.dart';
import 'package:zero/data/recycleable.dart';
import 'package:zero/data/recycling_center.dart';

import 'local_recycleable_provider.dart';

class RecyclingCenterModel extends Model {

  List<RecyclingCenter> _recyclingCenters;

  RecyclingCenterModel() : _recyclingCenters = LocalRecyclingCenterProvider.recyclingCenters;

  void load() {
  }

  List<RecyclingCenter> get recyclingCenters => List<RecyclingCenter>.from(_recyclingCenters);

}