//
//  PokedexTableViewController.swift
//  pokedex-apollo
//
//  Created by Nikolas Burk on 06/01/17.
//  Copyright © 2017 Nikolas Burk. All rights reserved.
//

import UIKit
import Apollo

class PokedexTableViewController: UITableViewController {
    
    enum Sections: Int {
        case greeting
        case pokemons
        
        static let count = 2
    }
    
    var trainerId: GraphQLID?
    
    var trainerName: String? {
        didSet {
            tableView.reloadSections([Sections.greeting.rawValue], with: .none)
        }
    }
    
    var ownedPokemons: [PokemonDetails]? = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    
    // MARK: View controller life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchTrainer()
    }
    
    
    // MARK: Data fetching
    
    func fetchTrainer() {
        let trainerQuery = TrainerQuery(name: "__NAME__")
        apollo.fetch(query: trainerQuery) { [unowned self] (result: GraphQLResult?, error: Error?) in
            if let error = error {
                print(#function, "ERROR | An error occured: \(error)")
                return
            }
            guard let trainer = result?.data?.trainer else {
                print(#function, "ERROR | Could not retrieve trainer")
                return
            }
            self.setTrainerData(trainer: trainer)
        }
    }
    
    func setTrainerData(trainer: TrainerQuery.Data.Trainer) {
        self.trainerId = trainer.id
        self.trainerName = trainer.name
        self.ownedPokemons = trainer.ownedPokemons.map { $0.fragments.pokemonDetails }
    }
    
    
    // MARK: Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return Sections.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == Sections.greeting.rawValue {
            return 1
        }
        return ownedPokemons?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case Sections.greeting.rawValue:
            let greetingString: String
            if let name = trainerName,
               let ownedPokemons = ownedPokemons {
                greetingString = "Hello \(name), you have \(ownedPokemons.count) Pokemons in your Pokedex."
            }
            else {
                greetingString = "Hello, are you even a trainer?!"
            }
            let cell = tableView.dequeueReusableCell(withIdentifier: "GreetingCell", for: indexPath) as! GreetingCell
            cell.greetingLabel.text = greetingString
            return cell
        case Sections.pokemons.rawValue:
            let cell = tableView.dequeueReusableCell(withIdentifier: "PokemonCell", for: indexPath) as! PokemonCell
            if let ownedPokemons = ownedPokemons {
                cell.ownedPokemon = ownedPokemons[indexPath.row]
            }
            return cell
        default:
            fatalError("ERROR: Unknown section")
        }
        
    }
    
    
    // MARK: Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "CreateNewPokemonSegue" {
            let createPokemonViewController = segue.destination as! CreatePokemonViewController
            createPokemonViewController.trainerId = trainerId
            createPokemonViewController.addedNewPokemon = { [unowned self] in self.ownedPokemons?.append($0) }
        }
        else if segue.identifier == "ShowPokemonDetailsSegue" {
            let pokemonDetailViewController = segue.destination as! PokemonDetailViewController
            let selectedRow = tableView.indexPathForSelectedRow!.row
            pokemonDetailViewController.pokemonDetails = ownedPokemons?[selectedRow]
        }
    }

    
}
