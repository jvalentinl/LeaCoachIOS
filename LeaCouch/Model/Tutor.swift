//
//  Tutor.swift
//  LeaCouch
//
//  Created by Jerber Valentin on 10/24/18.
//  Copyright © 2018 UPC. All rights reserved.
//

import Foundation
import SwiftyJSON

class Tutor {
    var id: Int32
    var url : String
    var link : String
    var name : String
    var tag_line : String
    var primary_description : String
    var town : String
    var country : String
    var photo : String
    var distance : String
    var labels : String
    var review_rating : Int32
    var review_duration : Int32
    
    init(
        id: Int32,
        url : String,
        link : String,
        name : String,
        tag_line : String,
        primary_description : String,
        town : String,
        country : String,
        photo : String,
        distance : String,
        labels : String,
        review_rating : Int32,
        review_duration : Int32
        ) {
        self.id = id
        self.url = url
        self.link = link
        self.name = name
        self.tag_line = tag_line
        self.primary_description = primary_description
        self.town = town
        self.country = country
        self.photo = photo
        self.distance = distance
        self.labels = labels
        self.review_rating = review_rating
        self.review_duration = review_duration
        
    }
    
    convenience init(from jsonTutor: JSON) {
        self.init(id: Int32(jsonTutor["id"].intValue),
                  url: jsonTutor["url"].stringValue,
                  link: jsonTutor["link"].stringValue,
                  name: jsonTutor["name"].stringValue,
                  tag_line: jsonTutor["tag_line"].stringValue,
                  primary_description: jsonTutor["primary_description"].stringValue,
                  town: jsonTutor["jsonTutor"].stringValue,
                  country: jsonTutor["country"].stringValue,
                  photo: jsonTutor["photo"].stringValue,
                  distance: jsonTutor["distance"].stringValue,
                  labels: jsonTutor["labels"].stringValue,
                  review_rating: Int32(jsonTutor["review_rating"].intValue),
                  review_duration: Int32(jsonTutor["review_duration"].intValue))
    }
    
    class func buildAll(from jsonTutors: [JSON]) -> [Tutor] {
        let count = jsonTutors.count
        var results: [Tutor] = []
        for i in 0 ..< count {
            results.append(Tutor(from: JSON(jsonTutors[i])))
        }
        return results
    } 
}
