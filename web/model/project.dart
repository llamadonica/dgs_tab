part of dgs.models;

class Project {
  final String id;
  final StreamController<ProjectModEvent> _projectModified = 
      new StreamController<ProjectModEvent>();
  
  String name;
  String resdNumber;
  
  Stream<ProjectModEvent> get onProjectModified => _projectModified.stream;
  
  Project(String this.id);
  
  void initFromJSON(Map values) {
  }
  Map toJSON() => {};
  
}
class ProjectModEvent {
  const ProjectModEvent();
}