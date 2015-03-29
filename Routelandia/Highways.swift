//
//  Highways.swift
//  Routelandia
//
//  Created by Peter Gicking on 3/24/15.
//  Copyright (c) 2015 Portland State University. All rights reserved.
//

import Foundation

/**
    Calls API fetcher to get all highways, a singular highway, or other attributes of highways
*/

class Highways{
    var route = "highways/"
    
    func fetchForID(HighwayID: Int32) -> JSON{
        route += String(HighwayID)
        
        let json = ApiFetcher().fetchJson(route)
        
        return json
    }
    
    func fetchAll() -> JSON{
        let json = ApiFetcher().fetchJson(route)
        
        //println(json["results"][0]["oppositehighwayid"])
        return json
    }
    
    //Will need to make a stations class if we want to support this
    func fetchStationsForHighway(HighwayID: Int32) -> JSON{
        route += String(HighwayID)
        route += "/stations"
        
        let json = ApiFetcher().fetchJson(route)
        
        return json
    }
    
}