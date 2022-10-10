// GENERATED CODE - DO NOT MODIFY BY HAND

part of smoke_test.dynamo_db.model.query_output;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$QueryOutput extends QueryOutput {
  @override
  final _i2.ConsumedCapacity? consumedCapacity;
  @override
  final int? count;
  @override
  final _i4.BuiltList<_i4.BuiltMap<String, _i3.AttributeValue>>? items;
  @override
  final _i4.BuiltMap<String, _i3.AttributeValue>? lastEvaluatedKey;
  @override
  final int? scannedCount;

  factory _$QueryOutput([void Function(QueryOutputBuilder)? updates]) =>
      (new QueryOutputBuilder()..update(updates))._build();

  _$QueryOutput._(
      {this.consumedCapacity,
      this.count,
      this.items,
      this.lastEvaluatedKey,
      this.scannedCount})
      : super._();

  @override
  QueryOutput rebuild(void Function(QueryOutputBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  QueryOutputBuilder toBuilder() => new QueryOutputBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is QueryOutput &&
        consumedCapacity == other.consumedCapacity &&
        count == other.count &&
        items == other.items &&
        lastEvaluatedKey == other.lastEvaluatedKey &&
        scannedCount == other.scannedCount;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, consumedCapacity.hashCode), count.hashCode),
                items.hashCode),
            lastEvaluatedKey.hashCode),
        scannedCount.hashCode));
  }
}

class QueryOutputBuilder implements Builder<QueryOutput, QueryOutputBuilder> {
  _$QueryOutput? _$v;

  _i2.ConsumedCapacityBuilder? _consumedCapacity;
  _i2.ConsumedCapacityBuilder get consumedCapacity =>
      _$this._consumedCapacity ??= new _i2.ConsumedCapacityBuilder();
  set consumedCapacity(_i2.ConsumedCapacityBuilder? consumedCapacity) =>
      _$this._consumedCapacity = consumedCapacity;

  int? _count;
  int? get count => _$this._count;
  set count(int? count) => _$this._count = count;

  _i4.ListBuilder<_i4.BuiltMap<String, _i3.AttributeValue>>? _items;
  _i4.ListBuilder<_i4.BuiltMap<String, _i3.AttributeValue>> get items =>
      _$this._items ??=
          new _i4.ListBuilder<_i4.BuiltMap<String, _i3.AttributeValue>>();
  set items(_i4.ListBuilder<_i4.BuiltMap<String, _i3.AttributeValue>>? items) =>
      _$this._items = items;

  _i4.MapBuilder<String, _i3.AttributeValue>? _lastEvaluatedKey;
  _i4.MapBuilder<String, _i3.AttributeValue> get lastEvaluatedKey =>
      _$this._lastEvaluatedKey ??=
          new _i4.MapBuilder<String, _i3.AttributeValue>();
  set lastEvaluatedKey(
          _i4.MapBuilder<String, _i3.AttributeValue>? lastEvaluatedKey) =>
      _$this._lastEvaluatedKey = lastEvaluatedKey;

  int? _scannedCount;
  int? get scannedCount => _$this._scannedCount;
  set scannedCount(int? scannedCount) => _$this._scannedCount = scannedCount;

  QueryOutputBuilder() {
    QueryOutput._init(this);
  }

  QueryOutputBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _consumedCapacity = $v.consumedCapacity?.toBuilder();
      _count = $v.count;
      _items = $v.items?.toBuilder();
      _lastEvaluatedKey = $v.lastEvaluatedKey?.toBuilder();
      _scannedCount = $v.scannedCount;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(QueryOutput other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$QueryOutput;
  }

  @override
  void update(void Function(QueryOutputBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  QueryOutput build() => _build();

  _$QueryOutput _build() {
    _$QueryOutput _$result;
    try {
      _$result = _$v ??
          new _$QueryOutput._(
              consumedCapacity: _consumedCapacity?.build(),
              count: count,
              items: _items?.build(),
              lastEvaluatedKey: _lastEvaluatedKey?.build(),
              scannedCount: scannedCount);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'consumedCapacity';
        _consumedCapacity?.build();

        _$failedField = 'items';
        _items?.build();
        _$failedField = 'lastEvaluatedKey';
        _lastEvaluatedKey?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'QueryOutput', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas