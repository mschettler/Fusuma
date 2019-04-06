//
//  FSAlbumViewCell.swift
//  Fusuma
//
//  Created by Yuta Akizuki on 2015/11/14.
//  Copyright © 2015年 ytakzk. All rights reserved.
//

import UIKit
import Photos

final class FSAlbumViewCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var checkmarkImageView: UIImageView!
    var counterLabel: UILabel?

    var selectedLayer = CALayer()

    var image: UIImage? {
        didSet {
            imageView.image = image
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        
        selectedLayer.backgroundColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.5).cgColor
        
        // throw a counter label on the checkmark instead, place it in a similar area
        if self.counterLabel == nil {
            self.counterLabel = {
                let l = UILabel()
                l.translatesAutoresizingMaskIntoConstraints = false
                l.backgroundColor = UIColor.white
                l.textColor = UIColor(red:0.39, green:0.33, blue:0.51, alpha:1.0)
                l.font = UIFont.boldSystemFont(ofSize: 15)
                l.text = "0"
                l.textAlignment = .center
                l.layer.masksToBounds = true
                l.layer.cornerRadius = 10
                contentView.addSubview(l)
                
                l.layer.shadowOpacity = 0.7
                l.layer.shadowOffset = CGSize(width: 2, height: 2)
                l.layer.shadowRadius = 5.0
                l.layer.shadowColor = UIColor.darkGray.cgColor
                
                // hmmm the api `.anchor(...` isn't available :'(
                l.bottomAnchor.constraint(equalTo: imageView.bottomAnchor, constant: -4).isActive = true
                l.rightAnchor.constraint(equalTo: imageView.rightAnchor, constant: -4).isActive = true
                l.widthAnchor.constraint(equalToConstant: 20).isActive = true
                l.heightAnchor.constraint(equalToConstant: 20).isActive = true
                l.bringSubviewToFront(imageView)
                l.isHidden = true
                
                l.numberOfLines = 1
                l.minimumScaleFactor = 0.1
                l.adjustsFontSizeToFitWidth = true
                
                checkmarkImageView.isHidden = true // don't use this anymore
                return l
            }()
        }
    }
}
