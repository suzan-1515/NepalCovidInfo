part of 'nepal_stats_bloc.dart';

@immutable
abstract class NepalStatsState {}

class InitialNepalStatsState extends NepalStatsState {}

class LoadingNepalStatsState extends NepalStatsState {}

class LoadedNepalStatsState extends NepalStatsState {
  final NepalInfectionData nepalStats;

  LoadedNepalStatsState({
    @required this.nepalStats,
  }) : assert(nepalStats != null);
}

class ErrorNepalStatsState extends NepalStatsState {
  final String message;

  ErrorNepalStatsState({
    @required this.message,
  }) : assert(message != null);
}