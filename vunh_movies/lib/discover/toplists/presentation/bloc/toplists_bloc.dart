import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vunh_movies/discover/toplists/data/toplist_api.dart';
import 'package:vunh_movies/discover/toplists/data/toplists_model.dart';
import 'package:vunh_movies/discover/toplists/domain/toplists.dart';
import 'package:vunh_movies/discover/toplists/presentation/bloc/toplists_event.dart';
import 'package:vunh_movies/discover/toplists/presentation/bloc/toplists_state.dart';

class TopListsBloc extends Bloc<TopListsEvent,TopListsState> {
  final topListsApi = TopListsApi();

  TopListsBloc({TopListsState initialState});

  @override
  TopListsState get initialState => LoadingState();

  @override
  Stream<TopListsState> mapEventToState(TopListsEvent event) async* {
    if (event is TopListLoadDataEvent) {
      yield await _mapEventToGetTopListsList(event, state);
    }
  }

  Future<TopListsState> _mapEventToGetTopListsList(TopListLoadDataEvent event, TopListsState state) async {
    try {
      /// call api get list Product
      final responseTopListsList = await topListsApi
          .getTopListsList()
          .timeout(Duration(seconds: 5), onTimeout: () {
        // GeneralDialog.showDialogNotify(context, 'Time out!');
        return null;
      });
      List<TopLists> topListsList;
      if (responseTopListsList.statusCode == 200) {
        topListsList = ((json.decode(responseTopListsList.body)['results'] as List)
            .map((json) => TopListsModel.fromJson(json)))
            .toList();
        return LoadedState(topListsList);
      } else {
        // throw responseTopListsList.reasonPhrase;
        return ErrorState();
      }

      // List<TopLists> topListsList = await getTopListsList(responseTopListsList);
      // return LoadedState(topListsList: topListsList);
    }catch (e) {
      print('Error $e');
      return ErrorState();
    }
  }

  Future<List<TopLists>> getTopListsList(responseTopListsList) async {
    try {
      /// call api get list Product
      // final responseTopListsList = await topListsApi
      //     .getTopListsList()
      //     .timeout(Duration(seconds: 5), onTimeout: () {
      //   // GeneralDialog.showDialogNotify(context, 'Time out!');
      //   ErrorState();
      //   return null;
      // });

      List<TopLists> _listTopLists;
      if (responseTopListsList.statusCode == 200) {
        _listTopLists = ((json.decode(responseTopListsList.body)['results'] as List)
            .map((json) => TopListsModel.fromJson(json)))
            .toList();
        return _listTopLists;
      } else {
        throw responseTopListsList.reasonPhrase;
      }
    } catch (e) {
      print('Error $e');
      // GeneralDialog.showDialogNotify(context, e);
      ErrorState();
      return null;
    }
  }

}