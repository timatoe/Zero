import 'package:scoped_model/scoped_model.dart';
import 'package:zero/data/collector.dart';
import 'package:zero/data/local_collector_provider.dart';

class CollectorModel extends Model {

  List<Collector> _collectors;

  CollectorModel() : _collectors = LocalCollectorProvider.collectors;

  void load() {
  }

  List<Collector> get collectors => List<Collector>.from(_collectors);

}