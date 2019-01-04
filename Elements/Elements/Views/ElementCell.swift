//
//  ElementCell.swift
//  Elements
//
//  Created by Jabeen's MacBook on 1/4/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class ElementCell: UITableViewCell {

    @IBOutlet weak var elementImage: UIImageView!
    @IBOutlet weak var elementName: UILabel!
    @IBOutlet weak var symbolWeight: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    private var urlString = ""
    
    public func configureCell(element: Element) {
        let urlStr = "http://www.theodoregray.com/periodictable/Tiles/\(element.numThreeDigits)/s7.JPG"
    
        elementName.text = element.name
        symbolWeight.text = "\(element.symbol) \(element.atomic_mass)"
        
        ImageHelper.shared.fetchImage(urlString: urlStr) { (appError, image) in
            if let image = image {
                self.elementImage.image = image
            } else if let appError = appError {
                print(appError.errorMessage())
            }
        }
//        if let image = ImageHelper.shared.image(forKey: element.spectral_img.absoluteString as NSString) {
//            elementImage.image = image
//        } else {
//            activityIndicator.startAnimating()
//            ImageHelper.shared.fetchImage(urlString: element.spectral_img.absoluteString) { (appError, image) in
//                if let appError = appError {
//                    print(appError.errorMessage())
//                } else if let image = image {
//                    if self.urlString == element.spectral_img.absoluteString {
//                        self.elementImage.image = image
//                    }
//                }
//                self.activityIndicator.stopAnimating()
//            }
//        }
//    }

}
}
