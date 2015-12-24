//
//  SearchViewController.swift
//  TableViewSearchInSwift
//
//  Created by TheAppGuruz-iOS-103 on 24/12/15.
//  Copyright © 2015 TheAppGururz. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, UITableViewDelegate, UISearchDisplayDelegate, UISearchBarDelegate
{

    var marrCountryList = [String]()
    var marrFilteredCountryList = [String]()
    
    @IBOutlet var tblCountry: UITableView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        marrCountryList = ["USA", "Bahamas", "Brazil", "Canada", "Republic of China", "Cuba", "Egypt", "Fiji", "France", "Germany", "Iceland", "India", "Indonesia", "Jamaica", "Kenya", "Madagascar", "Mexico", "Nepal", "Oman", "Pakistan", "Poland", "Singapore", "Somalia", "Switzerland", "Turkey", "UAE", "Vatican City"]
        self.tblCountry.reloadData()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if tableView == self.searchDisplayController!.searchResultsTableView {
            return self.marrFilteredCountryList.count
        } else {
            return self.marrCountryList.count
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cellCountry = self.tblCountry.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        
        var countryName : String!
        if tableView == self.searchDisplayController!.searchResultsTableView {
            countryName = marrFilteredCountryList[indexPath.row]
        } else {
            countryName = marrCountryList[indexPath.row]
        }
        
        cellCountry.textLabel?.text = countryName
        
        return cellCountry
    }
    
    func filterTableViewForEnterText(searchText: String) {
        let searchPredicate = NSPredicate(format: "SELF CONTAINS[c] %@", searchText)
        
        let array = (self.marrCountryList as NSArray).filteredArrayUsingPredicate(searchPredicate)
        self.marrFilteredCountryList = array as! [String]
        self.tblCountry.reloadData()
    }
    
    func searchDisplayController(controller: UISearchDisplayController, shouldReloadTableForSearchString searchString: String?) -> Bool {
        self.filterTableViewForEnterText(searchString!)
        return true
    }
    
    func searchDisplayController(controller: UISearchDisplayController,
        shouldReloadTableForSearchScope searchOption: Int) -> Bool {
            self.filterTableViewForEnterText(self.searchDisplayController!.searchBar.text!)
            return true
    }

}
