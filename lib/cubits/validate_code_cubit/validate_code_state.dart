part of 'validate_code_cubit.dart';

@immutable
abstract class ValidateCodeState {}

class ValidateCodeInitial extends ValidateCodeState {}

class ValidateCodeURL extends ValidateCodeState {
  final Barcode barcode;
  ValidateCodeURL({required this.barcode});
}
