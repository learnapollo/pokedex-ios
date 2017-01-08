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

  public struct Data: GraphQLMapDecodable {
    public let trainer: Trainer?

    public init(map: GraphQLMap) throws {
      trainer = try map.optionalValue(forKey: "Trainer")
    }

    public struct Trainer: GraphQLMapDecodable {
      public let __typename = "Trainer"
      public let id: GraphQLID
      public let name: String?

      public init(map: GraphQLMap) throws {
        id = try map.value(forKey: "id")
        name = try map.optionalValue(forKey: "name")
      }
    }
  }
}