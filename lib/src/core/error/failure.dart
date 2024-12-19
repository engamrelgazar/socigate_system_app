import 'package:equatable/equatable.dart';
import 'error_message_model.dart';

abstract class Failure extends Equatable {
  @override
  List<Object?> get props => [];
}

class ServerFailure extends Failure {
  final ErrorMessageModel errorMessageModel;

  ServerFailure({required this.errorMessageModel});

  @override
  List<Object?> get props => [errorMessageModel];
}

class GeneralFailure extends Failure {
  final String message;

  GeneralFailure({required this.message});

  @override
  List<Object?> get props => [message];
}
