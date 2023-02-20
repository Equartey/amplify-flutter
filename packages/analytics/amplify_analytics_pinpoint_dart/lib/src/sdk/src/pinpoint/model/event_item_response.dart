// Generated with smithy-dart 0.3.1. DO NOT MODIFY.

library amplify_analytics_pinpoint_dart.pinpoint.model.event_item_response; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:aws_common/aws_common.dart' as _i1;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:smithy/smithy.dart' as _i2;

part 'event_item_response.g.dart';

/// Provides the status code and message that result from processing an event.
abstract class EventItemResponse
    with _i1.AWSEquatable<EventItemResponse>
    implements Built<EventItemResponse, EventItemResponseBuilder> {
  /// Provides the status code and message that result from processing an event.
  factory EventItemResponse({
    String? message,
    int? statusCode,
  }) {
    statusCode ??= 0;
    return _$EventItemResponse._(
      message: message,
      statusCode: statusCode,
    );
  }

  /// Provides the status code and message that result from processing an event.
  factory EventItemResponse.build(
      [void Function(EventItemResponseBuilder) updates]) = _$EventItemResponse;

  const EventItemResponse._();

  static const List<_i2.SmithySerializer> serializers = [
    EventItemResponseRestJson1Serializer()
  ];

  @BuiltValueHook(initializeBuilder: true)
  static void _init(EventItemResponseBuilder b) {
    b.statusCode = 0;
  }

  /// A custom message that's returned in the response as a result of processing the event.
  String? get message;

  /// The status code that's returned in the response as a result of processing the event. Possible values are: 202, for events that were accepted; and, 400, for events that weren't valid.
  int get statusCode;
  @override
  List<Object?> get props => [
        message,
        statusCode,
      ];
  @override
  String toString() {
    final helper = newBuiltValueToStringHelper('EventItemResponse');
    helper.add(
      'message',
      message,
    );
    helper.add(
      'statusCode',
      statusCode,
    );
    return helper.toString();
  }
}

class EventItemResponseRestJson1Serializer
    extends _i2.StructuredSmithySerializer<EventItemResponse> {
  const EventItemResponseRestJson1Serializer() : super('EventItemResponse');

  @override
  Iterable<Type> get types => const [
        EventItemResponse,
        _$EventItemResponse,
      ];
  @override
  Iterable<_i2.ShapeId> get supportedProtocols => const [
        _i2.ShapeId(
          namespace: 'aws.protocols',
          shape: 'restJson1',
        )
      ];
  @override
  EventItemResponse deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = EventItemResponseBuilder();
    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'Message':
          if (value != null) {
            result.message = (serializers.deserialize(
              value,
              specifiedType: const FullType(String),
            ) as String);
          }
          break;
        case 'StatusCode':
          result.statusCode = (serializers.deserialize(
            value!,
            specifiedType: const FullType(int),
          ) as int);
          break;
      }
    }

    return result.build();
  }

  @override
  Iterable<Object?> serialize(
    Serializers serializers,
    Object? object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final payload = (object as EventItemResponse);
    final result = <Object?>[
      'StatusCode',
      serializers.serialize(
        payload.statusCode,
        specifiedType: const FullType(int),
      ),
    ];
    if (payload.message != null) {
      result
        ..add('Message')
        ..add(serializers.serialize(
          payload.message!,
          specifiedType: const FullType(String),
        ));
    }
    return result;
  }
}