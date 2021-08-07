
import 'package:flutter_bloc/flutter_bloc.dart';

enum PageAction{
  none,
  loading,
  error
}

class BaseState {
  BaseState({this.action, this.message}) :assert (action != null);
  final PageAction action;
  final String message;
}

class BaseCubit extends Cubit<BaseState> {
  BaseCubit() : super(BaseState());

  void dismiss() => emit(BaseState());
  void showLoading({String message}) => emit(BaseState(action: PageAction.loading, message: message));
  void showError({String message}) => emit(BaseState(action: PageAction.error, message: message));
}