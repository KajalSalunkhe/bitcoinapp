import 'package:bitcoinapp/model/currency_data_model.dart';
import 'package:bitcoinapp/repo/currency_service.dart';
import 'package:bloc/bloc.dart';

part 'currency_event.dart';
part 'currency_state.dart';

class CurrencyBloc extends Bloc<CurrencyEvent, CurrencyState> {
  CurrencyBloc() : super(CurrencyLoadingState()) {
    on<FetchDataEvent>((event, emit) async {
      // TODO: implement event handler
      emit(CurrencyLoadingState());
      try {
        final data = await CurrencyService.fetchData();
        print(data.toString());
        emit(CurrencyLoadedState(data));
      } catch (error) {
        print('Error: $error');
        emit(CurrencyErrorState('Failed to fetch data'));
      }
    });
  }
}
