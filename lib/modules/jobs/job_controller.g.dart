// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$JobController on _JobControllerBase, Store {
  final _$busyAtom = Atom(name: '_JobControllerBase.busy');

  @override
  bool get busy {
    _$busyAtom.reportRead();
    return super.busy;
  }

  @override
  set busy(bool value) {
    _$busyAtom.reportWrite(value, super.busy, () {
      super.busy = value;
    });
  }

  final _$nameAtom = Atom(name: '_JobControllerBase.name');

  @override
  String get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  final _$descriptionAtom = Atom(name: '_JobControllerBase.description');

  @override
  String get description {
    _$descriptionAtom.reportRead();
    return super.description;
  }

  @override
  set description(String value) {
    _$descriptionAtom.reportWrite(value, super.description, () {
      super.description = value;
    });
  }

  final _$priceAtom = Atom(name: '_JobControllerBase.price');

  @override
  double get price {
    _$priceAtom.reportRead();
    return super.price;
  }

  @override
  set price(double value) {
    _$priceAtom.reportWrite(value, super.price, () {
      super.price = value;
    });
  }

  final _$listAtom = Atom(name: '_JobControllerBase.list');

  @override
  ObservableList<JobModel> get list {
    _$listAtom.reportRead();
    return super.list;
  }

  @override
  set list(ObservableList<JobModel> value) {
    _$listAtom.reportWrite(value, super.list, () {
      super.list = value;
    });
  }

  final _$fetchAsyncAction = AsyncAction('_JobControllerBase.fetch');

  @override
  Future<dynamic> fetch() {
    return _$fetchAsyncAction.run(() => super.fetch());
  }

  final _$createAsyncAction = AsyncAction('_JobControllerBase.create');

  @override
  Future<dynamic> create() {
    return _$createAsyncAction.run(() => super.create());
  }

  final _$_JobControllerBaseActionController =
      ActionController(name: '_JobControllerBase');

  @override
  void setName(dynamic value) {
    final _$actionInfo = _$_JobControllerBaseActionController.startAction(
        name: '_JobControllerBase.setName');
    try {
      return super.setName(value);
    } finally {
      _$_JobControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDescription(dynamic value) {
    final _$actionInfo = _$_JobControllerBaseActionController.startAction(
        name: '_JobControllerBase.setDescription');
    try {
      return super.setDescription(value);
    } finally {
      _$_JobControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPrice(dynamic value) {
    final _$actionInfo = _$_JobControllerBaseActionController.startAction(
        name: '_JobControllerBase.setPrice');
    try {
      return super.setPrice(value);
    } finally {
      _$_JobControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addJobModel(dynamic value) {
    final _$actionInfo = _$_JobControllerBaseActionController.startAction(
        name: '_JobControllerBase.addJobModel');
    try {
      return super.addJobModel(value);
    } finally {
      _$_JobControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
busy: ${busy},
name: ${name},
description: ${description},
price: ${price},
list: ${list}
    ''';
  }
}
