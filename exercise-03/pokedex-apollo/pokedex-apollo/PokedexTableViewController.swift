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

    var trainer: TrainerQuery.Data.Trainer? {
        didSet {
            tableView.reloadData()
        }
    }
    
    
    // MARK: View controller lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchTrainer()
    }
    
    
    // MARK: Data fetching
    
    func fetchTrainer() {
        let trainerQuery = TrainerQuery()
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
        return 2
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }
        return 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let greetingString: String
            if let name = trainer?.name {
                greetingString = "Hello \(name), you have 0 Pokemons in your Pokedex."
            }
            else {
                greetingString = "Hello, you have 0 Pokemons in your Pokedex."
            }
            let cell = tableView.dequeueReusableCell(withIdentifier: "GreetingCell", for: indexPath) as! GreetingCell
            cell.greetingLabel.text = greetingString
            return cell
        case 1:
            fatalError("ERROR: Not yet implemented")
        default:
            fatalError("ERROR: Unknown section")
        }
        
    }
    
    
}
