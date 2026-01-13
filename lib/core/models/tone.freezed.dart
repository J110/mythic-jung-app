// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tone.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ToneInfo _$ToneInfoFromJson(Map<String, dynamic> json) {
  return _ToneInfo.fromJson(json);
}

/// @nodoc
mixin _$ToneInfo {
  String get value => throw _privateConstructorUsedError;
  String get label => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;

  /// Serializes this ToneInfo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ToneInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ToneInfoCopyWith<ToneInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ToneInfoCopyWith<$Res> {
  factory $ToneInfoCopyWith(ToneInfo value, $Res Function(ToneInfo) then) =
      _$ToneInfoCopyWithImpl<$Res, ToneInfo>;
  @useResult
  $Res call({String value, String label, String description});
}

/// @nodoc
class _$ToneInfoCopyWithImpl<$Res, $Val extends ToneInfo>
    implements $ToneInfoCopyWith<$Res> {
  _$ToneInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ToneInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
    Object? label = null,
    Object? description = null,
  }) {
    return _then(
      _value.copyWith(
            value: null == value
                ? _value.value
                : value // ignore: cast_nullable_to_non_nullable
                      as String,
            label: null == label
                ? _value.label
                : label // ignore: cast_nullable_to_non_nullable
                      as String,
            description: null == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ToneInfoImplCopyWith<$Res>
    implements $ToneInfoCopyWith<$Res> {
  factory _$$ToneInfoImplCopyWith(
    _$ToneInfoImpl value,
    $Res Function(_$ToneInfoImpl) then,
  ) = __$$ToneInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String value, String label, String description});
}

/// @nodoc
class __$$ToneInfoImplCopyWithImpl<$Res>
    extends _$ToneInfoCopyWithImpl<$Res, _$ToneInfoImpl>
    implements _$$ToneInfoImplCopyWith<$Res> {
  __$$ToneInfoImplCopyWithImpl(
    _$ToneInfoImpl _value,
    $Res Function(_$ToneInfoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ToneInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
    Object? label = null,
    Object? description = null,
  }) {
    return _then(
      _$ToneInfoImpl(
        value: null == value
            ? _value.value
            : value // ignore: cast_nullable_to_non_nullable
                  as String,
        label: null == label
            ? _value.label
            : label // ignore: cast_nullable_to_non_nullable
                  as String,
        description: null == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ToneInfoImpl implements _ToneInfo {
  const _$ToneInfoImpl({
    required this.value,
    required this.label,
    required this.description,
  });

  factory _$ToneInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ToneInfoImplFromJson(json);

  @override
  final String value;
  @override
  final String label;
  @override
  final String description;

  @override
  String toString() {
    return 'ToneInfo(value: $value, label: $label, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ToneInfoImpl &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, value, label, description);

  /// Create a copy of ToneInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ToneInfoImplCopyWith<_$ToneInfoImpl> get copyWith =>
      __$$ToneInfoImplCopyWithImpl<_$ToneInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ToneInfoImplToJson(this);
  }
}

abstract class _ToneInfo implements ToneInfo {
  const factory _ToneInfo({
    required final String value,
    required final String label,
    required final String description,
  }) = _$ToneInfoImpl;

  factory _ToneInfo.fromJson(Map<String, dynamic> json) =
      _$ToneInfoImpl.fromJson;

  @override
  String get value;
  @override
  String get label;
  @override
  String get description;

  /// Create a copy of ToneInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ToneInfoImplCopyWith<_$ToneInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AvailableTonesResponse _$AvailableTonesResponseFromJson(
  Map<String, dynamic> json,
) {
  return _AvailableTonesResponse.fromJson(json);
}

/// @nodoc
mixin _$AvailableTonesResponse {
  List<ToneInfo> get tones => throw _privateConstructorUsedError;
  String get defaultTone => throw _privateConstructorUsedError;

  /// Serializes this AvailableTonesResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AvailableTonesResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AvailableTonesResponseCopyWith<AvailableTonesResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AvailableTonesResponseCopyWith<$Res> {
  factory $AvailableTonesResponseCopyWith(
    AvailableTonesResponse value,
    $Res Function(AvailableTonesResponse) then,
  ) = _$AvailableTonesResponseCopyWithImpl<$Res, AvailableTonesResponse>;
  @useResult
  $Res call({List<ToneInfo> tones, String defaultTone});
}

/// @nodoc
class _$AvailableTonesResponseCopyWithImpl<
  $Res,
  $Val extends AvailableTonesResponse
>
    implements $AvailableTonesResponseCopyWith<$Res> {
  _$AvailableTonesResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AvailableTonesResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? tones = null, Object? defaultTone = null}) {
    return _then(
      _value.copyWith(
            tones: null == tones
                ? _value.tones
                : tones // ignore: cast_nullable_to_non_nullable
                      as List<ToneInfo>,
            defaultTone: null == defaultTone
                ? _value.defaultTone
                : defaultTone // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AvailableTonesResponseImplCopyWith<$Res>
    implements $AvailableTonesResponseCopyWith<$Res> {
  factory _$$AvailableTonesResponseImplCopyWith(
    _$AvailableTonesResponseImpl value,
    $Res Function(_$AvailableTonesResponseImpl) then,
  ) = __$$AvailableTonesResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<ToneInfo> tones, String defaultTone});
}

/// @nodoc
class __$$AvailableTonesResponseImplCopyWithImpl<$Res>
    extends
        _$AvailableTonesResponseCopyWithImpl<$Res, _$AvailableTonesResponseImpl>
    implements _$$AvailableTonesResponseImplCopyWith<$Res> {
  __$$AvailableTonesResponseImplCopyWithImpl(
    _$AvailableTonesResponseImpl _value,
    $Res Function(_$AvailableTonesResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AvailableTonesResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? tones = null, Object? defaultTone = null}) {
    return _then(
      _$AvailableTonesResponseImpl(
        tones: null == tones
            ? _value._tones
            : tones // ignore: cast_nullable_to_non_nullable
                  as List<ToneInfo>,
        defaultTone: null == defaultTone
            ? _value.defaultTone
            : defaultTone // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AvailableTonesResponseImpl implements _AvailableTonesResponse {
  const _$AvailableTonesResponseImpl({
    final List<ToneInfo> tones = const [],
    this.defaultTone = 'PLAIN',
  }) : _tones = tones;

  factory _$AvailableTonesResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$AvailableTonesResponseImplFromJson(json);

  final List<ToneInfo> _tones;
  @override
  @JsonKey()
  List<ToneInfo> get tones {
    if (_tones is EqualUnmodifiableListView) return _tones;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tones);
  }

  @override
  @JsonKey()
  final String defaultTone;

  @override
  String toString() {
    return 'AvailableTonesResponse(tones: $tones, defaultTone: $defaultTone)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AvailableTonesResponseImpl &&
            const DeepCollectionEquality().equals(other._tones, _tones) &&
            (identical(other.defaultTone, defaultTone) ||
                other.defaultTone == defaultTone));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_tones),
    defaultTone,
  );

  /// Create a copy of AvailableTonesResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AvailableTonesResponseImplCopyWith<_$AvailableTonesResponseImpl>
  get copyWith =>
      __$$AvailableTonesResponseImplCopyWithImpl<_$AvailableTonesResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$AvailableTonesResponseImplToJson(this);
  }
}

abstract class _AvailableTonesResponse implements AvailableTonesResponse {
  const factory _AvailableTonesResponse({
    final List<ToneInfo> tones,
    final String defaultTone,
  }) = _$AvailableTonesResponseImpl;

  factory _AvailableTonesResponse.fromJson(Map<String, dynamic> json) =
      _$AvailableTonesResponseImpl.fromJson;

  @override
  List<ToneInfo> get tones;
  @override
  String get defaultTone;

  /// Create a copy of AvailableTonesResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AvailableTonesResponseImplCopyWith<_$AvailableTonesResponseImpl>
  get copyWith => throw _privateConstructorUsedError;
}

TonePreferenceResponse _$TonePreferenceResponseFromJson(
  Map<String, dynamic> json,
) {
  return _TonePreferenceResponse.fromJson(json);
}

/// @nodoc
mixin _$TonePreferenceResponse {
  String get narrativeTone => throw _privateConstructorUsedError;
  List<ToneInfo> get availableTones => throw _privateConstructorUsedError;

  /// Serializes this TonePreferenceResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TonePreferenceResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TonePreferenceResponseCopyWith<TonePreferenceResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TonePreferenceResponseCopyWith<$Res> {
  factory $TonePreferenceResponseCopyWith(
    TonePreferenceResponse value,
    $Res Function(TonePreferenceResponse) then,
  ) = _$TonePreferenceResponseCopyWithImpl<$Res, TonePreferenceResponse>;
  @useResult
  $Res call({String narrativeTone, List<ToneInfo> availableTones});
}

/// @nodoc
class _$TonePreferenceResponseCopyWithImpl<
  $Res,
  $Val extends TonePreferenceResponse
>
    implements $TonePreferenceResponseCopyWith<$Res> {
  _$TonePreferenceResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TonePreferenceResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? narrativeTone = null, Object? availableTones = null}) {
    return _then(
      _value.copyWith(
            narrativeTone: null == narrativeTone
                ? _value.narrativeTone
                : narrativeTone // ignore: cast_nullable_to_non_nullable
                      as String,
            availableTones: null == availableTones
                ? _value.availableTones
                : availableTones // ignore: cast_nullable_to_non_nullable
                      as List<ToneInfo>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$TonePreferenceResponseImplCopyWith<$Res>
    implements $TonePreferenceResponseCopyWith<$Res> {
  factory _$$TonePreferenceResponseImplCopyWith(
    _$TonePreferenceResponseImpl value,
    $Res Function(_$TonePreferenceResponseImpl) then,
  ) = __$$TonePreferenceResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String narrativeTone, List<ToneInfo> availableTones});
}

/// @nodoc
class __$$TonePreferenceResponseImplCopyWithImpl<$Res>
    extends
        _$TonePreferenceResponseCopyWithImpl<$Res, _$TonePreferenceResponseImpl>
    implements _$$TonePreferenceResponseImplCopyWith<$Res> {
  __$$TonePreferenceResponseImplCopyWithImpl(
    _$TonePreferenceResponseImpl _value,
    $Res Function(_$TonePreferenceResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TonePreferenceResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? narrativeTone = null, Object? availableTones = null}) {
    return _then(
      _$TonePreferenceResponseImpl(
        narrativeTone: null == narrativeTone
            ? _value.narrativeTone
            : narrativeTone // ignore: cast_nullable_to_non_nullable
                  as String,
        availableTones: null == availableTones
            ? _value._availableTones
            : availableTones // ignore: cast_nullable_to_non_nullable
                  as List<ToneInfo>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$TonePreferenceResponseImpl implements _TonePreferenceResponse {
  const _$TonePreferenceResponseImpl({
    this.narrativeTone = 'PLAIN',
    final List<ToneInfo> availableTones = const [],
  }) : _availableTones = availableTones;

  factory _$TonePreferenceResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$TonePreferenceResponseImplFromJson(json);

  @override
  @JsonKey()
  final String narrativeTone;
  final List<ToneInfo> _availableTones;
  @override
  @JsonKey()
  List<ToneInfo> get availableTones {
    if (_availableTones is EqualUnmodifiableListView) return _availableTones;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_availableTones);
  }

  @override
  String toString() {
    return 'TonePreferenceResponse(narrativeTone: $narrativeTone, availableTones: $availableTones)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TonePreferenceResponseImpl &&
            (identical(other.narrativeTone, narrativeTone) ||
                other.narrativeTone == narrativeTone) &&
            const DeepCollectionEquality().equals(
              other._availableTones,
              _availableTones,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    narrativeTone,
    const DeepCollectionEquality().hash(_availableTones),
  );

  /// Create a copy of TonePreferenceResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TonePreferenceResponseImplCopyWith<_$TonePreferenceResponseImpl>
  get copyWith =>
      __$$TonePreferenceResponseImplCopyWithImpl<_$TonePreferenceResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$TonePreferenceResponseImplToJson(this);
  }
}

abstract class _TonePreferenceResponse implements TonePreferenceResponse {
  const factory _TonePreferenceResponse({
    final String narrativeTone,
    final List<ToneInfo> availableTones,
  }) = _$TonePreferenceResponseImpl;

  factory _TonePreferenceResponse.fromJson(Map<String, dynamic> json) =
      _$TonePreferenceResponseImpl.fromJson;

  @override
  String get narrativeTone;
  @override
  List<ToneInfo> get availableTones;

  /// Create a copy of TonePreferenceResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TonePreferenceResponseImplCopyWith<_$TonePreferenceResponseImpl>
  get copyWith => throw _privateConstructorUsedError;
}

ToneRenderResponse _$ToneRenderResponseFromJson(Map<String, dynamic> json) {
  return _ToneRenderResponse.fromJson(json);
}

/// @nodoc
mixin _$ToneRenderResponse {
  bool get success => throw _privateConstructorUsedError;
  String? get tone => throw _privateConstructorUsedError;
  Map<String, dynamic>? get rendered => throw _privateConstructorUsedError;
  bool get cached => throw _privateConstructorUsedError;

  /// Serializes this ToneRenderResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ToneRenderResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ToneRenderResponseCopyWith<ToneRenderResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ToneRenderResponseCopyWith<$Res> {
  factory $ToneRenderResponseCopyWith(
    ToneRenderResponse value,
    $Res Function(ToneRenderResponse) then,
  ) = _$ToneRenderResponseCopyWithImpl<$Res, ToneRenderResponse>;
  @useResult
  $Res call({
    bool success,
    String? tone,
    Map<String, dynamic>? rendered,
    bool cached,
  });
}

/// @nodoc
class _$ToneRenderResponseCopyWithImpl<$Res, $Val extends ToneRenderResponse>
    implements $ToneRenderResponseCopyWith<$Res> {
  _$ToneRenderResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ToneRenderResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? tone = freezed,
    Object? rendered = freezed,
    Object? cached = null,
  }) {
    return _then(
      _value.copyWith(
            success: null == success
                ? _value.success
                : success // ignore: cast_nullable_to_non_nullable
                      as bool,
            tone: freezed == tone
                ? _value.tone
                : tone // ignore: cast_nullable_to_non_nullable
                      as String?,
            rendered: freezed == rendered
                ? _value.rendered
                : rendered // ignore: cast_nullable_to_non_nullable
                      as Map<String, dynamic>?,
            cached: null == cached
                ? _value.cached
                : cached // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ToneRenderResponseImplCopyWith<$Res>
    implements $ToneRenderResponseCopyWith<$Res> {
  factory _$$ToneRenderResponseImplCopyWith(
    _$ToneRenderResponseImpl value,
    $Res Function(_$ToneRenderResponseImpl) then,
  ) = __$$ToneRenderResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    bool success,
    String? tone,
    Map<String, dynamic>? rendered,
    bool cached,
  });
}

/// @nodoc
class __$$ToneRenderResponseImplCopyWithImpl<$Res>
    extends _$ToneRenderResponseCopyWithImpl<$Res, _$ToneRenderResponseImpl>
    implements _$$ToneRenderResponseImplCopyWith<$Res> {
  __$$ToneRenderResponseImplCopyWithImpl(
    _$ToneRenderResponseImpl _value,
    $Res Function(_$ToneRenderResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ToneRenderResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? tone = freezed,
    Object? rendered = freezed,
    Object? cached = null,
  }) {
    return _then(
      _$ToneRenderResponseImpl(
        success: null == success
            ? _value.success
            : success // ignore: cast_nullable_to_non_nullable
                  as bool,
        tone: freezed == tone
            ? _value.tone
            : tone // ignore: cast_nullable_to_non_nullable
                  as String?,
        rendered: freezed == rendered
            ? _value._rendered
            : rendered // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>?,
        cached: null == cached
            ? _value.cached
            : cached // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ToneRenderResponseImpl implements _ToneRenderResponse {
  const _$ToneRenderResponseImpl({
    this.success = false,
    this.tone,
    final Map<String, dynamic>? rendered,
    this.cached = false,
  }) : _rendered = rendered;

  factory _$ToneRenderResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ToneRenderResponseImplFromJson(json);

  @override
  @JsonKey()
  final bool success;
  @override
  final String? tone;
  final Map<String, dynamic>? _rendered;
  @override
  Map<String, dynamic>? get rendered {
    final value = _rendered;
    if (value == null) return null;
    if (_rendered is EqualUnmodifiableMapView) return _rendered;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  @JsonKey()
  final bool cached;

  @override
  String toString() {
    return 'ToneRenderResponse(success: $success, tone: $tone, rendered: $rendered, cached: $cached)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ToneRenderResponseImpl &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.tone, tone) || other.tone == tone) &&
            const DeepCollectionEquality().equals(other._rendered, _rendered) &&
            (identical(other.cached, cached) || other.cached == cached));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    success,
    tone,
    const DeepCollectionEquality().hash(_rendered),
    cached,
  );

  /// Create a copy of ToneRenderResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ToneRenderResponseImplCopyWith<_$ToneRenderResponseImpl> get copyWith =>
      __$$ToneRenderResponseImplCopyWithImpl<_$ToneRenderResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ToneRenderResponseImplToJson(this);
  }
}

abstract class _ToneRenderResponse implements ToneRenderResponse {
  const factory _ToneRenderResponse({
    final bool success,
    final String? tone,
    final Map<String, dynamic>? rendered,
    final bool cached,
  }) = _$ToneRenderResponseImpl;

  factory _ToneRenderResponse.fromJson(Map<String, dynamic> json) =
      _$ToneRenderResponseImpl.fromJson;

  @override
  bool get success;
  @override
  String? get tone;
  @override
  Map<String, dynamic>? get rendered;
  @override
  bool get cached;

  /// Create a copy of ToneRenderResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ToneRenderResponseImplCopyWith<_$ToneRenderResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
