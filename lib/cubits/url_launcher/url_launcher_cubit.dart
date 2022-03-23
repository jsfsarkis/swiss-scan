import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:url_launcher/url_launcher.dart';

part 'url_launcher_state.dart';

class UrlLauncherCubit extends Cubit<UrlLauncherState> {
  UrlLauncherCubit() : super(UrlLauncherInitial());

  Future<void> launchURL(String url) async {
    await canLaunch(url) ? launch(url) : emit(UrlLauncherError());
  }
}
