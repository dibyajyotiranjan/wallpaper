part of 'walpaper_bloc.dart';

@immutable
abstract class WalpaperState {}

class WalpaperInitial extends WalpaperState {}
class Walloading extends WalpaperState {}
class Walloaded extends WalpaperState {
  WalpaperModel walpaperlist;
  Walloaded(this.walpaperlist);

}
class Walerror extends WalpaperState {
  String error;
  Walerror(this.error);
}