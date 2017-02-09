//
//  PokemonDetailViewController.swift
//  pokedex-apollo
//
//  Created by Nikolas Burk on 09/02/17.
//  Copyright © 2017 Nikolas Burk. All rights reserved.
//

import UIKit
import Alamofire

class PokemonDetailViewController: UIViewController {
    
    @IBOutlet weak var pokemonImageView: UIImageView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var imageURLTextField: UITextField!
    
    @IBOutlet weak var saveActivityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var deleteActivityIndicator: UIActivityIndicatorView!
    
    @IBOutlet weak var editAndSaveButton: UIButton!
    
    var pokemonDetails: PokemonDetails! {
        didSet {
            // check if view elements have been set (only relevant when property is first set from PokedexTableViewController)
            if nameTextField != nil && imageURLTextField != nil {
                updateUI()
            }
        }
    }
    
    var isEditingPokemon: Bool = false {
        didSet {
            nameTextField.isEnabled = isEditingPokemon
            imageURLTextField.isEnabled = isEditingPokemon
            editAndSaveButton.setTitle(isEditingPokemon ? "Save" : "Edit", for: .normal)
        }
    }
    
    
    // MARK: View Controller Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Details"
        updateUI()
    }
    
    
    // MARK: Util
    
    func updateUI() {
        nameTextField.text = pokemonDetails.name
        imageURLTextField.text = pokemonDetails.url
        if let pokemonURL = pokemonDetails.url {
            Alamofire.request(pokemonURL).responseImage { [unowned self] response in
                if let image = response.result.value {
                    self.pokemonImageView.image = image
                }
            }
        }
    }
    
    
    // MARK: Actions
    
    @IBAction func editAndSaveButtonPressed() {
        if isEditingPokemon {
            // make sure required data is available
            guard let name = nameTextField.text, name.characters.count > 0,
                let url = imageURLTextField.text, url.characters.count > 0,
                let id = pokemonDetails?.id else {
                    print(#function, "ERROR | Missing data")
                    return
            }
            
            // start activity indicator
            saveActivityIndicator.startAnimating()
            
            // actually perform the mutation
            let updatePokemonMutation = UpdatePokemonMutation(id: id, name: name, url: url)
            apollo.perform(mutation: updatePokemonMutation) { [unowned self] result, error in
                if let error = error {
                    print(#function, "ERROR | Could not update Pokemon: (\(error))")
                }
                else if let pokemonDetails = result?.data?.updatePokemon?.fragments.pokemonDetails {
                    self.pokemonDetails = pokemonDetails
                    self.saveActivityIndicator.stopAnimating()
                    self.isEditingPokemon = !self.isEditingPokemon
                }
            }
        }
        else {
            isEditingPokemon = !isEditingPokemon
        }
    }
    
    @IBAction func deleteButtonPressed() {
        deleteActivityIndicator.startAnimating()
        let deleteMutation = DeletePokemonMutation(id: pokemonDetails.id)
        apollo.perform(mutation: deleteMutation) { [unowned self] result, error in
            self.deleteActivityIndicator.stopAnimating()
            if let error = error {
                print(#function, "ERROR | Could not delete Pokemon: (\(error))")
            }
            else {
                print("Successfully deleted Pokemon")
                let _ = self.navigationController?.popViewController(animated: true)
            }
        }
    }
    
}
