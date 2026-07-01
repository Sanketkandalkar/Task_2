import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dating_app/domain/usecases/get_users_usecase.dart';
import 'package:dating_app/presentation/bloc/home_event.dart';
import 'package:dating_app/presentation/bloc/home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetUsersUseCase getUsersUseCase;

  HomeBloc({required this.getUsersUseCase}) : super(HomeInitial()) {
    on<LoadUsers>((event, emit) async {
      emit(HomeLoading());
      try {
        final users = await getUsersUseCase();
        emit(HomeLoaded(users: users));
      } catch (e) {
        emit(HomeError(message: e.toString()));
      }
    });

    on<RefreshUsers>((event, emit) async {
      try {
        final users = await getUsersUseCase();
        emit(HomeLoaded(users: users));
      } catch (e) {
        emit(HomeError(message: e.toString()));
      }
    });
  }
}
