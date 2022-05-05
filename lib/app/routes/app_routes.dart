// ignore_for_file: constant_identifier_names

part of 'app_pages.dart';

abstract class Routes {
  static const HOME = _Paths.HOME;
  static const NEWS_VIEW = _Paths.NEWS_VIEW;
}

abstract class _Paths {
  static const HOME = '/home';
  static const NEWS_VIEW = '/news-view';
}
