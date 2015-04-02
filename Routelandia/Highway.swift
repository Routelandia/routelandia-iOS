//
//  Highway.swift
//  Routelandia
//
//  Created by Peter Gicking on 3/24/15.
//  Copyright (c) 2015 Portland State University. All rights reserved.
//

import Foundation


class Highway{
    let highwayid: Int32
    let direction: String
    let highwayname: String
    let bound: String
    let oppositehighwayid: Int32
    
    
    init(json:JSON){
        highwayid = json["results"][0]["highwayid"].int32!
        direction = json["results"][0]["direction"].stringValue
        highwayname = json["results"][0]["highwayname"].stringValue
        bound = json["results"][0]["bound"].stringValue
        oppositehighwayid = json["results"][0]["oppositehighwayid"].int32!
    }
    
    
}

    
    
