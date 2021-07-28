/*
 * Copyright 2021 Amazon.com, Inc. or its affiliates. All Rights Reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License").
 * You may not use this file except in compliance with the License.
 * A copy of the License is located at
 *
 *  http://aws.amazon.com/apache2.0
 *
 * or in the "license" file accompanying this file. This file is distributed
 * on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
 * express or implied. See the License for the specific language governing
 * permissions and limitations under the License.
 */

import 'dart:convert';

import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_datastore_plugin_interface/amplify_datastore_plugin_interface.dart';
import 'package:flutter/foundation.dart';

class GraphQLRequestFactory {
  String _getModelType(ModelFieldTypeEnum? val) {
    switch (val) {
      case ModelFieldTypeEnum.string:
        return "String";
      case ModelFieldTypeEnum.int:
        return "int";
      case ModelFieldTypeEnum.model:
        return "ID";
      default:
        return "Error: UnknownType!";
    }
  }

  String _getFieldsFromModelType(ModelSchema schema) {
    Map<String, ModelField> fieldsMap = schema.fields!;
    return fieldsMap.entries
        .map((entry) => entry.value.association == null ? entry.key : '')
        .toList()
        .join(' ');
  }

  ModelSchema _getAndValidateSchema(
      ModelType modelType, GraphQLRequestOperation operation) {
    ModelProviderInterface? provider = AmplifyAPI.instance.getModelProvider();

    if (provider == null) {
      throw ApiException('No modelProvider found',
          recoverySuggestion:
              'Pass in a modelProvider instance while instantiating APIPlugin');
    }

    ModelSchema schema = provider.modelSchemas.firstWhere(
        (elem) => provider.getModelTypeByModelName(elem.name) == modelType,
        orElse: () => throw ApiException(
            'No schema found for the ModelType provided',
            recoverySuggestion:
                'Pass in a valid modelProvider instance while instantiating APIPlugin or provide a valid ModelType'));

    if (schema.fields == null) {
      throw ApiException('Schema found does not have a fields property',
          recoverySuggestion:
              'Pass in a valid modelProvider instance while instantiating APIPlugin');
    }

    if (operation == GraphQLRequestOperation.list &&
        schema.pluralName == null) {
      throw ApiException('No schema name found',
          recoverySuggestion:
              'Pass in a valid modelProvider instance while instantiating APIPlugin or provide a valid ModelType');
    }

    return schema;
  }

  /*
   *  buildQuery()
   *
   *  
   *  Example: 
   *    query getBlog($id: ID!) { getBlog(id: $id) { id name createdAt } }
  */
  GraphQLRequest<T> buildQuery<T extends Model>(
      {required ModelType modelType,
      required Map<String, String>? variableInput,
      required String? id,
      required GraphQLRequestType requestType,
      required GraphQLRequestOperation requestOperation}) {
    ModelSchema schema = _getAndValidateSchema(modelType, requestOperation);

    String name = schema.name;

    // fields to retrieve, e.g. "id name createdAt"
    String fields = _getFieldsFromModelType(schema);

    // e.g. "query"
    String requestTypeVal = describeEnum(requestType.toString());
    // e.g. "get"
    String requestOperationVal = describeEnum(requestOperation.toString());

    // Upper document input: ($id: ID!)
    var varInputUpperStr = '';
    // Lower document input: (id: $id)
    var varInputLowerStr = '';

    if (variableInput != null && variableInput.isNotEmpty) {
      List<String> variableInputUpper = [];
      List<String> variableInputLower = [];

      variableInput.forEach((key, value) {
        variableInputUpper.add("\$$key: $value!");
        variableInputLower.add("$key: \$$key");
      });

      varInputUpperStr = "(${variableInputUpper.join(", ")})";
      if (requestOperation == GraphQLRequestOperation.get) {
        varInputLowerStr = "(${variableInputLower.join(", ")})";
      } else {
        varInputLowerStr = "(input: { ${variableInputLower.join(", ")} })";
      }
    }

    if (requestOperation == GraphQLRequestOperation.list) {
      name = schema.pluralName!;
      fields = 'items { $fields } nextToken';
    }

    String doc =
        '''$requestTypeVal $requestOperationVal$name${varInputUpperStr} { $requestOperationVal$name$varInputLowerStr { $fields } }''';

    // TODO: create input map for variables & connect with current variableInput
    Map<String, dynamic>? variables = id != null ? {"id": id} : {};

    return GraphQLRequest<T>(document: doc, variables: variables);
  }
}

class GraphQLResponseDecoder implements GraphQLResponseDecoderInterface {
  // Singleton methods/properties
  // usage: GraphQLResponseDecoder.instance;
  GraphQLResponseDecoder._();

  static final GraphQLResponseDecoder _instance = GraphQLResponseDecoder._();

  static GraphQLResponseDecoder get instance => _instance;

  @override
  GraphQLResponse<T> decode<T>(
      {required GraphQLRequest request,
      required dynamic data,
      required List<GraphQLResponseError> errors}) {
    GraphQLResponse<T> response;

    // if (T is DataStoreDependency.Model) {
    if (request.modelType != null) {
      Map<String, dynamic> o = json.decode(data);
      request.decodePath?.split(".").forEach((element) {
        o = o[element];
      });

      // need a check to ensure modelType
      T res = request.modelType?.fromJson(o) as T;
      response = GraphQLResponse<T>(data: res, errors: errors);
    } else {
      response = GraphQLResponse<T>(data: data, errors: errors);
    }

    return response;
  }
}
