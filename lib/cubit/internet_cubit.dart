import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum InternetState {Initial , Back ,Lost}

class InternetCubit extends Cubit<InternetState>{
  StreamSubscription? connectivitSubscription ;
  Connectivity connectivity= Connectivity();

  InternetCubit():super(InternetState.Initial)
  {
    connectivitSubscription= connectivity.onConnectivityChanged.listen((result) {
      if(result==ConnectivityResult.mobile || result==ConnectivityResult.wifi)
        {
          emit(InternetState.Back);
        }
      else
        {
          emit(InternetState.Lost);
        }
    });
  }
  @override
  Future<void> close() {
    // TODO: implement close
    connectivitSubscription?.cancel();
    return super.close();
  }
}