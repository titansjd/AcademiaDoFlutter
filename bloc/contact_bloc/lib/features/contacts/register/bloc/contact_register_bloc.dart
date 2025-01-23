import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:contact_bloc/models/contact_model.dart';
import 'package:contact_bloc/repositories/contacts_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';

part 'contact_register_state.dart';
part 'contact_register_event.dart';
part 'contact_register_bloc.freezed.dart';

class ContactRegisterBloc
    extends Bloc<ContactRegisterEvent, ContactRegisterState> {
  final ContactsRepository _contactsRepository;

  ContactRegisterBloc({required ContactsRepository contactsRepository})
      : _contactsRepository = contactsRepository,
        super(const ContactRegisterState.initial()) {
    on<_Save>(_save);
  }

  FutureOr<void> _save(_Save event, Emitter<ContactRegisterState> emit) async {
    try {
      emit(const ContactRegisterState.loading());

      final uuid = Uuid();

      final contactModel = ContactModel(
        id: uuid.v1(), // chave unica baseado no timestamp
        name: event.name,
        email: event.email,
      );

      await _contactsRepository.create(contactModel);

      emit(const ContactRegisterState.sucess());
    } on Exception catch (e, s) {
      log('Erro ao salvar contato', error: e, stackTrace: s);
      emit(const ContactRegisterState.error(
          message: 'Erro ao salvar um novo contato'));
    }
  }
}
