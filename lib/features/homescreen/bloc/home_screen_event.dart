part of 'home_screen_bloc.dart';

@immutable
sealed class HomeScreenEvent {}
class FetchContacts extends HomeScreenEvent{}
class SubmitDescription extends HomeScreenEvent{
final String number;
final int timestamp;
final String description;

  SubmitDescription({required this.number,required this.timestamp,required this.description});
}
class MoveTocompleted extends HomeScreenEvent{
  final String id;

  MoveTocompleted({required this.id});

}