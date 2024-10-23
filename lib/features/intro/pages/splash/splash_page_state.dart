part of 'splash_page_cubit.dart';

enum SplashPageStatus {
  loading,
  goToOnboarding,
  goToForceUpdate,
  goToMaintenance
}

class SplashPageState extends Equatable {
  final SplashPageStatus status;
  const SplashPageState({this.status = SplashPageStatus.loading});

  @override
  List<Object> get props => [status];

  SplashPageState copyWith({
    SplashPageStatus? status,
  }) {
    return SplashPageState(status: status ?? this.status);
  }
}
