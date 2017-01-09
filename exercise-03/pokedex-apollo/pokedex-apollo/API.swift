//  This file was automatically generated and should not be edited.

import Apollo

public final class TrainerQuery: GraphQLQuery {
  public static let operationDefinition =
    "query Trainer {" +
    "  Trainer(name: \"__NAME__\") {" +
    "    id" +
    "    name" +
    "  }" +
    "}"
  public init() {
  }

  public struct Data: GraphQLMappable {
    public let trainer: Trainer?

    public init(reader: GraphQLResultReader) throws {
      trainer = try reader.optionalValue(for: Field(responseName: "Trainer"))
    }

    public struct Trainer: GraphQLMappable {
      public let __typename = "Trainer"
      public let id: GraphQLID
      public let name: String?

      public init(reader: GraphQLResultReader) throws {
        id = try reader.value(for: Field(responseName: "id"))
        name = try reader.optionalValue(for: Field(responseName: "name"))
      }
    }
  }
}