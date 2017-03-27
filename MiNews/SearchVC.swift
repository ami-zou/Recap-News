//
//  SearchVC.swift
//  MiNews
//
//  Created by Ami Zou on 3/18/17.
//  Copyright © 2017 ECON327H. All rights reserved.
//

import UIKit

class SearchVC: UITableViewController { // UITableViewDelegate, UITableViewDataSource
    var hashtags = ["#SpringBreak","#NYC","#MarchMadness","#BayArea","#Sports","#News","#Media"]
    //var searchController : UISearchController!
    var resultsController = UITableViewController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    //    self.searchController = UISearchController(searchResultsController: self.resultsController)
    //    self.tableView.tableHeaderView = self.searchController.searchBar
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1 //incomplete
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.hashtags.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        cell.textLabel?.text = self.hashtags[indexPath.row]
        
        return cell
    }

}
