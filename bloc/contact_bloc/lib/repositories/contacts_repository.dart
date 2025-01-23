import 'package:contact_bloc/models/contact_model.dart';
import 'package:dio/dio.dart';

class ContactsRepository {
  Future<List<ContactModel>> findAll() async {
    final response = await Dio().get('http://10.0.2.2:3031/contacts');

    return response.data
        ?.map<ContactModel>((contact) => ContactModel.fromMap(contact))
        .toList();
  }

  Future<void> create(ContactModel model) async {
    final dio = Dio();
    final data = model.toMap();

    try {
      final respose = await dio.post(
        'http://10.0.2.2:3031/contacts',
        data: data,
      );

      print('contato criado com sucesso');
    } on DioError catch (e) {
      if (e.response != null) {
        print('Erro HTTP: ${e.response?.statusCode}');
      } else {
        print('Erro de conexao: ${e.message}');
      }
    }
  }

  Future<void> update(ContactModel model) async {
    Dio().put('http://10.0.2.2:3031/contacts/${model.id}', data: model.toMap());
  }

  Future<void> delete(ContactModel model) async {
    Dio().delete('http://10.0.2.2:3031/contacts/${model.id}');
  }
}
