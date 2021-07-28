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

import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_api/src/graphql/graphql_request_factory.dart';
import 'package:flutter_test/flutter_test.dart';

import 'resources/Blog.dart';
import 'resources/ModelProvider.dart';

void main() {
  test("ModelQueries.get() should craft a valid request", () {
    AmplifyAPI api = AmplifyAPI(modelProvider: ModelProvider.instance);

    String id = UUID.getUUID();
    String expected =
        "query getBlog(\$id: ID!) { getBlog(id: \$id) { id name createdAt } }";

    GraphQLRequest<Blog> req = ModelQueries.get<Blog>(Blog.classType, id);

    expect(req.document, expected);
    expect(req.variables.containsValue(id), true);
  });

  test("should handle no ModelProvider instance", () {
    AmplifyAPI api = AmplifyAPI();
    try {
      GraphQLRequest<Blog> req = ModelQueries.get<Blog>(Blog.classType, "");
    } on ApiException catch (e) {
      expect(e.message, "No modelProvider found");
      expect(e.recoverySuggestion,
          "Pass in a modelProvider instance while instantiating APIPlugin");
      return;
    }
    throw new Exception("Expected an ApiException");
  });

  test('Query returns a decoded ModelType when provided a type', () async {
    const queryResult = {
      'id': 'ec0c71cb-8b88-4c57-86d7-6758bf4cba4a',
      'name': 'Test Blog 1',
      'createdAt': '2020-12-10T21:25:51.252Z'
    };

    String id = UUID.getUUID();
    GraphQLRequest<Blog> req = ModelQueries.get<Blog>(Blog.classType, id);
    List<GraphQLResponseError> errors = [];
    String data = '''{
        "getBlog": {
            "createdAt": "2021-07-21T22: 23: 33.707Z",
            "id": "f70d1142-12da-4564-a699-966a75f96db6",
            "name": "TestAppBlog"
        }
    }''';

    GraphQLResponse<Blog> response = GraphQLResponseDecoder.instance
        .decode<Blog>(request: req, data: data, errors: errors);
  });
}
