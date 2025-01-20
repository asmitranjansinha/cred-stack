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

  List<StackItemModel> _stackItems = [];
  List<StackItemModel> get stackItems => _stackItems;

  set stackItems(List<StackItemModel> value) {
    _stackItems = value;
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
