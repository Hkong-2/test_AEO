import 'package:boilerplate/domain/entity/project/project_response.dart';

abstract class ProjectRepository {
  Future<List<ProjectResponse>> getProjects();
}
