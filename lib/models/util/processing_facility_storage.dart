import '../facility/processing_facility.dart';

class ProcessingFacilityStorage {
  Map<String, dynamic> toJSON(ProcessingFacility facility) {
    return {
      "type": facility.storageType,
      "data": {},
    };
  }
}
