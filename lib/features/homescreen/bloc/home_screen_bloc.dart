import 'dart:async';
import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:call_log/call_log.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';
import 'dart:developer' as developer;

part 'home_screen_event.dart';
part 'home_screen_state.dart';


class HomeScreenBloc extends Bloc<HomeScreenEvent, HomeScreenState> {
final FirebaseFirestore firestore;
  HomeScreenBloc(this.firestore) : super(HomeScreenInitial()) {
  on<FetchContacts>(fetchContacts);
  on<SubmitDescription>(submitDescription);
  on<MoveTocompleted>(moveTocompleted);
  }
    String _generateKey(String number, int timestamp) {
    return '$number-$timestamp';
  }

  FutureOr<void> fetchContacts(FetchContacts event, Emitter<HomeScreenState> emit) async{
   Iterable<CallLogEntry> entries = await CallLog.get();
    List<CallLogEntry> callList = entries.toList();
    Map<String, String> descriptions = {};
    QuerySnapshot querySnapshot = await firestore.collection('CallLogs').get();
    for (var doc in querySnapshot.docs) {
      descriptions[doc.id] = doc.get('description');
    }
    emit(DescriptionAdded(callLogs: callList, descriptions: descriptions, completedKeys: []));
  }

  FutureOr<void> submitDescription(SubmitDescription event, Emitter<HomeScreenState> emit)async{
   String key = _generateKey(event.number, event.timestamp);
    await firestore.collection('CallLogs').doc(key).set({'description': event.description});
    Map<String, String> updatedDescriptions = Map.from(state.descriptions);
    updatedDescriptions[key] = event.description;
    emit(DescriptionAdded(
      callLogs: state.callLogs,
      descriptions: updatedDescriptions,
      completedKeys: state.completedKeys,
    ));
  }

  FutureOr<void> moveTocompleted(MoveTocompleted event, Emitter<HomeScreenState> emit) {
    List<String>completedIds=List.from(state.completedKeys);
    completedIds.add(event.id);
    developer.log('items in completed id list is${completedIds} and length is ${completedIds.length}');
    emit(DescriptionAdded(callLogs: state.callLogs, descriptions: state.descriptions, completedKeys: completedIds));
  }

}
