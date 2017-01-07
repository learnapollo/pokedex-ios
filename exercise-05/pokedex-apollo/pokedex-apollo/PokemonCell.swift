//
//  PokemonCell.swift
//  pokedex-apollo
//
//  Created by Nikolas Burk on 06/01/17.
//  Copyright © 2017 Nikolas Burk. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class PokemonCell: UITableViewCell {
    
    @IBOutlet weak var pokemonImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    // we need this to cancel an ongoing request for an image before the cell is reused
    var request: DataRequest?
    
    var ownedPokemon: TrainerQuery.Data.Trainer.OwnedPokemon? {
        didSet {
            updateUI()
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        pokemonImageView.image = nil
        request?.cancel()
    }
    
    func updateUI() {
        if let name = ownedPokemon?.name {
            nameLabel.text = name
        }
        if let pokemonURL = ownedPokemon?.url {
            request = Alamofire.request(pokemonURL).responseImage { [unowned self] response in
                if let image = response.result.value {
                    self.pokemonImageView.image = image
                }
            }
        }
    }
    
}
