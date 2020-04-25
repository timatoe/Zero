import 'package:scoped_model/scoped_model.dart';
import 'package:zero/data/recycleable.dart';

import 'local_recycleable_provider.dart';

class RecycleableModel extends Model {

  List<Recycleable> _recycleables;

  RecycleableModel() : _recycleables = LocalRecycleableProvider.recycleables;

  void load() {
  }

  List<Recycleable> get popularRecycleables => List<Recycleable>.from(_recycleables);

  List<Recycleable> searchRecycleables(String terms) {
    if (terms.isEmpty) {
      return [];
    } 
    return _recycleables
    .where((v) => v.name.toString().toLowerCase().contains(terms.toLowerCase()))
    .toList();
  } 

  Recycleable getRecycleable(int id) => _recycleables.singleWhere((v) => v.id == id);

}