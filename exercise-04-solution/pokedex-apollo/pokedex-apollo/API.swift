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

  public struct Data: GraphQLMappable {
    public let createPokemon: CreatePokemon?

    public init(reader: GraphQLResultReader) throws {
      createPokemon = try reader.optionalValue(for: Field(responseName: "createPokemon"))
    }

    public struct CreatePokemon: GraphQLMappable {
      public let __typename = "Pokemon"
      public let id: GraphQLID
      public let name: String?
      public let url: String?

      public init(reader: GraphQLResultReader) throws {
        id = try reader.value(for: Field(responseName: "id"))
        name = try reader.optionalValue(for: Field(responseName: "name"))
        url = try reader.optionalValue(for: Field(responseName: "url"))
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

  public struct Data: GraphQLMappable {
    public let trainer: Trainer?

    public init(reader: GraphQLResultReader) throws {
      trainer = try reader.optionalValue(for: Field(responseName: "Trainer"))
    }

    public struct Trainer: GraphQLMappable {
      public let __typename = "Trainer"
      public let id: GraphQLID
      public let name: String?
      public let ownedPokemons: [OwnedPokemon]

      public init(reader: GraphQLResultReader) throws {
        id = try reader.value(for: Field(responseName: "id"))
        name = try reader.optionalValue(for: Field(responseName: "name"))
        ownedPokemons = try reader.list(for: Field(responseName: "ownedPokemons"))
      }

      public struct OwnedPokemon: GraphQLMappable {
        public let __typename = "Pokemon"
        public let id: GraphQLID
        public let name: String?
        public let url: String?

        public init(reader: GraphQLResultReader) throws {
          id = try reader.value(for: Field(responseName: "id"))
          name = try reader.optionalValue(for: Field(responseName: "name"))
          url = try reader.optionalValue(for: Field(responseName: "url"))
        }
      }
    }
  }
}