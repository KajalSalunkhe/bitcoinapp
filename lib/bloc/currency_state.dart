part of 'currency_bloc.dart';

abstract class CurrencyState {}

class CurrencyLoadingState extends CurrencyState {}

class CurrencyLoadedState extends CurrencyState {
  // final Map<String, dynamic> currencyData;
  final CurrencyData currencyData;

  CurrencyLoadedState(this.currencyData);
}

class CurrencyErrorState extends CurrencyState {
  final String errorMessage;

  CurrencyErrorState(this.errorMessage);
}
