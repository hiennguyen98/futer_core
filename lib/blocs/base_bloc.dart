import 'package:Futer/blocs/page_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class BaseBloc<Event, State, View> extends Bloc<Event, State> {
  BaseBloc(State initState) : super(initState){
    _pageCubit = BaseCubit();
  }

  BuildContext context;
  BaseCubit _pageCubit;
  View view;

  BaseCubit get pageCubit => _pageCubit;

}