part of dgs.models;

class Project extends Observable {
  final String id;
  
  @observable String name;
  @observable String resdNumber;
  @observable String jobNumber;
  @observable String surveyorName;
  @observable String initials;
  
  Project(String this.id);
  
  void initFromJSON(Map values) {
    name = values['name'];
    resdNumber = values['resdNumber'];
    jobNumber = values['jobNumber'];
    surveyorName = values['surveyorName'];
    initials = values['initials'];
  }
  Map toJSON() => {
    'name':name,
    'resdNumber':resdNumber,
    'jobNumber':jobNumber,
    'surveyorName':surveyorName,
    'initials':initials
  };
  
}