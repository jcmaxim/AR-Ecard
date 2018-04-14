//
//  PageCell.swift
//  LoginGuide
//
//  Created by 王浩宇 on 17/2/25.
//  Copyright © 2017年 王浩宇. All rights reserved.
//

import UIKit

class PageCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    //@IBOutlet weak var textView: UITextView!
    
    let color = UIColor(white: 0.2, alpha: 1)
    
    var page: Page? {
        didSet {
            guard let page = page else {
                return
            }
            
            var imageName = page.imageName
            if UIDevice.current.orientation.isLandscape {
                imageName += "_landscape"
            }
            
            imageView.image = UIImage(named: imageName)
            let attributeText = NSMutableAttributedString(string: page.title, attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 18, weight: UIFont.Weight.medium), NSAttributedStringKey.foregroundColor: color])
            
            attributeText.append(NSAttributedString(string: "\n\n\(page.message)", attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 14), NSAttributedStringKey.foregroundColor: color]))
            
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.alignment = .center
            
            attributeText.addAttribute(NSAttributedStringKey.paragraphStyle, value: paragraphStyle, range: NSRange(location: 0, length: attributeText.string.characters.count))
            
            //textView.contentInset = UIEdgeInsets(top: 24, left: 0, bottom: 0, right: 0)
            //textView.attributedText = attributeText
        }
        
    }
    
    // already created item in the storyboard, use this method. Otherwise, use init method
    override func awakeFromNib() {
        
    }
}
