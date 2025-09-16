// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeController on _HomeControllerBase, Store {
  late final _$cepAtom =
      Atom(name: '_HomeControllerBase.cep', context: context);

  @override
  String get cep {
    _$cepAtom.reportRead();
    return super.cep;
  }

  @override
  set cep(String value) {
    _$cepAtom.reportWrite(value, super.cep, () {
      super.cep = value;
    });
  }

  late final _$addressFutureAtom =
      Atom(name: '_HomeControllerBase.addressFuture', context: context);

  @override
  ObservableFuture<Address?>? get addressFuture {
    _$addressFutureAtom.reportRead();
    return super.addressFuture;
  }

  @override
  set addressFuture(ObservableFuture<Address?>? value) {
    _$addressFutureAtom.reportWrite(value, super.addressFuture, () {
      super.addressFuture = value;
    });
  }

  late final _$historyAtom =
      Atom(name: '_HomeControllerBase.history', context: context);

  @override
  ObservableList<Address> get history {
    _$historyAtom.reportRead();
    return super.history;
  }

  @override
  set history(ObservableList<Address> value) {
    _$historyAtom.reportWrite(value, super.history, () {
      super.history = value;
    });
  }

  late final _$searchCepAsyncAction =
      AsyncAction('_HomeControllerBase.searchCep', context: context);

  @override
  Future<void> searchCep() {
    return _$searchCepAsyncAction.run(() => super.searchCep());
  }

  late final _$loadHistoryAsyncAction =
      AsyncAction('_HomeControllerBase.loadHistory', context: context);

  @override
  Future<void> loadHistory() {
    return _$loadHistoryAsyncAction.run(() => super.loadHistory());
  }

  @override
  String toString() {
    return '''
cep: ${cep},
addressFuture: ${addressFuture},
history: ${history}
    ''';
  }
}
