import 'package:bitcoinapp/repo/currency_service.dart';
import 'package:bloc/bloc.dart';

part 'currency_event.dart';
part 'currency_state.dart';

class CurrencyBloc extends Bloc<CurrencyEvent, CurrencyState> {
  final CurrencyService _currencyService = CurrencyService();

  CurrencyBloc() : super(CurrencyLoadingState()) {
    on<CurrencyEvent>((event, emit) async {
      // TODO: implement event handler
      if (event is FetchDataEvent) {
        try {
          final data = await _currencyService.fetchData();
          emit(CurrencyLoadedState(data));
        } catch (error) {
          print('Error: $error');
          emit(CurrencyErrorState('Failed to fetch data'));
        }
      }
    
    });
  }
}
