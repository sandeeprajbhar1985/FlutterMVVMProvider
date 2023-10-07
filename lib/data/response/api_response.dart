import 'package:poc_mvvm_provider/data/response/status.dart';
import 'package:poc_mvvm_provider/model/movie_model.dart';

class ApiResponse<T> {
  Status? status;
  T? data;
  String? message;

  ApiResponse(this.status, this.data, this.message);

  ApiResponse.loading() : status = Status.LOADING;

  ApiResponse.completed(this.data) : status = Status.COMPLETED;

  ApiResponse.error(this.message) : status = Status.ERROR;

  @override
  String toString() {
    return "Status : $status \n Mesaage : $message \n Data: &data";
  }
}
