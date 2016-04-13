//
//  Photo.swift
//  Photos
//
//  Created by Gene Yoo on 11/3/15.
//  Copyright © 2015 iOS DeCal. All rights reserved.
//

import Foundation

class Photo {
    /* The number of likes the photo has. */
    var likes : Int!
    /* The string of the url to the photo file. */
    var url : String!
    /* The username of the photographer. */
    var username : String!
    
    var datePosted: String!
    var formatter = NSDateFormatter()

    /* Parses a NSDictionary and creates a photo object. */
    init (data: NSDictionary) {
        // FILL ME IN
        // HINT: use nested .valueForKey() calls, and then cast using 'as! TYPE'
        if let likesOptional = data["likes"]!["count"]! {
            likes = likesOptional as! Int
        }
        if let urlOp = data["images"]!["thumbnail"]!!["url"]! {
            url = urlOp as! String
            print("URL", url)
        }
        if let usernameOp = data["user"]!["username"]! {
            username = usernameOp as! String
        }
//        formatter.dateFormat = "dd-MM-yyyy"
//        datePosted = formatter.dateFromString(data["created_time"] as! String)
        datePosted = data["created_time"] as! String
        print("DATE ", data["created_time"])
    }

}