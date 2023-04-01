part of 'contact_bloc.dart';

abstract class ContactState extends Equatable {
  const ContactState();

  @override
  List<Object> get props => [];
}

class ContactInitial extends ContactState {}

class ContactLoading extends ContactState {}

class ContactSuccess extends ContactState {
  final List<ContactModel> data;
  final String message;

  const ContactSuccess(this.data, this.message);

  @override
  List<Object> get props => [data, message];
}

class ContactSError extends ContactState {
  final String error;

  const ContactSError(this.error);

  @override
  List<Object> get props => [error];
}
