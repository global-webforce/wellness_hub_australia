import 'package:wellness_hub_australia/app/models/custom_link.model.dart';

abstract class CustomLinkService {
  Stream<int> get dataStream;
  List<CustomLink> get customLinks;

  Future<void> getAll();
}
