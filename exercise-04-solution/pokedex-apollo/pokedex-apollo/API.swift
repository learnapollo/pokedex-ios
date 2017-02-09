//  This file was automatically generated and should not be edited.

import Apollo

public final class TrainerQuery: GraphQLQuery {
  public static let operationDefinition =
    "query Trainer($name: String!) {" +
    "  Trainer(name: $name) {" +
    "    __typename" +
    "    id" +
    "    name" +
    "    ownedPokemons {" +
    "      __typename" +
    "      ...PokemonDetails" +
    "    }" +
    "  }" +
    "}"
  public static let queryDocument = operationDefinition.appending(PokemonDetails.fragmentDefinition)

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
      trainer = try reader.optionalValue(for: Field(responseName: "Trainer", arguments: ["name": reader.variables["name"]]))
    }

    public struct Trainer: GraphQLMappable {
      public let __typename: String
      public let id: GraphQLID
      public let name: String?
      public let ownedPokemons: [OwnedPokemon]?

      public init(reader: GraphQLResultReader) throws {
        __typename = try reader.value(for: Field(responseName: "__typename"))
        id = try reader.value(for: Field(responseName: "id"))
        name = try reader.optionalValue(for: Field(responseName: "name"))
        ownedPokemons = try reader.optionalList(for: Field(responseName: "ownedPokemons"))
      }

      public struct OwnedPokemon: GraphQLMappable {
        public let __typename: String

        public let fragments: Fragments

        public init(reader: GraphQLResultReader) throws {
          __typename = try reader.value(for: Field(responseName: "__typename"))

          let pokemonDetails = try PokemonDetails(reader: reader)
          fragments = Fragments(pokemonDetails: pokemonDetails)
        }

        public struct Fragments {
          public let pokemonDetails: PokemonDetails
        }
      }
    }
  }
}

public struct PokemonDetails: GraphQLNamedFragment {
  public static let fragmentDefinition =
    "fragment PokemonDetails on Pokemon {" +
    "  __typename" +
    "  id" +
    "  name" +
    "  url" +
    "}"

  public static let possibleTypes = ["Pokemon"]

  public let __typename: String
  public let id: GraphQLID
  public let name: String?
  public let url: String?

  public init(reader: GraphQLResultReader) throws {
    __typename = try reader.value(for: Field(responseName: "__typename"))
    id = try reader.value(for: Field(responseName: "id"))
    name = try reader.optionalValue(for: Field(responseName: "name"))
    url = try reader.optionalValue(for: Field(responseName: "url"))
  }
}