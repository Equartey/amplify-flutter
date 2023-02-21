// GENERATED CODE - DO NOT MODIFY BY HAND

part of rest_json1_v2.rest_json_validation_protocol.model.malformed_range_input;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$MalformedRangeInput extends MalformedRangeInput {
  @override
  final int? byte;
  @override
  final double? float;
  @override
  final int? maxByte;
  @override
  final double? maxFloat;
  @override
  final int? minByte;
  @override
  final double? minFloat;

  factory _$MalformedRangeInput(
          [void Function(MalformedRangeInputBuilder)? updates]) =>
      (new MalformedRangeInputBuilder()..update(updates))._build();

  _$MalformedRangeInput._(
      {this.byte,
      this.float,
      this.maxByte,
      this.maxFloat,
      this.minByte,
      this.minFloat})
      : super._();

  @override
  MalformedRangeInput rebuild(
          void Function(MalformedRangeInputBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MalformedRangeInputBuilder toBuilder() =>
      new MalformedRangeInputBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MalformedRangeInput &&
        byte == other.byte &&
        float == other.float &&
        maxByte == other.maxByte &&
        maxFloat == other.maxFloat &&
        minByte == other.minByte &&
        minFloat == other.minFloat;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, byte.hashCode);
    _$hash = $jc(_$hash, float.hashCode);
    _$hash = $jc(_$hash, maxByte.hashCode);
    _$hash = $jc(_$hash, maxFloat.hashCode);
    _$hash = $jc(_$hash, minByte.hashCode);
    _$hash = $jc(_$hash, minFloat.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }
}

class MalformedRangeInputBuilder
    implements Builder<MalformedRangeInput, MalformedRangeInputBuilder> {
  _$MalformedRangeInput? _$v;

  int? _byte;
  int? get byte => _$this._byte;
  set byte(int? byte) => _$this._byte = byte;

  double? _float;
  double? get float => _$this._float;
  set float(double? float) => _$this._float = float;

  int? _maxByte;
  int? get maxByte => _$this._maxByte;
  set maxByte(int? maxByte) => _$this._maxByte = maxByte;

  double? _maxFloat;
  double? get maxFloat => _$this._maxFloat;
  set maxFloat(double? maxFloat) => _$this._maxFloat = maxFloat;

  int? _minByte;
  int? get minByte => _$this._minByte;
  set minByte(int? minByte) => _$this._minByte = minByte;

  double? _minFloat;
  double? get minFloat => _$this._minFloat;
  set minFloat(double? minFloat) => _$this._minFloat = minFloat;

  MalformedRangeInputBuilder() {
    MalformedRangeInput._init(this);
  }

  MalformedRangeInputBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _byte = $v.byte;
      _float = $v.float;
      _maxByte = $v.maxByte;
      _maxFloat = $v.maxFloat;
      _minByte = $v.minByte;
      _minFloat = $v.minFloat;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MalformedRangeInput other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$MalformedRangeInput;
  }

  @override
  void update(void Function(MalformedRangeInputBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  MalformedRangeInput build() => _build();

  _$MalformedRangeInput _build() {
    final _$result = _$v ??
        new _$MalformedRangeInput._(
            byte: byte,
            float: float,
            maxByte: maxByte,
            maxFloat: maxFloat,
            minByte: minByte,
            minFloat: minFloat);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint