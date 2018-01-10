//
//  Pokemon.swift
//  pokedex3
//
//  Created by Brandon Watkins on 8/01/18.
//  Copyright © 2018 Brandon Watkins. All rights reserved.
//

import Foundation
import Alamofire

class Pokemon {
    
    private var _name: String!
    private var _pokedexId: Int!
    private var _description: String!
    private var _type: String!
    private var _defence: String!
    private var _attack: String!
    private var _height: String!
    private var _weight: String!
    private var _nextEvolutionTxt: String!
    private var _pokemonURL: String!
    
    var description: String {
        
        if _description == nil {
            
            _description = ""
        }
        return _description
    }
    
    var type: String {
        
        if _type == nil {
            
            _type = ""
        }
        return _type
    }
    
    var defence: String {
        
        if _defence == nil {
            
            _defence = ""
        }
        return _defence
    }
    
    var attack: String {
        
        if _attack == nil {
            
            _attack = ""
        }
        return _attack
    }
    
    var height: String {
        
        if _height == nil {
            
            _height = ""
        }
        return _height
    }
    
    var weight: String {
        
        if _weight == nil {
            
            _weight = ""
        }
        return _weight
    }
    
    var nextEvolutionTxt: String {
        
        if _nextEvolutionTxt == nil {
           
            _nextEvolutionTxt = ""
        }
        return _nextEvolutionTxt
    }
    
    var name: String {
        return _name
    }
    
    var pokedexId: Int {
        return _pokedexId
    }
    
    init(name: String, pokedexId: Int) {
        self._name = name
        self._pokedexId = pokedexId
        
        self._pokemonURL = "\(URL_BASE)\(URL_POKEMON)\(self.pokedexId)/"
    }
    
    func downloadPokemonDetails(completed: @escaping DownloadComplete) {
        
        Alamofire.request(_pokemonURL).responseJSON { (response) in

            if let dict = response.result.value as? Dictionary<String, AnyObject> {
                if let weight = dict["weight"] as? Int {
                    self._weight = "\(weight)"
                }
                if let height = dict["height"] as? Int {
                    self._height = "\(height)"
                }
                if let defence = dict["defence"] as? Int {
                    self._defence = "\(defence)"
                }
                
                if let stats = dict["stats"] as? [Dictionary<String, AnyObject>] {
                    if let base_stats = stats[4]["base_stat"] as? Int {
                        self._attack = "\(base_stats)"
                    }
                }
                if let stats = dict["stats"] as? [Dictionary<String, AnyObject>] {
                    if let base_stats = stats[3]["base_stat"] as? Int {
                        self._defence = "\(base_stats)"
                    }
                }
                
                //Still need to get type, description, and next evolution.
            
            completed()
            
        }
        
    }
    
    }
}
