//
//  ViewController.swift
//  SearchController
//
//  Created by wiserkuo on 2015/4/21.
//  Copyright (c) 2015年 wiserkuo. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UISearchBarDelegate{
    
    let googlePlaceAPI = GooglePlaceAPI()
    @IBOutlet weak var searchBarView: UIView!
    
    var sectionData = [String]()
    var searcher = UISearchController()
    override func viewDidLoad() {
        super.viewDidLoad()
        sectionData = ["aaa"]


        //for
        
        // Do any additional setup after loading the view, typically from a nib.
        // most rudimentary possible search interface
        // instantiate a view controller that will present the search results
        let src = SearchResultsController(data: self.sectionData)
        // instantiate a search controller and keep it alive
        let searcher = UISearchController(searchResultsController: src)
        self.searcher = searcher
        // specify who the search controller should notify when the search bar changes
        searcher.searchResultsUpdater = src
        
        // put the search controller's search bar into the interface
       // let b = searcher.searchBar
        
        // b.scopeButtonTitles = ["Hey", "Ho"] // shows during search only; uncomment to see
        // (not used in this example; just showing the interface)
        // WARNING: do NOT call showsScopeBar! it messes things up!
        // (buttons will show during search if there are titles)self.searcher.searchBar.frame.size.width
       //b.frame = CGRectMake(0, 0, 400, 40);
        
        
        searcher.searchBar.autocapitalizationType = .None
        searchBarView.addSubview(searcher.searchBar)
        searcher.searchBar.sizeToFit() // crucial, trust me on this one
        
        //b.size
        //self.bar=b
        //bar=b
       // GooglePlaceAPI.fetchPlacesAutoComplete(
        /* dataProvider.fetchPlacesNearCoordinate(coordinate, radius:mapRadius, types: searchedTypes) { places in
        for place: GooglePlace in places {
        // 3
        let marker = PlaceMarker(place: place)
        // 4
        marker.map = self.mapView
        }
        }
*/
        /*
        googlePlaceAPI.fetchPlacesAutoComplete("new york"){ predictions in
            for prediction: Prediction in predictions {
                //println("\(prediction.description)")
                self.sectionData.append(prediction.description)
            }
            src.reloadOriginalData(self.sectionData)
            src.tableView.reloadData()
        }*/
    
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

