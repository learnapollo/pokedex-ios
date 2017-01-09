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
    
    var trainer: TrainerQuery.Data.Trainer? {
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
        apollo.fetch(query: trainerQuery) { (result: GraphQLResult?, error: Error?) in
            if let error = error {
                print(#function, "ERROR | An error occured: \(error)")
                return
            }
            guard let trainer = result?.data?.trainer else {
                print(#function, "ERROR | Could not retrieve trainer")
                return
            }
            self.trainer = trainer
        }
    }
    
    
    // MARK: Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return Sections.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == Sections.greeting.rawValue {
            return 1
        }
        return trainer?.ownedPokemons.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case Sections.greeting.rawValue:
            let greetingString: String
            if let name = trainer?.name,
               let ownedPokemons = trainer?.ownedPokemons {
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
            if let ownedPokemons = trainer?.ownedPokemons {
                cell.ownedPokemon = ownedPokemons[indexPath.row]
            }
            return cell
        default:
            fatalError("ERROR: Unknown section")
        }
        
    }
    
    
}
