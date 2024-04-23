// Definición de la interfaz objetivo que la aplicación cliente espera usar.
abstract class RestfulService {
  void getBookInfo(String isbn);
}

// Implementación concreta de la interfaz adaptable que el sistema antiguo proporciona.
class ComService {
  String fetchBookData(String isbn) {
    return 'Datos del libro para $isbn';
  }
}

// Implementación del adaptador que convierte llamadas RESTful a llamadas COM.
class ComToRestAdapter implements RestfulService {
  final ComService _comService;

  ComToRestAdapter(this._comService);

  @override
  void getBookInfo(String isbn) {
    var data = _comService.fetchBookData(isbn);
    print('Adaptando datos de COM a RESTful: $data');
  }
}

// Cliente que utiliza la interfaz RestfulService.
class LibraryApp {
  final RestfulService _service;

  LibraryApp(this._service);

  void displayBook(String isbn) {
    _service.getBookInfo(isbn);
  }
}

void main() {
  var comService = ComService();
  var adapter = ComToRestAdapter(comService);
  var libraryApp = LibraryApp(adapter);
  libraryApp.displayBook('1234567890');
}
