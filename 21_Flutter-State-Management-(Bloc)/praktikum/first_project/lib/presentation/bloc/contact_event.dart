part of 'contact_bloc.dart';

abstract class ContactEvent extends Equatable {
  const ContactEvent();

  @override
  List<Object> get props => [];
}

class AddContact extends ContactEvent {
  final ContactModel contact;

  const AddContact(this.contact);

  @override
  List<Object> get props => [contact];
}

class UpdateContact extends ContactEvent {
  final ContactModel contact;

  const UpdateContact(this.contact);

  @override
  List<Object> get props => [contact];
}

class DeleteContact extends ContactEvent {
  final String id;

  const DeleteContact(this.id);

  @override
  List<Object> get props => [id];
}
