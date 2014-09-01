part of dgs.models;

class Project extends ChangeNotifier {
  final String id;
  final StreamController<ProjectModEvent> _projectModified = 
      new StreamController<ProjectModEvent>();
  
  String _name;
  String get name => _name;
  void set name (String value) {
    _name = notifyPropertyChange(#name, _name, value);
  }
  String _resdNumber;
  String get resdNumber => _resdNumber;
  void set resdNumber (String value) {
    _resdNumber = notifyPropertyChange(#resdNumber, _resdNumber, value);
  }
  String _jobNumber;
  String get jobNumber => _jobNumber;
  void set jobNumber (String value) {
    _jobNumber = notifyPropertyChange(#jobNumber, _jobNumber, value);
  }
  String _surveyorName;
  String get surveyorName => _surveyorName;
  void set surveyorName (String value) {
    _surveyorName = notifyPropertyChange(#surveyorName, _surveyorName, value);
  }
  String _initials;
  String get initials => _initials;
  void set initials (String value) {
    _initials = notifyPropertyChange(#initials, _initials, value);
  }
  
  Project(String this.id);
  
  void initFromJSON(Map values) {
    _name = values['name'];
    _resdNumber = values['resdNumber'];
    _jobNumber = values['jobNumber'];
    _surveyorName = values['surveyorName'];
    _initials = values['initials'];
  }
  Map toJSON() => {
    'name':_name,
    'resdNumber':_resdNumber,
    'jobNumber':_jobNumber,
    'surveyorName':_surveyorName,
    'initials':_initials
  };
  
}
class ProjectModEvent {
  const ProjectModEvent();
}