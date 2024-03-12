import '../facility/processing_facility.dart';
import 'storage_manager.dart';

class ProductionFacilityStorage extends StorageManager<ProcessingFacility> {
  @override
  ProcessingFacility? fromJSON(Map<String, dynamic> json) {
    // TODO: implement fromJSON
    throw UnimplementedError();
  }

  @override
  Map<String, dynamic> toJSON(ProcessingFacility storable) {
    // TODO: implement toJSON
    throw UnimplementedError();
  }
}
