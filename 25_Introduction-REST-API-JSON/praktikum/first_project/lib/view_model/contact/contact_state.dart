part of 'contact_cubit.dart';

abstract class ContactState extends Equatable {
  const ContactState();

  @override
  List<Object> get props => [];
}

class ContactInitial extends ContactState {}

class ContactLoading extends ContactState {}

class ContactSuccess extends ContactState {
  final List<ContactModel> data;

  const ContactSuccess(this.data);

  @override
  List<Object> get props => [data];
}

class ContactSError extends ContactState {
  final String error;

  const ContactSError(this.error);

  @override
  List<Object> get props => [error];
}
