//
//  PostTableViewController.swift
//  ReactiveJSONPlaceholder
//
//  Created by Justin Hur on 6/19/17.
//  Copyright © 2017 Justin Hur. All rights reserved.
//

import UIKit
import ReactiveCocoa
import ReactiveSwift


class PostTableViewController: UITableViewController {

    
    var viewModel: PostTableViewModel = PostTableViewModel()

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Bind Target to reload data
        self.tableView.reactive.reloadData <~ viewModel.signalReload
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    override func viewWillAppear(_ animated: Bool) {
        viewModel.request()
    }
    
    
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.receivedData.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "postCell", for: indexPath) as! PostTableCell
        
        cell.viewModel = viewModel.getPostCellViewModel(atIndex: indexPath.row)
        
        return cell
    }
    

    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        if let destination = storyboard.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController {
            
            if let postVM:PostCellViewModel = viewModel.getPostCellViewModel(atIndex: indexPath.row) {
                destination.viewModel = DetailViewModel(withPost: postVM)
                navigationController?.pushViewController(destination, animated: true)
            }
        }
    }
    
    

}




