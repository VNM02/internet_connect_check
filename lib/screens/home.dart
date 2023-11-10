import 'package:connect/blocs/internet_bloc/internet_bloc.dart';
import 'package:connect/blocs/internet_bloc/internet_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('Check Internet Connectivity'),
        centerTitle: true,
      ),
      body:Container(
            child: Center(
              child: BlocConsumer<InternetBloc,InternetState>(
                listener: (context,state){
                  if(state is InternetBackState)
                    {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Center(child: Text('Internet is Back!')),
                        backgroundColor: Colors.green,)
                      );
                    }
                  else if(state is InternetLostState)
                    {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Center(child: Text('Lost Internet!')),
                            backgroundColor: Colors.red,)
                      );
                    }
                },
                builder: (context,state){
                  if(state is InternetBackState)
                    {
                      return Text('Connected!');
                    }
                 else if(state is InternetLostState)
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

// BlocBuilder to build the UI
//BlocListener to listen to the changes
//BlockConsumer when thier is a requirement of both

// == to check if value are same on LHS and RHS
// is to check if datatype is same on LHS and Rhs
