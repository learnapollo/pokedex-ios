//  This file was automatically generated and should not be edited.

import Apollo

public final class CreatePokemonMutation: GraphQLMutation {
  public static let operationDefinition =
    "mutation CreatePokemon($name: String!, $url: String!, $trainerId: ID) {" +
    "  createPokemon(name: $name, url: $url, trainerId: $trainerId) {" +
    "    ...PokemonDetails" +
    "  }" +
    "}"
  public static let queryDocument = operationDefinition.appending(PokemonDetails.fragmentDefinition)

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

      public let fragments: Fragments

      public init(reader: GraphQLResultReader) throws {
        let pokemonDetails = try PokemonDetails(reader: reader)
        fragments = Fragments(pokemonDetails: pokemonDetails)
      }

      public struct Fragments {
        public let pokemonDetails: PokemonDetails
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

        public let fragments: Fragments

        public init(reader: GraphQLResultReader) throws {
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

public final class UpdatePokemonMutation: GraphQLMutation {
  public static let operationDefinition =
    "mutation UpdatePokemon($id: ID!, $name: String!, $url: String!) {" +
    "  updatePokemon(id: $id, name: $name, url: $url) {" +
    "    ...PokemonDetails" +
    "  }" +
    "}"
  public static let queryDocument = operationDefinition.appending(PokemonDetails.fragmentDefinition)

  public let id: GraphQLID
  public let name: String
  public let url: String

  public init(id: GraphQLID, name: String, url: String) {
    self.id = id
    self.name = name
    self.url = url
  }

  public var variables: GraphQLMap? {
    return ["id": id, "name": name, "url": url]
  }

  public struct Data: GraphQLMappable {
    public let updatePokemon: UpdatePokemon?

    public init(reader: GraphQLResultReader) throws {
      updatePokemon = try reader.optionalValue(for: Field(responseName: "updatePokemon"))
    }

    public struct UpdatePokemon: GraphQLMappable {
      public let __typename = "Pokemon"

      public let fragments: Fragments

      public init(reader: GraphQLResultReader) throws {
        let pokemonDetails = try PokemonDetails(reader: reader)
        fragments = Fragments(pokemonDetails: pokemonDetails)
      }

      public struct Fragments {
        public let pokemonDetails: PokemonDetails
      }
    }
  }
}

public final class DeletePokemonMutation: GraphQLMutation {
  public static let operationDefinition =
    "mutation DeletePokemon($id: ID!) {" +
    "  deletePokemon(id: $id) {" +
    "    id" +
    "  }" +
    "}"

  public let id: GraphQLID

  public init(id: GraphQLID) {
    self.id = id
  }

  public var variables: GraphQLMap? {
    return ["id": id]
  }

  public struct Data: GraphQLMappable {
    public let deletePokemon: DeletePokemon?

    public init(reader: GraphQLResultReader) throws {
      deletePokemon = try reader.optionalValue(for: Field(responseName: "deletePokemon"))
    }

    public struct DeletePokemon: GraphQLMappable {
      public let __typename = "Pokemon"
      public let id: GraphQLID

      public init(reader: GraphQLResultReader) throws {
        id = try reader.value(for: Field(responseName: "id"))
      }
    }
  }
}

public struct PokemonDetails: GraphQLNamedFragment {
  public static let fragmentDefinition =
    "fragment PokemonDetails on Pokemon {" +
    "  id" +
    "  name" +
    "  url" +
    "}"

  public static let possibleTypes = ["Pokemon"]

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