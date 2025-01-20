import 'package:cred_assignment/models/stack_item_model.dart';
import 'package:cred_assignment/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class StackController extends ChangeNotifier {
  final ApiService _apiService;

  StackController(this._apiService) {
    fetchStackData();
  }

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  double _sliderInitialValue = 150000.0;
  double get sliderInitialValue => _sliderInitialValue;

  void setSliderValue(double value) {
    _sliderInitialValue = value;
    notifyListeners();
  }

  List<StackItemModel> _stackItems = [];
  List<StackItemModel> get stackItems => _stackItems;

  set stackItems(List<StackItemModel> value) {
    _stackItems = value;
    notifyListeners();
  }

  bool _isStack2Opened = false;
  bool get isStack2Opened => _isStack2Opened;

  void toggleStack2Open(bool value) {
    _isStack2Opened = value;
    notifyListeners();
  }

  bool _isStack3Opened = false;
  bool get isStack3Opened => _isStack3Opened;

  void toggleStack3Open(bool value) {
    _isStack3Opened = value;
    notifyListeners();
  }

  int _selectedPlan = 0;
  int get selectedPlan => _selectedPlan;

  void setSelectedPlan(int value) {
    _selectedPlan = value;
    notifyListeners();
  }

  Future<void> fetchStackData() async {
    isLoading = true;
    Fluttertoast.showToast(
      msg: "The app is loading",
      backgroundColor: Colors.deepPurple,
      timeInSecForIosWeb: 2,
    );
    try {
      final response = await _apiService.fetchStackData();
      stackItems = response;
    } on Exception {
      // Handle any errors
    } finally {
      isLoading = false;
    }
  }
}
