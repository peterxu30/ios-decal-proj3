//
//  PhotosCollectionViewController.swift
//  Photos
//
//  Created by Gene Yoo on 11/3/15.
//  Copyright © 2015 iOS DeCal. All rights reserved.
//

import UIKit

class PhotosCollectionViewController: UICollectionViewController {
    var photos: [Photo]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let api = InstagramAPI()
        api.loadPhotos(didLoadPhotos)
        // FILL ME IN
        photos = [Photo]()
    }

    /* 
     * IMPLEMENT ANY COLLECTION VIEW DELEGATE METHODS YOU FIND NECESSARY
     * Examples include cellForItemAtIndexPath, numberOfSections, etc.
     */
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        print("cellforitematindexpath called")
        let photoCell = collectionView.dequeueReusableCellWithReuseIdentifier("PhotoItemCell", forIndexPath: indexPath) as! PhotoCollectionCell
        print(indexPath.row)
        if (photos.count > 0) {
            let currentPhoto = photos[indexPath.row]
            loadImageForCell(currentPhoto, imageView: photoCell.photoImage)
            photoCell.photoUsername.text = currentPhoto.username
            photoCell.photoDatePosted.text = currentPhoto.datePosted
            //date?
//            NSDateFormatter().stringFromDate(currentPhoto.datePosted)
//            photoCell.photoDatePosted.text = NSDateFormatter().stringFromDate(currentPhoto.datePosted)
            
            photoCell.photoNumberOfLikes.text = String(currentPhoto.likes)
        }
        return photoCell
    }
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    
    
//    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath)  {
//        
//    }
    
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        if let p = photos {
            print("NUMBER OF SECTIONS", photos.count)
//            if photos.count > 0 {
//                print(photos[0].url)
//            }
            return Int(photos.count/6) + 1
        }
        return 0;
    }
    
    /* Creates a session from a photo's url to download data to instantiate a UIImage. 
       It then sets this as the imageView's image. */
    func loadImageForCell(photo: Photo, imageView: UIImageView) {
        print("loadImageForCell called", photos.count)
    
        var url = NSURL(fileURLWithPath: photo.url)
        let session = NSURLSession.sharedSession()
        var task = session.dataTaskWithURL(url, completionHandler: {
            (data, response, error) -> Void in
            if error == nil {
                let img = UIImage(data: data!)
                imageView.image = img
            }
        })
        task.resume()
    }
    
    /* Completion handler for API call. DO NOT CHANGE */
    func didLoadPhotos(photos: [Photo]) {
        self.photos = photos
        self.collectionView!.reloadData()
    }
    
}

