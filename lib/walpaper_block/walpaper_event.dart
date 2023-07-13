part of 'walpaper_bloc.dart';

@immutable
abstract class WalpaperEvent {}
class getWallpaper extends WalpaperEvent{
  String search;
  getWallpaper(this.search);
}