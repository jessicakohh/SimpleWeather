//
//  MenuController.swift
//  SimpleWeather2
//
//  Created by juyeong koh on 2022/10/09.
//

import UIKit

class MenuController: UIViewController {
    
    var titleText: String? = nil

    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = titleText

    }
    
}
