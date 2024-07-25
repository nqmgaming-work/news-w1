import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'data/data_sources/db/note_dao.dart';
import 'data/repositories/note_repository_impl.dart';
import 'domain/repositories/note_repository.dart';
import 'domain/use_cases/get_notes.dart';
import 'domain/use_cases/get_note_detail.dart';
import 'domain/use_cases/add_note.dart';
import 'domain/use_cases/update_note.dart';
import 'domain/use_cases/delete_note.dart';
import 'presentation/bloc/note_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Bloc
  sl.registerFactory(() => NoteBloc(
    getNotes: sl(),
    addNote: sl(),
    updateNote: sl(),
    deleteNote: sl(),
  ));

  // Use cases
  sl.registerLazySingleton(() => GetNotesUseCase(sl()));
  sl.registerLazySingleton(() => GetNoteDetailUseCase(sl()));
  sl.registerLazySingleton(() => AddNoteUseCase(sl()));
  sl.registerLazySingleton(() => UpdateNoteUseCase(sl()));
  sl.registerLazySingleton(() => DeleteNoteUseCase(sl()));

  // Repository
  sl.registerLazySingleton<NoteRepository>(() => NoteRepositoryImpl(sl()));

  // Data sources
  sl.registerLazySingleton<NoteDao>(() => NoteDao());
}
