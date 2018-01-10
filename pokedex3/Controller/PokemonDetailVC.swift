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
    
    @IBOutlet weak var mainImg: UIImageView!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var typeLbl: UILabel!
    @IBOutlet weak var defenceLbl: UILabel!
    @IBOutlet weak var heightLbl: UILabel!
    @IBOutlet weak var weightLbl: UILabel!
    @IBOutlet weak var pokedexIDLbl: UILabel!
    @IBOutlet weak var baseAttackLbl: UILabel!
    @IBOutlet weak var evolutionLbl: UILabel!
    @IBOutlet weak var currentEvoImg: UIImageView!
    @IBOutlet weak var nextEvoImg: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nameLbl.text = pokemon.name.capitalized

        let img = UIImage(named: "\(pokemon.pokedexId)")
        
        mainImg.image = img
        currentEvoImg.image = img
        pokedexIDLbl.text = "\(pokemon.pokedexId)"
        
        pokemon.downloadPokemonDetails {
            //Whatever is written below is only called after the network call is complete
            self.UpdateUI()
        }
    }

    func UpdateUI() {
        baseAttackLbl.text  = pokemon.attack
        defenceLbl.text     = pokemon.defence
        heightLbl.text      = pokemon.height
        weightLbl.text      = pokemon.weight
    }

    @IBAction func backBtnPressed(_ sender: UIButton) {
        
        dismiss(animated: true, completion: nil)
    }
 }
