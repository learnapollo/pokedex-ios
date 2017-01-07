//
//  CreatePokemonViewController.swift
//  pokedex-apollo
//
//  Created by Nikolas Burk on 06/01/17.
//  Copyright © 2017 Nikolas Burk. All rights reserved.
//

import UIKit
import Apollo

class CreatePokemonViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var imageURLTextField: UITextField!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var trainerId: GraphQLID!
    
    
    // MARK: View controller life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    // MARK: Util
    
    func addPokemon() {
        guard let name = nameTextField.text,
            let imageURL = imageURLTextField.text else {
                print(#function, "ERROR | Please provide name and image URL for the new Pokemon")
                return
        }
    }
    
    
    // MARK: Actions
    
    @IBAction func saveButtonPressed() {
        addPokemon()
    }
    
    @IBAction func cancelButtonPressed() {
        presentingViewController?.dismiss(animated: true)
    }
    
    
    
}
