import 'package:boilerplate/data/network/apis/project/project_api.dart';
import 'package:boilerplate/domain/entity/project/project_response.dart';
import 'package:boilerplate/domain/repository/project/project_repository.dart';

class ProjectRepositoryImpl extends ProjectRepository {
  final ProjectApi _projectApi;

  ProjectRepositoryImpl(this._projectApi);

  @override
  Future<List<ProjectResponse>> getProjects() async {
    return await _projectApi.getProjects();
  }
}
