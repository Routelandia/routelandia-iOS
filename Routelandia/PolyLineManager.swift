//
//  PolyLineManager.swift
//  Routelandia
//
//  Created by Peter Gicking on 4/1/15.
//  Copyright (c) 2015 Portland State University. All rights reserved.
//

import Foundation

class PolyLineManager{
    
    func getAllhighways(){
        let highways = ApiFetcher().fetchJson("highways")
        
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
            println(highways["results"][i]["highwayid"].int32!)
            
        }

        
        
        i = 0
//        while(highwayIds[i]){
//            self.getHighways(highwayIds[i])
//        }
    }
    
    func getHighway(){
        
    }
    
}