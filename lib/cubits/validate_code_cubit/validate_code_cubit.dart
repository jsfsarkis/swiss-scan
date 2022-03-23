import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

part 'validate_code_state.dart';

class ValidateCodeCubit extends Cubit<ValidateCodeState> {
  ValidateCodeCubit() : super(ValidateCodeInitial());

  void validateCode(Barcode barcode) {
    bool isValidURL = Uri.parse(barcode.code!).isAbsolute;

    if (isValidURL) {
      emit(ValidateCodeURL(barcode: barcode));
    }
  }
}
