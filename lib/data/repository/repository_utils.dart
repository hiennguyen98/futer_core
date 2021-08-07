
import 'package:Futer/utils/core_util.dart';

class RepositoryUtils {

  getSizeParam({String size}) {
    String s = size ?? '10';
    return '?size=$s';
  }

  getPageParam ({int page =0}) {
    return page != null ? '&page=$page' : '';
  }
}