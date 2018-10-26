//
//  TutorSearchViewController.swift
//  LeaCouch
//
//  Created by Jerber Valentin on 10/25/18.
//  Copyright © 2018 UPC. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage
import SwiftyJSON

private let reuseIdentifier = "Cell"
class TutorCell: UICollectionViewCell {
    @IBOutlet weak var pictureTutorImageView: UIImageView!
    @IBOutlet weak var nameTutorLabel: UILabel!
    @IBOutlet weak var townTutorLabel: UILabel!
    @IBOutlet weak var countryTutorLabel: UILabel!
    @IBOutlet weak var reviewRatingTutorLabel: UILabel!
    
    func updateView(from tutor: Tutor) {
        nameTutorLabel.text = tutor.country
        townTutorLabel.text = tutor.name
        countryTutorLabel.text = tutor.country
        reviewRatingTutorLabel.text = String(tutor.name)
        if !tutor.photo.isEmpty {
            pictureTutorImageView.af_setImage(withURL: URL(string: tutor.photo)!, placeholderImage: UIImage(named: "no-image-available"))
        }
    }
}

class TutorSearchViewController: UICollectionViewController {
    var results: [Tutor] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        //self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
        updateDataTutor()
    }
    
    func updateDataTutor() {
        Alamofire.request(NewApiTutor.gamesUrl)
        .validate()
        .responseJSON(completionHandler: {response in
            switch (response.result){
            case .success(let value):
                let json = JSON(value)
                let status = json["status"].stringValue
                if status == "error"{
                    let message = json["message"]
                    print("Response error: \(message)")
                    return
                }
                let jsonTutors = json["results"].arrayValue
                self.results = Tutor.buildAll(from: jsonTutors)
                print("Tutors Found: \(self.results.count)")
                self.collectionView?.reloadData()
            case .failure(let error):
                print("Error: \(error.localizedDescription)")
                
            }
        })
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return results.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! TutorCell
    
        // Configure the cell
        cell.updateView(from: results[indexPath.row])
        return cell
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
