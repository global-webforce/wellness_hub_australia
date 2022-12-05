import 'package:wellness_hub_australia/app/models/field.model.dart';

abstract class FieldsService {
  List<Field> get fields;
  Future getAll();
}
