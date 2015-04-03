//
//  PolyLineManager.swift
//  Routelandia
//
//  Created by Peter Gicking on 4/1/15.
//  Copyright (c) 2015 Portland State University. All rights reserved.
//

import Foundation

class PolyLineManager{
    
    func getAllhighways() -> [[[Int: Double]]]{
        let highways = ApiFetcher().fetchJson("highways")
        
        var allHighways = [[[Int: Double]]]()
        //dynamically get number of highways
        //pass highway ids to different function
            //grab all the coordinates IN ORDER
            //return that polyline
        //grab polyline, add it to list
        //return list to map view
        
        
        
        var i = 0
        var highwayIds = [Int32]()
        for(i = 0; i<highways["results"].count; ++i){
            highwayIds.append(highways["results"][i]["highwayid"].int32!)
            //println(highways["results"][i]["highwayid"].int32!)
        }
        
        
        
        i = 0
        var j = 0
        while(j < highwayIds.count){
            allHighways.append(self.getHighwayCoordinates(highwayIds[i]))
            ++j
        }
        
        return allHighways
        
    }
    
    func getHighwayCoordinates(id: Int32) -> [([Int: Double])]{
        var i = 0
        var coordianteList = [[Int: Double]]()
        
        let highway = ApiFetcher().fetchJson("highways/"+String(id)+"/stations")
        
        for(i = 0; i < highway["results"][0]["geojson_raw"]["coordinates"][0].count; ++i){
            //its backwards because why did we leave it backwards
            var lat = highway["results"][0]["geojson_raw"]["coordinates"][i][1].double!
            var long = highway["results"][0]["geojson_raw"]["coordinates"][i][0].double!
            var coordinates: [Int: Double] = [0:lat, 1:long]
            coordianteList.append(coordinates)
        }
        
        return coordianteList
    }
    
}