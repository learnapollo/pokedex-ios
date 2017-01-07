//  This file was automatically generated and should not be edited.

import Apollo

public final class CreatePokemonMutation: GraphQLMutation {
  public static let operationDefinition =
    "mutation CreatePokemon($name: String!, $url: String!, $trainerId: ID) {" +
    "  createPokemon(name: $name, url: $url, trainerId: $trainerId) {" +
    "    id" +
    "    name" +
    "    url" +
    "  }" +
    "}"

  public let name: String
  public let url: String
  public let trainerId: GraphQLID?

  public init(name: String, url: String, trainerId: GraphQLID? = nil) {
    self.name = name
    self.url = url
    self.trainerId = trainerId
  }

  public var variables: GraphQLMap? {
    return ["name": name, "url": url, "trainerId": trainerId]
  }

  public struct Data: GraphQLMapDecodable {
    public let createPokemon: CreatePokemon?

    public init(map: GraphQLMap) throws {
      createPokemon = try map.optionalValue(forKey: "createPokemon")
    }

    public struct CreatePokemon: GraphQLMapDecodable {
      public let __typename = "Pokemon"
      public let id: GraphQLID
      public let name: String?
      public let url: String?

      public init(map: GraphQLMap) throws {
        id = try map.value(forKey: "id")
        name = try map.optionalValue(forKey: "name")
        url = try map.optionalValue(forKey: "url")
      }
    }
  }
}

public final class TrainerQuery: GraphQLQuery {
  public static let operationDefinition =
    "query Trainer($name: String!) {" +
    "  Trainer(name: $name) {" +
    "    id" +
    "    name" +
    "    ownedPokemons {" +
    "      id" +
    "      name" +
    "      url" +
    "    }" +
    "  }" +
    "}"

  public let name: String

  public init(name: String) {
    self.name = name
  }

  public var variables: GraphQLMap? {
    return ["name": name]
  }

  public struct Data: GraphQLMapDecodable {
    public let trainer: Trainer?

    public init(map: GraphQLMap) throws {
      trainer = try map.optionalValue(forKey: "Trainer")
    }

    public struct Trainer: GraphQLMapDecodable {
      public let __typename = "Trainer"
      public let id: GraphQLID
      public let name: String?
      public let ownedPokemons: [OwnedPokemon]?

      public init(map: GraphQLMap) throws {
        id = try map.value(forKey: "id")
        name = try map.optionalValue(forKey: "name")
        ownedPokemons = try map.list(forKey: "ownedPokemons")
      }

      public struct OwnedPokemon: GraphQLMapDecodable {
        public let __typename = "Pokemon"
        public let id: GraphQLID
        public let name: String?
        public let url: String?

        public init(map: GraphQLMap) throws {
          id = try map.value(forKey: "id")
          name = try map.optionalValue(forKey: "name")
          url = try map.optionalValue(forKey: "url")
        }
      }
    }
  }
}
