import 'package:boilerplate/core/data/network/dio/dio_client.dart';
import 'package:boilerplate/data/network/constants/endpoints.dart';
import 'package:boilerplate/domain/entity/project/project_response.dart';

class ProjectApi {
  final DioClient _dioClient;

  ProjectApi(this._dioClient);

  Future<List<ProjectResponse>> getProjects() async {
    try {
      final res = await _dioClient.dio.get(Endpoints.getProjects);
      final List<dynamic> data = res.data;
      return data.map((e) => ProjectResponse.fromJson(e)).toList();
    } catch (e) {
      rethrow;
    }
  }
}
