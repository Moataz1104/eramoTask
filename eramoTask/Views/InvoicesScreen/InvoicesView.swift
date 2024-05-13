//
//  InvoicesView.swift
//  eramoTask
//
//  Created by Moataz Mohamed on 13/05/2024.
//

import UIKit

class InvoicesView: UIViewController {
    
    
    let selectedInstructors : [InstructorModel]

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    init(selectedInstructors: [InstructorModel]) {
        self.selectedInstructors = selectedInstructors
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
