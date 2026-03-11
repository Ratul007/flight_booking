import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../core/constants/constants.dart';

class ApiRequest {
  final String url;
  final Map<String, dynamic>? data;
  final dynamic frmData;
  final dynamic frmData1;

  ApiRequest({
    required this.url,
    this.data,
    this.frmData,
    this.frmData1,

  });

  Dio _dio() {
    // Put your authorization token if required

    return Dio(
      BaseOptions(
        headers: {
          // 'Authorization': 'Bearer ${Constant.adminToken}', //$adminToken',
          "Accept": "application/json",
          "Content-Type": "application/json"
        },
        baseUrl: Constant.baseUrl,
      ),
    );
  }
  Future<Dio> _dioToken() async {
    // Put your authorization token if required
    final SharedPreferences tokenPrefs = await SharedPreferences.getInstance();
    final String? token = tokenPrefs.getString('auth_token');
    print(token);
    return Dio(

      BaseOptions(
        headers: {

          'Authorization': 'Bearer $token', //$adminToken',
          "Accept": "application/json",
          "Content-Type": "application/json"
        },
        baseUrl: Constant.baseUrl,
      ),
    );
  } Future<Dio> _dioTokenFile() async {
    final SharedPreferences tokenPrefs = await SharedPreferences.getInstance();
    final String? token = tokenPrefs.getString('driverToken');
    print(token);
    return Dio(

      BaseOptions(
        headers: {
          'Authorization': 'Bearer $token', //$adminToken',
          "Accept": "application/json",
          "Content-Type": "multipart/form-data"
        },
        baseUrl: Constant.baseUrl,
      ),
    );
  }

  Future<void> get({
    required Function() beforeSend,
    required Function(dynamic data) onSuccess,
    required Function(dynamic error) onError,
  }) async {

    await _dio().get(url, queryParameters: data).then((res) {
      onSuccess(res.data);

    }).catchError((error) {
      onError(error);

    });
  }

  Future<void> post({
    required Function() beforeSend,
    required Function(dynamic frmData) onSuccess,
    required Function(dynamic error) onError,
  }) async {

    _dio().post(url, data: frmData).then((res) {
      onSuccess(res);
    }).catchError((error) {

      onError(error);
    });
  }

  Future<void> getToken({
    required Function() beforeSend,
    required Function(dynamic data) onSuccess,
    required Function(dynamic error) onError,
  }) async {
    // Await the Dio instance with the token
    Dio dioWithToken = await _dioToken();

    await dioWithToken.get(url, queryParameters: data).then((res) {
      onSuccess(res.data);
    }).catchError((error) {
      onError(error);
    });
  }

  Future<void> postToken({
    required Function() beforeSend,
    required Function(dynamic frmData) onSuccess,
    required Function(dynamic error) onError,
  }) async {
    print(url);
    print(frmData);

    // Await the Dio instance with the token
    Dio dioWithToken = await _dioToken();

    dioWithToken.post(url, data: frmData).then((res) {
      onSuccess(res);
    }).catchError((error) {
      onError(error);
    });
  }

  Future<void> putToken({
    required Function() beforeSend,
    required Function(dynamic frmData) onSuccess,
    required Function(dynamic error) onError,
  }) async {
    print(url);
    print(frmData);

    // Await the Dio instance with the token
    Dio dioWithToken = await _dioToken();

    dioWithToken.put(url, data: frmData).then((res) {
      onSuccess(res);
    }).catchError((error) {
      onError(error);
    });
  }


  Future<void> request({
    required Function() beforeSend,
    required Function(dynamic frmData1) onSuccess,
    required Function(dynamic error) onError,
  }) async {
    print(frmData1);
    print("here");
    print(url);
    _dio().request(url, data: frmData1).then((res) {
      print("response");
      print(res);
      onSuccess(res);

    }).catchError((error) {
      onError(error);
      print("error");
      print(error);
    });
  }
}