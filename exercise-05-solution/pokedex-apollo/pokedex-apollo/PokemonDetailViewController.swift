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
    

}
