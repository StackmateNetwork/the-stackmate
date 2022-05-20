import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sats/model/preferences.dart';
import 'package:sats/pkg/interface/storage.dart';
import 'package:sats/pkg/storage.dart';

part 'preferences.freezed.dart';

@freezed
class PreferencesState with _$PreferencesState {
  const factory PreferencesState({
    @Default(false) bool incognito,
    @Default(false) bool bitcoinStandard,
    @Default('sats') String preferredBitcoinUnit,
    @Default('CoinCap') String preferredExchange,
    @Default('USD') String preferredFiatUnit,
    @Default('') String errorPreferencesState,
  }) = _PreferencesState;
  const PreferencesState._();
}

class PreferencesCubit extends Cubit<PreferencesState> {
  PreferencesCubit(
    this._storage,
  ) : super(
          const PreferencesState(
            incognito: false,
            bitcoinStandard: false,
            preferredBitcoinUnit: 'sats',
            preferredExchange: 'CoinCap',
            preferredFiatUnit: 'USD',
            errorPreferencesState: '',
          ),
        );

  final IStorage _storage;

  void init() async {
    final preferences =
        _storage.getFirstItem<Preferences>(StoreKeys.Preferences.name);
    if (preferences.hasError) {
      if (preferences.error! == 'empty')
        emit(
          state.copyWith(
            incognito: false,
            bitcoinStandard: false,
            preferredBitcoinUnit: 'sats',
            preferredExchange: 'CoinCap',
            preferredFiatUnit: 'USD',
          ),
        );
      else
        emit(
          state.copyWith(
            errorPreferencesState: preferences.error.toString(),
          ),
        );
    } else
      emit(
        state.copyWith(
          incognito: preferences.result!.incognito,
          bitcoinStandard: preferences.result!.bitcoinStandard,
          preferredBitcoinUnit: preferences.result!.preferredBitcoinUnit,
          preferredExchange: preferences.result!.preferredExchange,
          preferredFiatUnit: preferences.result!.preferredFiatUnit,
        ),
      );
  }

  void incognitoChanged() {
    emit(state.copyWith(incognito: !state.incognito));
  }

  void bitcoinStandardChanged() {
    emit(state.copyWith(bitcoinStandard: !state.bitcoinStandard));
  }

  void preferredBitcoinUnitChanged() {
    emit(
      state.copyWith(
        preferredBitcoinUnit:
            (state.preferredBitcoinUnit == 'sats') ? 'BTC' : 'sats',
      ),
    );
  }

  void preferredExchangeChanged(String exchange) {
    emit(state.copyWith(preferredExchange: exchange));
  }

  void preferredFiatUnitChanged(String unit) {
    emit(state.copyWith(preferredFiatUnit: unit));
  }

  void saveClicked() async {
    final preferences = Preferences(
      incognito: state.incognito,
      bitcoinStandard: state.bitcoinStandard,
      preferredBitcoinUnit: state.preferredBitcoinUnit,
      preferredExchange: state.preferredExchange,
      preferredFiatUnit: state.preferredFiatUnit,
    );

    // final cleared =
    //     await _storage.clearAll<Preferences>(StoreKeys.Preferences.name);
    // if (cleared.hasError) {
    //   emit(state.copyWith(errorPreferencesState: cleared.error.toString()));
    //   return;
    // }
    final saved = await _storage.saveItemAt<Preferences>(
      StoreKeys.Preferences.name,
      0,
      preferences,
    );
    if (saved.hasError) {
      emit(state.copyWith(errorPreferencesState: saved.error.toString()));
      return;
    }
    // await Future.delayed(const Duration(milliseconds: 1500));
  }
}
