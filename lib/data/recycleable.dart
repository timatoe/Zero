import 'package:zero/data/preparation_step.dart';

class Recycleable {
  Recycleable({
    this.id,
    this.name,
    this.preparationSteps
  });

  final int id;
  final String name;
  final List<PreparationStep> preparationSteps; 
}