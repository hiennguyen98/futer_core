
import 'package:Futer/blocs/base_bloc.dart';
import 'package:Futer/blocs/page_cubit.dart';
import 'package:Futer/blocs/views/base_view.dart';
import 'package:Futer/common/app_colors.dart';
import 'package:Futer/utils/core_util.dart';
import 'package:Futer/utils/fontsize_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class PageState<PageBloc extends BaseBloc, StateWidget extends StatefulWidget>
    extends State<StateWidget> with AutomaticKeepAliveClientMixin implements BaseView {
  PageState(PageBloc pageBloc) : assert (pageBloc !=null){
    _bloc = pageBloc;
  }

  PageBloc _bloc; // bloc for this state

  /// REQUIRE
  Widget get content;

  ///[START] OPTIONAL
  bool get isShowLoading => true;
  bool get isShowErrorNotification => true;
  PreferredSizeWidget get appBar => null;
  Color get backgroundColor => null;
  bool get resizeToAvoidBottomInset => true ; // the scaffold's floating widgets should resize to avoid overflow keyboard


  void onPostFrame() {}

  void _setView<View extends BaseView>(View view) {
    _bloc.view = view;
  }
  ///[END] OPTIONAL
  ///
  PageBloc get bloc => _bloc;

  @override
  void dismiss() {
    _bloc.pageCubit.dismiss();
  }

  @override
  void showLoading({String message}) {
    _bloc.pageCubit.showLoading(message: message);
  }

  @override
  void showError({String message}) {
    _bloc.pageCubit.showError(message: message);
  }

  @override
  void unFocus() {
    FocusScope.of(context).requestFocus(new FocusNode());
  }

  @override
  bool get wantKeepAlive => false;

  @override
  void initState() {

    bloc.context = context;
    _setView<BaseView>(this);
    SchedulerBinding.instance.addPostFrameCallback((Duration duration) {
      onPostFrame();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return MultiBlocProvider(
        providers: [
          BlocProvider<BaseCubit>.value(value: _bloc.pageCubit),
          BlocProvider<PageBloc>.value(value: _bloc),
        ],
        child: Container()
    );
  }

}

class PageWidget extends StatelessWidget {

  PageWidget(
      this._body,
      this._onErrorTap,
      this.backgroundColor,
      {this.appBar,
        this.enableLoading,
        this.enableErrorNotification,
        this.resizeToAvoidBottomInset});

  final Widget _body;
  final VoidCallback _onErrorTap;

  final backgroundColor;
  final PreferredSizeWidget appBar;
  final bool enableLoading;
  final bool enableErrorNotification;
  final bool resizeToAvoidBottomInset;

  Widget _buildTextTitle(String title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: FontSizeApp.SIZE_18,
      ),
    );
  }

  Widget _buildLoadingWidget(String message) {
    return Container(
      child: Center(
        child: Wrap(
          children: [
            Container(
              decoration: BoxDecoration(
                color: AppColors.electron_blue.withOpacity(0.5),
                borderRadius: BorderRadius.all(
                  Radius.circular(FontSizeApp.SIZE_16)
                )
              ),
              padding: EdgeInsets.all(FontSizeApp.SIZE_16),
              child: Column(
                children: [
                  CircularProgressIndicator(),
                  SizedBox(
                    height: CoreUtils.isNullOrEmpty(message) ? 0.0 : FontSizeApp.SIZE_8,
                  ),
                  message != null ? Text(message) : SizedBox()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _errorWidget (String error, {BuildContext context}) {
    return Container(
      child: Center(
        child: Wrap(
          children: [
            Container(
              constraints: BoxConstraints(
                maxWidth: FontSizeApp.SIZE_20*FontSizeApp.SIZE_15,
              ),
              padding: EdgeInsets.symmetric(vertical: FontSizeApp.SIZE_8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(FontSizeApp.SIZE_15),
                color: AppColors.electron_blue
              ),
              child: Column(
                children: [
                  _buildTextTitle('Thông báo'),
                  SizedBox(height: FontSizeApp.SIZE_12,),
                  Text(error ?? ''),
                  SizedBox(height: FontSizeApp.SIZE_8/2,),
                  Divider(),
                  SizedBox(height: FontSizeApp.SIZE_8/2,),
                  InkWell(
                    onTap: _onErrorTap,
                    child: Container(
                      width: double.infinity,
                      alignment: Alignment.center,
                      child: _buildTextTitle('OK'.toUpperCase()),
                    ),
                  ),
                  SizedBox(height: FontSizeApp.SIZE_8/2,),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _handle(BaseState state, {BuildContext context}) {
    switch(state.action) {
      case PageAction.error:
        return Container(
          color: AppColors.electron_blue.withOpacity(0.5),
          child: _errorWidget(state.message, context: context),
        );
      case PageAction.loading:
        return Container(
          color: AppColors.electron_blue.withOpacity(0.5),
          child: _buildLoadingWidget(state.message),
        );
      default:
        return SizedBox();
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      resizeToAvoidBottomInset: this.resizeToAvoidBottomInset,
      appBar: appBar,
      body: Stack(
        children: [
          _body,
          BlocBuilder<BaseCubit, BaseState>(
              builder: (_, state) => _handle(state, context: context),
          )
        ],
      ),
    );
  }

}
