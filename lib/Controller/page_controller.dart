import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../models/records_model.dart';

class Controller extends GetxController {
  var currentTab = 0.obs;
  void changeTab(int tabIndex) {
    currentTab.value = tabIndex;
  }
}

class RecordController extends GetxController {
  var _records = <Records>[].obs;

  List<Records> get records => _records;

  @override
  void onInit() {
    _loadDataFromStorage();
    super.onInit();
  }

  void saveData() {
    final storage = GetStorage();
    final List data = _records.map((record) => record.toJson()).toList();
    storage.write('records', data);
  }

  void _loadDataFromStorage() {
    final storage = GetStorage();
    final data = storage.read<List>('records');
    if (data != null) {
      _records.value = data.map((json) => Records.fromJson(json)).toList().obs;
    }
  }

  void addRecords(DateTime date, var weight, String note) {
    _records.add(
      Records(
        date: date,
        weight: weight,
        photoUrl: "none",
        note: note,
      ),
    );
    saveData();
  }

  void deleteRecords(Records element) {
    _records.remove(element);
    saveData();
  }
}

class DateController extends GetxController {
  DateTime date = DateTime.now();

  void pickDate(newDate) {
    date = newDate;
    update();
  }
}

class WeightController extends GetxController {
  var selectedWeight = 60.obs;
  void changeWeight(int newWeight) {
    selectedWeight.value = newWeight;
  }
}
