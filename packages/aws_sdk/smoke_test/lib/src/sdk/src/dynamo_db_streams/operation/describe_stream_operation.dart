// Generated with smithy-dart 0.1.1. DO NOT MODIFY.

library smoke_test.dynamo_db_streams.operation.describe_stream_operation; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'dart:async' as _i11;

import 'package:aws_common/aws_common.dart' as _i7;
import 'package:aws_signature_v4/aws_signature_v4.dart' as _i4;
import 'package:smithy/smithy.dart' as _i1;
import 'package:smithy_aws/smithy_aws.dart' as _i5;
import 'package:smoke_test/src/sdk/src/dynamo_db_streams/common/endpoint_resolver.dart'
    as _i8;
import 'package:smoke_test/src/sdk/src/dynamo_db_streams/common/serializers.dart'
    as _i6;
import 'package:smoke_test/src/sdk/src/dynamo_db_streams/model/describe_stream_input.dart'
    as _i2;
import 'package:smoke_test/src/sdk/src/dynamo_db_streams/model/describe_stream_output.dart'
    as _i3;
import 'package:smoke_test/src/sdk/src/dynamo_db_streams/model/internal_server_error.dart'
    as _i9;
import 'package:smoke_test/src/sdk/src/dynamo_db_streams/model/resource_not_found_exception.dart'
    as _i10;

/// Returns information about a stream, including the current status of the stream, its Amazon Resource Name (ARN), the composition of its shards, and its corresponding DynamoDB table.
///
/// You can call `DescribeStream` at a maximum rate of 10 times per second.
///
/// Each shard in the stream has a `SequenceNumberRange` associated with it. If the `SequenceNumberRange` has a `StartingSequenceNumber` but no `EndingSequenceNumber`, then the shard is still open (able to receive more stream records). If both `StartingSequenceNumber` and `EndingSequenceNumber` are present, then that shard is closed and can no longer receive more data.
class DescribeStreamOperation extends _i1.HttpOperation<
    _i2.DescribeStreamInput,
    _i2.DescribeStreamInput,
    _i3.DescribeStreamOutput,
    _i3.DescribeStreamOutput> {
  /// Returns information about a stream, including the current status of the stream, its Amazon Resource Name (ARN), the composition of its shards, and its corresponding DynamoDB table.
  ///
  /// You can call `DescribeStream` at a maximum rate of 10 times per second.
  ///
  /// Each shard in the stream has a `SequenceNumberRange` associated with it. If the `SequenceNumberRange` has a `StartingSequenceNumber` but no `EndingSequenceNumber`, then the shard is still open (able to receive more stream records). If both `StartingSequenceNumber` and `EndingSequenceNumber` are present, then that shard is closed and can no longer receive more data.
  DescribeStreamOperation({
    required String region,
    Uri? baseUri,
    _i4.AWSCredentialsProvider credentialsProvider =
        const _i4.AWSCredentialsProvider.environment(),
  })  : _region = region,
        _baseUri = baseUri,
        _credentialsProvider = credentialsProvider;

  @override
  late final List<
      _i1.HttpProtocol<_i2.DescribeStreamInput, _i2.DescribeStreamInput,
          _i3.DescribeStreamOutput, _i3.DescribeStreamOutput>> protocols = [
    _i5.AwsJson1_0Protocol(
      serializers: _i6.serializers,
      builderFactories: _i6.builderFactories,
      requestInterceptors: [
        const _i1.WithHost(),
        const _i1.WithContentLength(),
        const _i1.WithHeader(
          'X-Amz-Target',
          'DynamoDBStreams_20120810.DescribeStream',
        ),
        _i5.WithSigV4(
          region: _region,
          service: _i7.AWSService.dynamoDbStreams,
          credentialsProvider: _credentialsProvider,
        ),
        const _i1.WithUserAgent('aws-sdk-dart/0.1.1'),
        const _i5.WithSdkInvocationId(),
        const _i5.WithSdkRequest(),
      ],
      responseInterceptors: [],
    )
  ];

  late final _i5.AWSEndpoint _awsEndpoint = _i8.endpointResolver.resolve(
    _i8.sdkId,
    _region,
  );

  final String _region;

  final Uri? _baseUri;

  final _i4.AWSCredentialsProvider _credentialsProvider;

  @override
  _i1.HttpRequest buildRequest(_i2.DescribeStreamInput input) =>
      _i1.HttpRequest((b) {
        b.method = 'POST';
        b.path = r'/';
      });
  @override
  int successCode([_i3.DescribeStreamOutput? output]) => 200;
  @override
  _i3.DescribeStreamOutput buildOutput(
    _i3.DescribeStreamOutput payload,
    _i7.AWSStreamedHttpResponse response,
  ) =>
      _i3.DescribeStreamOutput.fromResponse(
        payload,
        response,
      );
  @override
  List<_i1.SmithyError> get errorTypes => const [
        _i1.SmithyError(
          _i1.ShapeId(
            namespace: 'com.amazonaws.dynamodbstreams',
            shape: 'InternalServerError',
          ),
          _i1.ErrorKind.server,
          _i9.InternalServerError,
          builder: _i9.InternalServerError.fromResponse,
        ),
        _i1.SmithyError(
          _i1.ShapeId(
            namespace: 'com.amazonaws.dynamodbstreams',
            shape: 'ResourceNotFoundException',
          ),
          _i1.ErrorKind.client,
          _i10.ResourceNotFoundException,
          builder: _i10.ResourceNotFoundException.fromResponse,
        ),
      ];
  @override
  _i5.AWSRetryer get retryer => _i5.AWSRetryer();
  @override
  Uri get baseUri => _baseUri ?? endpoint.uri;
  @override
  _i1.Endpoint get endpoint => _awsEndpoint.endpoint;
  @override
  _i11.Future<_i3.DescribeStreamOutput> run(
    _i2.DescribeStreamInput input, {
    _i1.HttpClient? client,
    _i1.ShapeId? useProtocol,
  }) {
    return _i11.runZoned(
      () => super.run(
        input,
        client: client,
        useProtocol: useProtocol,
      ),
      zoneValues: {
        ...?_awsEndpoint.credentialScope?.zoneValues,
        ...{_i7.AWSHeaders.sdkInvocationId: _i7.uuid(secure: true)}
      },
    );
  }
}