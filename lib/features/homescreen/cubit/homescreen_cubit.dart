import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

class HomescreenCubit extends Cubit<bool> {
  HomescreenCubit() : super(false);

  void markDropped()=>emit(true);
  void reset()=>emit(false);
}
