part of dgs.models;

class Repository {
  final UserStorage _localStorage;
  Repository(UserStorage this._localStorage);
  Future<Project> getProject(String id) {
    _localStorage[id].then((m) {
      var project = new Project(id);
      project.initFromJSON(m);
      return project;
    });
  }
  Future saveProject(Project data) {
    toJSON()
  }
}

/***
 * An [UserStorage] is just like a map, except that all objects are futures to 
 * it to work more quickly with Chrome APIs.
 */

abstract class UserStorage {
  Future<bool> containsValue(Object value);
  Future<bool> containsKey(String key);
  Future<dynamic> operator [](String key);
  void operator []=(String key, dynamic value) {
    put(key, value);
  }
  Future put(String key, dynamic value);
  Future<dynamic> putIfAbsent(String key, Object ifAbsent());
  Future addAll(Map<String, Object> other);
  Future<dynamic> remove(String key);
  Future clear();
  Future forEach(void f(String key, dynamic value));
  Stream<String> get keys;
  Stream<dynamic> get values;
  Future<int> get length;
  Future<bool> get isEmpty;
  Future<bool> get isNotEmpty;
  factory UserStorage.fromMap(Map map) => new _AsyncMap.fromMap(map);
  UserStorage._();
}
class MapPerturbation<K,V1,V2> implements Map<K,V2> {
  Map<K,V2> mapValues (Map<K,V1> map, {V2 toFunc(V1), V1 fromFunc(V2)}) {
}