//
//  PhotoCollectionCell.swift
//  Photos
//
//  Created by Peter Xu on 4/12/16.
//  Copyright © 2016 iOS DeCal. All rights reserved.
//

import UIKit

class PhotoCollectionCell: UICollectionViewCell {
    
    @IBOutlet weak var LikeButton: UIButton!
    @IBOutlet weak var photoImage: UIImageView!
    @IBOutlet weak var photoUsername: UILabel!
    @IBOutlet weak var photoDatePosted: UILabel!
    @IBOutlet weak var photoNumberOfLikes: UILabel!
}