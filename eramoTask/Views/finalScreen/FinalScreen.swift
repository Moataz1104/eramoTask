//
//  FinalScreen.swift
//  eramoTask
//
//  Created by Moataz Mohamed on 14/05/2024.
//

import UIKit

class FinalScreen: UIViewController {

    
    @IBOutlet weak var browseHome: UIButton!
    @IBOutlet weak var progressV: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUi()

    }
    
    @IBAction func browseHomeAction(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
    
    
    
    private func configUi(){
        progressV.layer.cornerRadius = 15

        browseHome.layer.borderWidth = 1
        browseHome.layer.borderColor = UIColor.lightGray.cgColor
        browseHome.layer.cornerRadius = 15
        
    }


}
