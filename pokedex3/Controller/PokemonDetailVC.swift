 //
//  PokemonDetailVC.swift
//  pokedex3
//
//  Created by Brandon Watkins on 9/01/18.
//  Copyright © 2018 Brandon Watkins. All rights reserved.
//

import UIKit

class PokemonDetailVC: UIViewController {

    var pokemon: Pokemon!
    
    @IBOutlet weak var nameLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nameLbl.text = pokemon.name
    }


}
