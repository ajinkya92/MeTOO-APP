//
//  SecondViewController.swift
//  MeTOO APP
//
//  Created by Ajinkya Sonar on 29/10/18.
//  Copyright © 2018 Ajinkya Sonar. All rights reserved.
//

import UIKit
import Kingfisher

class HarrasmentLawsVC: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var harrasmentLawsArray = HarrasmentLaws()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        getdata()
        collectionView.delegate = self
        collectionView.dataSource = self
        
    }

}

// MARK: API CALL FOR GETTIING HARRASMENT LAW DATA

extension HarrasmentLawsVC {
   
    func getdata() {
        
        HarrasmentLawService.instance.getHarrasmentLawData(withUrl: HARRASMENTLAWURL) { (true, returnedHarrasmentLawData) in
            
            if let returnedHarrasmentLawData = returnedHarrasmentLawData {
                
                self.harrasmentLawsArray = returnedHarrasmentLawData
            }
            
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
            
        }
        
    }
    
}

extension HarrasmentLawsVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return harrasmentLawsArray.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HarrasmentLawCell", for: indexPath) as? HarrasmentLawCell else {return UICollectionViewCell()}
        
        let individualHarrasmentData = harrasmentLawsArray[indexPath.row]
        
        let imageURl = URL(string: individualHarrasmentData.image)
        
        
        cell.titleLabel.text = individualHarrasmentData.title
        cell.displayImage.kf.setImage(with: imageURl)
        cell.descriptionTextView.text = individualHarrasmentData.description
        
        return cell
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: self.collectionView.frame.width, height: self.collectionView.frame.height)
        
    }
    
    
}

