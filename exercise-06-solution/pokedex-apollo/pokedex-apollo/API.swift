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

  public struct Data: GraphQLMapDecodable {
    public let createPokemon: CreatePokemon?

    public init(map: GraphQLMap) throws {
      createPokemon = try map.optionalValue(forKey: "createPokemon")
    }

    public struct CreatePokemon: GraphQLMapDecodable {
      public let __typename = "Pokemon"

      public let fragments: Fragments

      public init(map: GraphQLMap) throws {
        let pokemonDetails = try PokemonDetails(map: map)
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

        public let fragments: Fragments

        public init(map: GraphQLMap) throws {
          let pokemonDetails = try PokemonDetails(map: map)
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

  public struct Data: GraphQLMapDecodable {
    public let updatePokemon: UpdatePokemon?

    public init(map: GraphQLMap) throws {
      updatePokemon = try map.optionalValue(forKey: "updatePokemon")
    }

    public struct UpdatePokemon: GraphQLMapDecodable {
      public let __typename = "Pokemon"

      public let fragments: Fragments

      public init(map: GraphQLMap) throws {
        let pokemonDetails = try PokemonDetails(map: map)
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

  public struct Data: GraphQLMapDecodable {
    public let deletePokemon: DeletePokemon?

    public init(map: GraphQLMap) throws {
      deletePokemon = try map.optionalValue(forKey: "deletePokemon")
    }

    public struct DeletePokemon: GraphQLMapDecodable {
      public let __typename = "Pokemon"
      public let id: GraphQLID

      public init(map: GraphQLMap) throws {
        id = try map.value(forKey: "id")
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

  public init(map: GraphQLMap) throws {
    id = try map.value(forKey: "id")
    name = try map.optionalValue(forKey: "name")
    url = try map.optionalValue(forKey: "url")
  }
}