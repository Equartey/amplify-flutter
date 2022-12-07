// GENERATED CODE - DO NOT MODIFY BY HAND

part of smoke_test.dynamo_db.model.batch_execute_statement_input;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$BatchExecuteStatementInput extends BatchExecuteStatementInput {
  @override
  final _i3.ReturnConsumedCapacity? returnConsumedCapacity;
  @override
  final _i5.BuiltList<_i4.BatchStatementRequest> statements;

  factory _$BatchExecuteStatementInput(
          [void Function(BatchExecuteStatementInputBuilder)? updates]) =>
      (new BatchExecuteStatementInputBuilder()..update(updates))._build();

  _$BatchExecuteStatementInput._(
      {this.returnConsumedCapacity, required this.statements})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        statements, r'BatchExecuteStatementInput', 'statements');
  }

  @override
  BatchExecuteStatementInput rebuild(
          void Function(BatchExecuteStatementInputBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BatchExecuteStatementInputBuilder toBuilder() =>
      new BatchExecuteStatementInputBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BatchExecuteStatementInput &&
        returnConsumedCapacity == other.returnConsumedCapacity &&
        statements == other.statements;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc(0, returnConsumedCapacity.hashCode), statements.hashCode));
  }
}

class BatchExecuteStatementInputBuilder
    implements
        Builder<BatchExecuteStatementInput, BatchExecuteStatementInputBuilder> {
  _$BatchExecuteStatementInput? _$v;

  _i3.ReturnConsumedCapacity? _returnConsumedCapacity;
  _i3.ReturnConsumedCapacity? get returnConsumedCapacity =>
      _$this._returnConsumedCapacity;
  set returnConsumedCapacity(
          _i3.ReturnConsumedCapacity? returnConsumedCapacity) =>
      _$this._returnConsumedCapacity = returnConsumedCapacity;

  _i5.ListBuilder<_i4.BatchStatementRequest>? _statements;
  _i5.ListBuilder<_i4.BatchStatementRequest> get statements =>
      _$this._statements ??= new _i5.ListBuilder<_i4.BatchStatementRequest>();
  set statements(_i5.ListBuilder<_i4.BatchStatementRequest>? statements) =>
      _$this._statements = statements;

  BatchExecuteStatementInputBuilder() {
    BatchExecuteStatementInput._init(this);
  }

  BatchExecuteStatementInputBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _returnConsumedCapacity = $v.returnConsumedCapacity;
      _statements = $v.statements.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(BatchExecuteStatementInput other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$BatchExecuteStatementInput;
  }

  @override
  void update(void Function(BatchExecuteStatementInputBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  BatchExecuteStatementInput build() => _build();

  _$BatchExecuteStatementInput _build() {
    _$BatchExecuteStatementInput _$result;
    try {
      _$result = _$v ??
          new _$BatchExecuteStatementInput._(
              returnConsumedCapacity: returnConsumedCapacity,
              statements: statements.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'statements';
        statements.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'BatchExecuteStatementInput', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas