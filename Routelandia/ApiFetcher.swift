//
//  ApiFetcher.swift
//  Routelandia
//
//  Created by Peter Gicking on 3/23/15.
//  Copyright (c) 2015 Portland State University. All rights reserved.
//

import Foundation
import UIKit




/**
    This class is intended to be the main place JSON api calls are made.
    Results will then be passed back as objects to where ever they're needed.
**/

class ApiFetcher{
    //TODO: Async callbacks
  
    
    let apiRoot = "http://routelandia.its.pdx.edu/"
    
    init(){
        
    }
    
    func fetchJson(route: String) -> JSON{
        //TODO: sanitize route string
        let url = NSURL(string: apiRoot+route)
        let request = NSURLRequest(URL: url!)
        
        var response: AutoreleasingUnsafeMutablePointer<NSURLResponse?
        >=nil
        var error: NSErrorPointer = nil
        var dataVal: NSData =  NSURLConnection.sendSynchronousRequest(request, returningResponse: response, error:nil) as NSData!
        var err: NSError
        var jsonResult: NSDictionary = NSJSONSerialization.JSONObjectWithData(dataVal, options: NSJSONReadingOptions.MutableContainers, error: nil) as NSDictionary
        let json = JSON(jsonResult)
        
        if(error != nil){
            NSException(name: "No Network", reason: "routelandias server is not responding", userInfo: nil).raise()
        }
        
        return json
            
    }
        
    
}