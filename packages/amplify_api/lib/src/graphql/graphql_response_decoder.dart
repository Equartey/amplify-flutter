import 'dart:convert';

import 'package:amplify_api/amplify_api.dart';

class GraphQLResponseDecoder {
  // Singleton methods/properties
  // usage: GraphQLResponseDecoder.instance;
  GraphQLResponseDecoder._();

  static final GraphQLResponseDecoder _instance = GraphQLResponseDecoder._();

  static GraphQLResponseDecoder get instance => _instance;

  GraphQLResponse<T> decode<T>(
      {required GraphQLRequest request,
      required dynamic data,
      required List<GraphQLResponseError> errors}) {
    GraphQLResponse<T> response;

    // if (T is Model) {
    if (request.modelType == null) {
      return GraphQLResponse<T>(data: data, errors: errors);
    }

    Map<String, dynamic> o = json.decode(data);
    request.decodePath?.split(".").forEach((element) {
      o = o[element];
    });
    print(o.toString());
    T res = request.modelType?.fromJson(o) as T;

    return GraphQLResponse<T>(data: res, errors: errors);
  }
}
