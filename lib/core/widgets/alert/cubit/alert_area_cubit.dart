import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'alert_area_state.dart';

class AlertAreaCubit extends Cubit<AlertAreaState> {
  AlertAreaCubit() : super(AlertAreaState());

  void showAlert(Alert alert) {
    emit(state..alerts.add(alert));
  }
}

enum AlertType { success, error }

class Alert extends Equatable {
  final String title;
  final AlertType type;

  const Alert.success({required this.title}) : type = AlertType.success;
  const Alert.error({required this.title}) : type = AlertType.error;

  @override
  List<Object?> get props => [title, type];
}
