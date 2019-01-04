//
//  ElementsDetailedViewController.swift
//  Elements
//
//  Created by Jabeen's MacBook on 1/4/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class ElementsDetailedViewController: UIViewController {

    
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
       
    }
    
    private func updateUI(){
        guard let element = element else {
            fatalError("element is nil")
        }
    
    }

    

}
