
import 'dart:async';

import 'package:connect/blocs/internet_bloc/internet_event.dart';
import 'package:connect/blocs/internet_bloc/internet_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class InternetBloc extends Bloc<InternetEvent,InternetState>{

  Connectivity connectivity= Connectivity();
  StreamSubscription? connectivitySubscription;

 InternetBloc():super(InternetInitialState()){
   on<InternetLostEvent>((event,emit) => emit(InternetLostState()));
   on<InternetBackEvent>((event,emit) => emit(InternetBackState()));

   connectivitySubscription=connectivity.onConnectivityChanged.listen((result) {
      if(result==ConnectivityResult.mobile || result==ConnectivityResult.wifi)
        {
          add(InternetBackEvent());         // IF any of above is true add this event
        }
      else
        {
          add(InternetLostEvent());
        }
   });
 }
  @override
  Future<void> close() {
    // TODO: implement close
    connectivitySubscription?.cancel();  // Cancel when this class is closed  also '?' to ensure that if it is not null then close it
    return super.close();
  }

}
// *******
// A bloc is also closed when that particular page where bloc is being used is closed
// But the .listen() would still keep on working even when that page is closed

// Hence to close that we have closed it in future