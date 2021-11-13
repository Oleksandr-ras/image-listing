import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:json_task/bloc/data_bloc.dart';
import 'package:json_task/bloc/data_state.dart';
import 'package:json_task/models/repository/data_repository.dart';

import 'bloc/data_event.dart';

class ShowDataScreen extends StatelessWidget {
  ShowDataScreen({Key? key}) : super(key: key);
  final dataRepository = DataRepository();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DataBloc>(
      create: (context) =>
          DataBloc(dataRepository: dataRepository)..add(OpenAppEvent()),
      child: Scaffold(
          appBar: AppBar(title: const Text('Image listing')),
          body: BlocBuilder<DataBloc, DataState>(
            builder: (context, state) {
              if (state is StateInitData) {
                return const Center(
                  child: Text('No data to show'),
                );
              } else if (state is StateLoadData) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is StateLoadSuccess) {
                return ListView.builder(
                    itemCount: state.loadedData.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          state.loadedData[index].image_url != null
                              ? Image(
                                  fit: BoxFit.fill,
                                  width: double.infinity,
                                  image: NetworkImage(
                                      '${state.loadedData[index].image_url}'))
                              : const Text('Image upload'),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: Text(
                              '${state.loadedData[index].score}',
                              style: GoogleFonts.mcLaren(
                                  textStyle: const TextStyle(fontSize: 24)),
                            ),
                          ),
                        ],
                      );
                    });
              } else if (state is StateLoadError) {
                return Center(child: Text(state.error.toString()));
              }
              return const Center(
                child: Text('App don\'t work.\nPlease try open it later'),
              );
            },
          )),
    );
  }
}
