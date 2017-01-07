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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Details"
    }

  
}
