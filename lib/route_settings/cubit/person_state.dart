
import 'package:route/data/failures.dart';
import 'package:route/data/model/Response/RegisterResponse.dart';

abstract class PersonState {}

class PersonInitialState extends PersonState{}

class PersonLoadingState extends PersonState{}

class PersonErrorState extends PersonState {
  Failures failures ;
  PersonErrorState({required this.failures});

}

class PersonSuccessState extends PersonState {
  RegisterResponse registerResponse ;
  PersonSuccessState({required this.registerResponse});

}