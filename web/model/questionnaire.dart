part of dgs.models;

class Questionnaire {
  static Map<String,Questionnaire> _loadedQuestionnaires;
  static Map<String,Questionnaire> get loadedQuestionnaires {
    if (_loadedQuestionnaires == null)
      _loadedQuestionnaires = new Map<String,Questionnaire>();
    return _loadedQuestionnaires;
  }
  
  final String id;
  Questionnaire (String this.id) {
    loadedQuestionnaires[id] = this;
  }
  Category inspects;
  List<QuestionnaireQuestion> questions;
}

class QuestionnaireQuestion {
  final String id;
  QuestionnaireQuestion (String this.id);
  
  int weight;
  String text;
  
}

class LogicalExpression {
  const LogicalExpression();
}

class LogicalResult extends LogicalExpression {
  final int code;
  final String text;
  const LogicalResult(int this.code, String this.text);
  
  bool operator ==(LogicalResult other) => other.code == this.code;
  int get hashCode => code;

  static const LogicalResult Y = const LogicalResult(0,'Y');
  static const LogicalResult N = const LogicalResult(1,'N');
  static const LogicalResult NA = const LogicalResult(2,'NA');
}

