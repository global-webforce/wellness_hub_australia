import 'package:wellness_hub_australia/models/field.model.dart';

abstract class FieldsService {
  List<Field> get fields;
  Future getAll();
}
