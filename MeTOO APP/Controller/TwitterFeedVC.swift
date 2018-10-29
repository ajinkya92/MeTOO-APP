//
//  FirstViewController.swift
//  MeTOO APP
//
//  Created by Ajinkya Sonar on 29/10/18.
//  Copyright © 2018 Ajinkya Sonar. All rights reserved.
//

import UIKit

class TwitterFeedVC: UIViewController {
    
    @IBOutlet weak var segmentController: UISegmentedControl!
    @IBOutlet weak var tableView: UITableView!
    
    var pageNumber = 1
    var globalTwitterFeedArray = [Datum]()
    var indiaTwitterFeedArray = [Datum]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        getGlobalTwitterFeeds()
        getIndiaTwitterFeeds()
    }
    
    @IBAction func segmentControllerTapped(_ sender: UISegmentedControl) {
        
        if segmentController.selectedSegmentIndex == 0 {
            
            getGlobalTwitterFeeds()
            
        } else {
            
            getIndiaTwitterFeeds()
        }
        
        self.tableView.reloadData()
        
    }
    
    

}

// MARK: API CALLS FOR TWITTER FEED DATA

extension TwitterFeedVC {
    
    // MARK: GLOBAL TWITTER FEED DATA
    
    func getGlobalTwitterFeeds() {
        
        TwitterFeedService.instance.getTwitterFeeds(withUrl: String(format: TWITTERFEEDGLOBALURL,pageNumber)) { (true, returnedTwitterFeeds) in
            
            if let returnedTwitterFeeds = returnedTwitterFeeds {
                
                self.globalTwitterFeedArray = returnedTwitterFeeds.data
                
                //print(self.globalTwitterFeedArray)
                
            }
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
                
            }
            
        }
        
    }
    
    // MARK: INDIA TWITTER FEED DATA
    
    func getIndiaTwitterFeeds() {
        
        TwitterFeedService.instance.getTwitterFeeds(withUrl: String(format: TWITTERFEEDINDIAURL,pageNumber)) { (true, returnedTwitterFeeds) in
            
            if let returnedTwitterFeeds = returnedTwitterFeeds {
                
                self.indiaTwitterFeedArray = returnedTwitterFeeds.data
                
                //print(self.indiaTwitterFeedArray)
            }
            
            DispatchQueue.main.async {
                
                self.tableView.reloadData()
            }
            
        }
        
    }
    
}


extension TwitterFeedVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if segmentController.selectedSegmentIndex == 0 {
            
            return globalTwitterFeedArray.count
        } else {
            
            return indiaTwitterFeedArray.count
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if segmentController.selectedSegmentIndex == 0 {
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "TwitterFeedCell") as? TwitterFeedCell else {return UITableViewCell()}
            
            let feedData = self.globalTwitterFeedArray[indexPath.row]
            
            cell.nameLabel.text = feedData.screenName
            cell.feedTextLable.text = feedData.tweetText
            cell.timeLabel.text = feedData.createdAt
            
            return cell
            
        } else {
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "TwitterFeedCell") as? TwitterFeedCell else {return UITableViewCell()}
            
            let feedData = self.indiaTwitterFeedArray[indexPath.row]
            
            cell.nameLabel.text = feedData.screenName
            cell.feedTextLable.text = feedData.tweetText
            cell.timeLabel.text = feedData.createdAt
            
            return cell
        }
        
        
    }
    
}

