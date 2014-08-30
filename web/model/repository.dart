part of dgs.models;

class Repository extends SetMixin<Project> {
  final UserStorage _localStorage;
  final Map<String,Project> _projects = new Map<String,Project>();
  final Map<String,StreamSubscription> _projectSubscriptions = 
      new Map<String,StreamSubscription>();
  Repository([UserStorage localStorage = null]):
    _localStorage = (localStorage==null)?new UserStorage.html():localStorage;
  
  Project operator[](String id) {
    if (_projects.containsKey(id))
      return _projects[id];
    final Project project = _projects[id] = new Project(id);
    project.initFromJSON(_localStorage[id]);
    _projectSubscriptions[id] = project.onProjectModified.listen((_) {
      _localStorage[project.id] = project.toJSON();
    });
    return project;
  }
  
  @override
  void clear() {
    _localStorage.clear();
    _projects.clear();
    for (StreamSubscription sub in _projectSubscriptions)
      sub.cancel();
    _projectSubscriptions.clear();
  }

  @override
  bool add(final Project project) {
    final oldProject = _projects[project.id];
    if (oldProject != null && oldProject != project) {
      _projectSubscriptions[project.id].cancel();
    }
    _projects[project.id] = project;
    _projectSubscriptions[project.id] = project.onProjectModified.listen((_) {
      _localStorage[project.id] = project.toJSON();
    });
    _localStorage[project.id] = project.toJSON();
  }

  @override
  bool contains(Project element) =>
    _localStorage.containsKey(element.id);

  @override
  Iterator<Project> get iterator => 
      _localStorage.keys.map((key) => this[key]).iterator;

  @override
  int get length => _localStorage.length;

  @override
  Project lookup(Project element) => this[element.id];

  @override
  bool remove(Project element) {
    _projects.remove(element.id);
    if (_projectSubscriptions.containsKey(element.id))
      _projectSubscriptions[element.id].cancel();
    _projectSubscriptions.remove(element.id);
    if (_localStorage.containsKey(element.id)) {
      _localStorage.remove(element.id);
      return true;
    }
    return false;
  }

  @override
  Set<Project> toSet() => this;
}
abstract class UserStorage implements Map<String,Map> {
  UserStorage._();
  factory UserStorage.html([html.Storage storage = null]) =>
      new HtmlUserStorage(storage);
}
class HtmlUserStorage extends UserStorage with DelegatingMap<String,Map> {
  final MapFunctor<String,String,Map> _delegate;
  HtmlUserStorage([html.Storage storage = null]) : 
    super._(),
    _delegate = new MapFunctor<String,String,Map>(
        (storage==null)?html.window.sessionStorage:storage,
        toFunc: (source) => JSON.decode(source),
        fromFunc: (value) => JSON.encode(value));
  Map<String,Map> get delegate => _delegate;
}

typedef V2 ToFunc<V1,V2>(V1);
typedef V1 FromFunc<V1,V2>(V2);
class MapFunctor<K,V1,V2> extends MapMixin<K,V2> {
  final Map<K,V1> _map;
  final ToFunc<V1,V2> _toFunc;
  final FromFunc<V1,V2> _fromFunc;
  MapFunctor(Map<K,V1> this._map, 
      {ToFunc<V1,V2> toFunc, FromFunc<V1,V2> fromFunc}) :
      _toFunc = toFunc,
      _fromFunc = fromFunc;

  @override
  V2 operator [](Object key) => _toFunc(_map[key]);
  
  @override
  void operator []=(K key, V2 value) {
    _map[key] = _fromFunc(value);
  }
  
  @override
  void clear() => _map.clear();

  @override
  V2 remove(Object key) {
    V1 val = _map.remove(key);
    return (val == null)?null:_toFunc(val);
  }

  @override
  Iterable<K> get keys => _map.keys;
}