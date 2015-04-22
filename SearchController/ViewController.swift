//
//  ViewController.swift
//  SearchController
//
//  Created by wiserkuo on 2015/4/21.
//  Copyright (c) 2015年 wiserkuo. All rights reserved.
//

import UIKit
var searcher : UISearchController!
//var place_id : String!
class ViewController: UIViewController , UISearchBarDelegate{
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var placeidLabel: UILabel!
    
    @IBOutlet weak var addressLabel: UILabel!
    
    @IBOutlet weak var coordinateLabel: UILabel!
    
    let googlePlaceAPI = GooglePlaceAPI()
    let src = AutoCompleteController()

    @IBOutlet weak var searchBarView: UIView!
    
    var sectionData = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sectionData = ["aaa"]


        //for
        
        // Do any additional setup after loading the view, typically from a nib.
        // most rudimentary possible search interface
        // instantiate a view controller that will present the search results
        
        // instantiate a search controller and keep it alive
        searcher = UISearchController(searchResultsController: src)
        //self.searcher = searcher
        // specify who the search controller should notify when the search bar changes
        searcher.searchResultsUpdater = src
        searcher.searchBar.delegate = self
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
    func searchBarSearchButtonClicked(searchBar: UISearchBar){
        println("searchBarSearchButtonClicked")
        println("typed:\(searcher.searchBar.text)")
        
        searcher.active = false
        
    }
    func searchBarTextDidEndEditing(searchBar: UISearchBar){ // wiser:connected the action didSelectRowAtIndexPath in AutoCompleteController , set searcher.active=false as well
        println("searchBarTextDidEndEditing")
        println("autocomplete:\(src.originalData[src.selectedIndex.row]) , \(src.place_ids[src.selectedIndex.row])")
        descriptionLabel.text="description:"+src.originalData[src.selectedIndex.row]
        placeidLabel.text="place id:"+src.place_ids[src.selectedIndex.row]
        
        googlePlaceAPI.fetchPlacesDetail(src.place_ids[src.selectedIndex.row]){ place in
           
            self.coordinateLabel.text="coordinate: \(place!.coordinate.longitude), \(place!.coordinate.latitude)"
            self.addressLabel.text="address:\(place!.address)"
           // searcher.searchBar.placeholder="\(self.src.originalData[self.src.selectedIndex.row])"
            //let prediction: Prediction in predictions {
                //println("\(prediction.description)")
                //      self.sectionData.append(prediction.description)
              //  self.originalData.append(prediction.description)
              //  self.place_ids.append(prediction.place_id)
            //}
            //src.reloadOriginalData(self.sectionData)
            //src.tableView.reloadData()
            //self.filteredData = self.originalData
            /*self.filteredData = self.originalData.filter {
            s in
            let options = NSStringCompareOptions.CaseInsensitiveSearch
            let found = s.rangeOfString(searchController.searchBar.text, options: options)
            return (found != nil)
            }*/
            //self.tableView.reloadData()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

