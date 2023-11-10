import 'package:connect/cubit/internet_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends StatelessWidget {
  const HomeCubit({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('Check Internet Connectivity'),
        centerTitle: true,
      ),
      body:Container(
        child: Center(
          child: BlocConsumer<InternetCubit,InternetState>(
            listener: (context,state){
              if(state == InternetState.Back)
              {
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Center(child: Text('Internet is Back!')),
                      backgroundColor: Colors.green,)
                );
              }
              else if(state == InternetState.Lost)
              {
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Center(child: Text('Lost Internet!')),
                      backgroundColor: Colors.red,)
                );
              }
            },
            builder: (context,state){
              if(state == InternetState.Back)
              {
                return Text('Connected!');
              }
              else if(state == InternetState.Lost)
              {
                return Text('Disconnected!');
              }
              else
              {
                return Text('Loading');
              }

            },
          ),
        )
        ,
      ),
    );
  }
}

// Here we are using == since we are actually comparing with the values of InternetState