//
//  SearchTableViewController.swift
//  TableViewSearchInSwift
//
//  Created by TheAppGuruz-iOS-103 on 07/02/15.
//  Copyright (c) 2015 TheAppGururz. All rights reserved.
//

import UIKit

class SearchTableViewController: UITableViewController, UISearchDisplayDelegate, UISearchBarDelegate
{
    var marrCountryList = [String]()
    var marrFilteredCountryList = [String]()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        marrCountryList = ["USA", "Bahamas", "Brazil", "Canada", "Republic of China", "Cuba", "Egypt", "Fiji", "France", "Germany", "Iceland", "India", "Indonesia", "Jamaica", "Kenya", "Madagascar", "Mexico", "Nepal", "Oman", "Pakistan", "Poland", "Singapore", "Somalia", "Switzerland", "Turkey", "UAE", "Vatican City"]
        self.tableView.reloadData()
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if tableView == self.searchDisplayController!.searchResultsTableView {
            return self.marrFilteredCountryList.count
        } else {
            return self.marrCountryList.count
        }
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        var cellCountry = self.tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! UITableViewCell
        
        var countryName : String!
        if tableView == self.searchDisplayController!.searchResultsTableView {
            countryName = marrFilteredCountryList[indexPath.row]
        } else {
            countryName = marrCountryList[indexPath.row]
        }
        
        cellCountry.textLabel!.text = countryName
        
        return cellCountry
    }
    
    func filterTableViewForEnterText(searchText: String) {
        self.marrFilteredCountryList = self.marrCountryList.filter({( strCountry : String) -> Bool in
            var stringForSearch = strCountry.rangeOfString(searchText)
            return (stringForSearch != nil)
        })
    }
    
    func searchDisplayController(controller: UISearchDisplayController, shouldReloadTableForSearchString searchString: String!) -> Bool {
        self.filterTableViewForEnterText(searchString)
        return true
    }
    
    func searchDisplayController(controller: UISearchDisplayController,
        shouldReloadTableForSearchScope searchOption: Int) -> Bool {
            let textScope = self.searchDisplayController!.searchBar.scopeButtonTitles as! [String]
            self.filterTableViewForEnterText(self.searchDisplayController!.searchBar.text)
            return true
    }
    
}
