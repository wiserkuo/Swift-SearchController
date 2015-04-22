//
//  GooglePlaceAPI.swift
//  SearchController
//
//  Created by wiserkuo on 2015/4/22.
//  Copyright (c) 2015年 wiserkuo. All rights reserved.
//
import UIKit
import Foundation
import CoreLocation



class GooglePlaceAPI {
    let apiKey = "AIzaSyA0LhU68y48rb04f4kfvMH8xOsyCr7xz24"
    var placesTask = NSURLSessionDataTask()
    var session: NSURLSession {
        return NSURLSession.sharedSession()
    }
//https://maps.googleapis.com/maps/api/place/autocomplete/json?input=自由女神&key=AIzaSyA0LhU68y48rb04f4kfvMH8xOsyCr7xz24
    func fetchPlacesAutoComplete(input:String, completion: (([Prediction]) -> Void)) -> ()
    {
       //input = "new york"
        let a = "new york"
       var urlString = "https://maps.googleapis.com/maps/api/place/autocomplete/json?key=\(apiKey)&input=\(a)"
       // println("\(urlString1)")
        //let typesString = types.count > 0 ? join("|", types) : "food"
        //urlString += "&types=\(typesString)"
        urlString = urlString.stringByAddingPercentEscapesUsingEncoding(NSUTF8StringEncoding)!
        
        if placesTask.taskIdentifier > 0 && placesTask.state == .Running {
            placesTask.cancel()
        }
        UIApplication.sharedApplication().networkActivityIndicatorVisible = true
        placesTask = session.dataTaskWithURL(NSURL(string: urlString)!) {data, response, error in
            UIApplication.sharedApplication().networkActivityIndicatorVisible = false
            var placesArray = [Prediction]()
            if let json = NSJSONSerialization.JSONObjectWithData(data, options:nil, error:nil) as? NSDictionary {
                if let results = json["predictions"] as? NSArray {
                    for rawPlace:AnyObject in results {
                        let place = Prediction(dictionary: rawPlace as! NSDictionary)
                        placesArray.append(place)
                        println("\(place.description) , \(place.place_id)")
                    }
                }
            }
            dispatch_async(dispatch_get_main_queue()) {
                completion(placesArray)
            }
        }
        placesTask.resume()
    }


}