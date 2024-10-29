part of 'onboarding_page_cubit.dart';

class OnboardingPageState extends Equatable {
  final bool showNotificationPage;
  final bool showLocationPage;
  const OnboardingPageState({
    required this.showNotificationPage,
    required this.showLocationPage,
  });

  const OnboardingPageState.initial()
      : showNotificationPage = false,
        showLocationPage = false;

  @override
  List<Object> get props => [showNotificationPage, showLocationPage];
}
