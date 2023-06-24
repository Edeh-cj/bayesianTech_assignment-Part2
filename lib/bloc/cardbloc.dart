import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../classes/comment.dart';
import '../repository/repo.dart';

class CardBloc extends Bloc<CardEvent, List<MyComment>> {
  
  final repo = Repository();

  CardBloc() : super([MyComment(
    url: '',
    thumbnailUrl: "https://via.placeholder.com/150/92c952",
    title: 'This is the first comment', id:  int.parse(generateid()),)]) {

    on<AddCardEvent>((event, emit) {
      state.add(event.addedcomment);
      state.where((element) => element.id == event.callingcomment.id).first.toggle = 'l';
      emit(state);
    });

    on<Getcomments>((event, emit) async{
      await repo.fetchcomments().then((value) {
        for (var element in value) {
          state.add(element);
        }
        emit(state);
      }).catchError((error){
        throw Exception(error);
      });
    });
  }
}

abstract class CardEvent {}

class AddCardEvent implements CardEvent {
  final MyComment callingcomment;
  final MyComment addedcomment;

  AddCardEvent({ required this.callingcomment, required this.addedcomment});}

class Getcomments implements CardEvent{}
  String generateid() {
  String characters = '1234567890';
  return List.generate(
      2, (index) => characters[Random().nextInt(characters.length)]).join();
}