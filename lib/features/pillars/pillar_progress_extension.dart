import 'package:wellness_hub_australia/models/pillar_progress.model.dart';

extension PillarHelper on PillarProgress {
  //returns rounded e.g 93%, 22%
  int progress() {
    try {
      int progress = 0;
      progress = ((completed! / total!.toDouble()) * 100).round();

      progress = progress <= 100 ? progress : 100;
      return progress;
    } catch (e) {
      return 0;
    }
  }
}
