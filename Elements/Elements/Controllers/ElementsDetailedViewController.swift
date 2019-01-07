//
//  ElementsDetailedViewController.swift
//  Elements
//
//  Created by Jabeen's MacBook on 1/4/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class ElementsDetailedViewController: UIViewController {

    
    @IBOutlet weak var favButton: UIBarButtonItem!
    @IBOutlet weak var elementImage: UIImageView!
    @IBOutlet weak var elementSymbol: UILabel!
    @IBOutlet weak var elementNumber: UILabel!
    @IBOutlet weak var elementWeight: UILabel!
    @IBOutlet weak var elementMeltingPoint: UILabel!
    @IBOutlet weak var elementBoilingPoint: UILabel!
    @IBOutlet weak var elementDiscoveryby: UILabel!
    
    public var element: Element!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = element.name
       updateUI()
    }
    
    private func updateUI(){
        
        let urlString = "http://images-of-elements.com/\(element.name.lowercased()).jpg"
        ImageHelper.shared.fetchImage(urlString: urlString) { (appError, image) in
            if let image = image {
                self.elementImage.image = image
            } else if let appError = appError {
                print(appError.errorMessage())
            }
        }
        elementSymbol?.text = "Symbol: \(element.symbol)"
        elementNumber?.text = "Number: \(element.numThreeDigits)"
        elementWeight?.text = "Weight: \(element.atomic_mass)"
        if let melt = element.melt {
            elementMeltingPoint?.text = "Melting Point: \(melt)"
        } else {
            elementMeltingPoint?.text = "Melting point not Found"
        }
        if let boil = element.boil {
            elementBoilingPoint?.text = "Boiling Point: \(boil)"
        } else {
            elementBoilingPoint?.text = "Boiling point not Found"

        }
        if let discovery = element.discovered_by {
            elementDiscoveryby?.text = "Discovered by: \(discovery)"
        } else {
            elementDiscoveryby?.text = "Not found"
        }
    }

    
    @IBAction func favorite(_ sender: UIBarButtonItem) {
        let favorite = Favorite.init(symbol: element.symbol, number: element.number, discovered_by: element.discovered_by)

        do {
            let data = try JSONEncoder().encode(favorite)
            ElementAPIClient.favoriteElement(data: data) { (appError, success) in
                if let appError = appError {
                    print("favoriting element error: \(appError)")
                } else if success {
                    print("successfully favorited element")
                } else {
                    print("was not favorited")
                }
            }
        } catch {
            print("encoding error: \(error)")
        }
        }


    
}

