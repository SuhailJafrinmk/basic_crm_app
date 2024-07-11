part of 'home_screen_bloc.dart';

@immutable
sealed class HomeScreenState {
  final List<CallLogEntry> callLogs;
  final Map<String,String> descriptions;
  final List<String> completedKeys;

  HomeScreenState({required this.callLogs,required this.descriptions,required this.completedKeys});
}

final class HomeScreenInitial extends HomeScreenState {
  HomeScreenInitial() : super(callLogs: [],descriptions: {},completedKeys: []);
  
}

class DescriptionAdded extends HomeScreenState{
  DescriptionAdded({
    required List<CallLogEntry> callLogs,
    required Map<String, String> descriptions,
    required List<String> completedKeys,
  }):super(callLogs: callLogs,completedKeys: completedKeys,descriptions: descriptions);
}