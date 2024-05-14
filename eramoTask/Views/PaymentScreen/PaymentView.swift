//
//  PaymentView.swift
//  eramoTask
//
//  Created by Moataz Mohamed on 13/05/2024.
//

import UIKit

class PaymentView: UIViewController {

    
//    MARK: - Outlets
    
    @IBOutlet weak var cashPaymentLabel: UILabel!
    @IBOutlet weak var mainPaymentView: UIView!
    @IBOutlet weak var mobileWalletLabel: UILabel!
    @IBOutlet weak var progressV: UIView!
    @IBOutlet weak var confirmButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    
    
//    MARK: - View Controller life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUi()

    }

//    MARK: - Actions
    @IBAction func backButtonAction(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    @IBAction func confirmButtonAction(_ sender: Any) {
        navigationController?.pushViewController(FinalScreen(), animated: true)
    }
    

//    MARK: - Privates
    
    private func configUi(){
        backButton.layer.cornerRadius = 15
        confirmButton.layer.cornerRadius = 15
        
        progressV.layer.cornerRadius = 15
        
        cashPaymentLabel.layer.cornerRadius = 15
        cashPaymentLabel.clipsToBounds = true
        mobileWalletLabel.layer.cornerRadius = 15
        mobileWalletLabel.clipsToBounds = true
        
        mainPaymentView.layer.cornerRadius = 15
    }

}
