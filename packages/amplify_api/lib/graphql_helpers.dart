import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_datastore_plugin_interface/amplify_datastore_plugin_interface.dart';

class GraphQLHelpers {
  /*
   * Helpers
   */
  static String _getModelType(ModelFieldTypeEnum val) {
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

  static String _getOperatorValue(String type) {
    // too much transforming we should use our own enum
    if (type == "equal") return "eq";
    if (type == "not_equal") return "ne";
    if (type == "contains") return "contains";
    if (type == "between") return "between";
    if (type == "begins_with") return "beginsWith";

    return "QueryFieldOperatorType not yet supported";
  }

  static _getFuncParam(String key, ModelFieldTypeEnum fieldType) {
    return "\$$key: ${_getModelType(fieldType)}!";
  }

  static _getStmtParam(String key) {
    return "$key: \$$key";
  }

  /*
   * Request Builders
   */
  static GraphQLRequest<T> get<T extends Model>(
      ModelType modelType, ModelSchema schema, String id) {
    var modelName = schema.name;
    var fieldsMap = schema.fields;

    List<String> fieldsList = [];
    if (fieldsMap != null) {
      fieldsMap.forEach((key, value) {
        if (value.association == null) fieldsList.add(key);
      });
    }

    String doc = '''query Get$modelName(\$id: ID!) {
      $modelName: get$modelName(id: \$id) {
        ${fieldsList.join('\n')}
      }
    }
    ''';

    var variables = {"id": id};
    print(doc);
    return GraphQLRequest<T>(
        document: doc,
        variables: variables,
        castPath: "$modelName",
        modelType: modelType);
  }

  static GraphQLRequest<T> list<T>(ModelSchema schema, {QueryPredicate where}) {
    Map<String, dynamic> whereMap =
        where != null ? where.serializeAsMap() : null;

    var modelName = schema.pluralName;
    var fieldsMap = schema.fields;
    var filterPredicate = "filter: ";

    List<String> fieldsList = [];
    if (fieldsMap != null) {
      fieldsMap.forEach((key, value) {
        if (value.association == null) fieldsList.add(key);
      });
    }

    if (whereMap != null) {
      // print(where.serializeAsMap().toString());
      Map<String, dynamic> whereMap = where.serializeAsMap();
      String field =
          whereMap["queryPredicateOperation"]["field"].split(".").last;
      String operator = _getOperatorValue(
          whereMap["queryPredicateOperation"]["fieldOperator"]["operatorName"]);
      String value =
          whereMap["queryPredicateOperation"]["fieldOperator"]["value"];
      filterPredicate += "{ $field: { $operator: \"$value\" }}";
    }
    // print(filterPredicate);
    String doc = '''query Query$modelName {
      list$modelName${where != null ? "($filterPredicate)" : ""} {
        items {
          ${fieldsList.join('\n')}
        }
      }
    }
    ''';

    print(doc);
    return GraphQLRequest<T>(document: doc);
  }

  static GraphQLRequest create<T>(Model model, ModelSchema schema) {
    ModelType modelType = model.getInstanceType();
    // ModelSchema sch = model.schema; // want this to work

    // ModelSchema schema = _getSchema(modelType);
    print("SCHEME: " + schema.toJson());
    var modelName = schema.name;
    var fieldsMap = schema.fields;

    List<String> fieldsList = [];
    List<String> funcParamList = [];
    List<String> statementParamList = [];
    Map<String, dynamic> variables = {};

    if (fieldsMap == null) {
      return null;
    }

    fieldsMap.forEach((field, val) {
      // DECISION: exclude nested properties?
      if (val.association == null) fieldsList.add(field);

      // need to know how to accurately exclude ids since fieldType are strings
      if (val.isRequired && val.name != 'id') {
        funcParamList.add(_getFuncParam(field, val.type.fieldType));
        statementParamList.add(_getStmtParam(field));
      }

      // Model has a BelongsTo relationship
      // if (val.association != null && val.association.associationType == ModelAssociationEnum.BelongsTo){
      //   funcParamList.add(_getFuncParam(val.association.targetName, val.type.fieldType));
      //   statementParamList.add(_getStmtParam(val.association.targetName));
      //   // TODO: Get child model name
      //   variables[val.association.targetName] = model.toJson()[field]["id"];
      // } else if(model.toJson()[field] != null && val.name != 'id'){
      //   variables[field] = model.toJson()[field];
      // }
    });

    String doc = '''mutation Create$modelName(${funcParamList.join(", ")}) {
        create$modelName(input: {${statementParamList.join(", ")}}) {
          ${fieldsList.join('\n')}
        }
      }
    ''';

    print("create$modelName Doc: " + doc);
    print("create$modelName Var: " +
        variables.toString()); // id is included but gets overriden by appsync

    return GraphQLRequest<T>(document: doc, variables: variables);
  }
}
