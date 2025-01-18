import 'package:cred_assignment/utils/logging_utils.dart';
import 'package:dio/dio.dart';
import '../constants/api_constant.dart';
import '../models/stack_item_model.dart';

class ApiService {
  final Dio _dio;

  ApiService(DioClient dioClient) : _dio = dioClient.dio;

  Future<List<StackItemModel>> fetchStackData() async {
    try {
      final response = await _dio.get('/p6764/test_mint');

      if (response.statusCode == 200 && response.data['items'] is List) {
        return (response.data['items'] as List)
            .map((item) => StackItemModel.fromJson(item))
            .toList();
      } else {
        throw Exception('Unexpected API response: ${response.data}');
      }
    } on DioException catch (e) {
      if (e.response != null) {
        printInD(
            'Server error: ${e.response?.statusCode} - ${e.response?.data}');
      } else {
        printInD('Request error: ${e.message}');
      }
      throw Exception('Failed to fetch stack data: ${e.message}');
    } catch (e) {
      printInD('Error: $e');
      throw Exception('An unknown error occurred');
    }
  }
}
