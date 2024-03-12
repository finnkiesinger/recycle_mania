import '../../data/facilities.dart';
import '../facility/processing_facility.dart';
import 'storage_manager.dart';

class ProcessingFacilityStorage extends StorageManager<ProcessingFacility> {
  @override
  Map<String, dynamic> toJSON(ProcessingFacility facility) {
    return {
      "type": facility.storageType,
      "data": {
        "cooldown": facility.cooldown,
        "time": facility.time,
        "cost": facility.cost,
        "name": facility.name,
        "input": facility.input
            .map(
              (e) => {
                "item": e.item.name,
                "amount": e.amount,
              },
            )
            .toList(),
        "output": facility.output
            .map(
              (e) => {
                "item": e.item.name,
                "amount": e.amount,
              },
            )
            .toList(),
      },
    };
  }

  @override
  ProcessingFacility? fromJSON(Map<String, dynamic> json) {
    var type = json["type"];
    ProcessingFacility? facility;

    for (var element in Facilities.all.whereType<ProcessingFacility>()) {
      if (type == element.storageType) {
        facility = element.create() as ProcessingFacility;
        break;
      }
    }

    return facility;
  }
}
