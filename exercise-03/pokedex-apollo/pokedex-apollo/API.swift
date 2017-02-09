//  This file was automatically generated and should not be edited.

import Apollo

public final class TrainerQuery: GraphQLQuery {
  public static let operationDefinition =
    "query Trainer {" +
    "  Trainer(name: \"__NAME__\") {" +
    "    __typename" +
    "    id" +
    "    name" +
    "  }" +
    "}"
  public init() {
  }

  public struct Data: GraphQLMappable {
    public let trainer: Trainer?

    public init(reader: GraphQLResultReader) throws {
      trainer = try reader.optionalValue(for: Field(responseName: "Trainer", arguments: ["name": "__NAME__"]))
    }

    public struct Trainer: GraphQLMappable {
      public let __typename: String
      public let id: GraphQLID
      public let name: String?

      public init(reader: GraphQLResultReader) throws {
        __typename = try reader.value(for: Field(responseName: "__typename"))
        id = try reader.value(for: Field(responseName: "id"))
        name = try reader.optionalValue(for: Field(responseName: "name"))
      }
    }
  }
}