import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../model/image_model.dart';
import '../services/repository/walpaper_repogetory.dart';

part 'walpaper_event.dart';
part 'walpaper_state.dart';

class WalpaperBloc extends Bloc<WalpaperEvent, WalpaperState> {
  WalpaperBloc() : super(WalpaperInitial()) {
    on<getWallpaper>((event, emit) async{
      // TODO: implement event handler
      emit(Walloading());
      var search = event.search;
      WalpaperModel wal =await WallpaperRepository().getWalpImage(search);
      emit(Walloaded(wal));
      Walerror("Something went wrong");
    });
  }
}
