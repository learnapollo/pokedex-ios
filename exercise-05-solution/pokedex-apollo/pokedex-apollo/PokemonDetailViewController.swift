//
//  PokemonDetailViewController.swift
//  pokedex-apollo
//
//  Created by Nikolas Burk on 07/01/17.
//  Copyright © 2017 Nikolas Burk. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class PokemonDetailViewController: UIViewController {

    @IBOutlet weak var pokemonImageView: UIImageView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var imageURLTextField: UITextField!
    
    @IBOutlet weak var editActivityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var saveActivityIndicator: UIActivityIndicatorView!
    
    var pokemonDetails: PokemonDetails!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Details"
        updateUI()
    }

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
