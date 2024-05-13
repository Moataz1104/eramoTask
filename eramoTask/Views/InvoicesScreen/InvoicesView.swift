//
//  InvoicesView.swift
//  eramoTask
//
//  Created by Moataz Mohamed on 13/05/2024.
//

import UIKit

class InvoicesView: UIViewController {
    
    
    let selectedInstructors : [InstructorModel]
    
//    MARK: - Outlets
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var payNowLabel: UILabel!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var confirmButton: UIButton!
    @IBOutlet weak var invoicesdetailsLabel: UILabel!
    @IBOutlet weak var progressV: UIView!
    
//    MARK: - View Controller life cycke
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        registerCell()
        configUi()
    }
    
    init(selectedInstructors: [InstructorModel]) {
        self.selectedInstructors = selectedInstructors
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

//    MARK: - Actions
    @IBAction func backButtonAction(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func confirmButtonAction(_ sender: Any) {
    }
    
    
//    MARK: - Privates
    private func configUi(){
        backButton.layer.cornerRadius = 15
        confirmButton.layer.cornerRadius = 15
        
        progressV.layer.cornerRadius = 15
        
        payNowLabel.layer.cornerRadius = 15
        payNowLabel.clipsToBounds = true
        invoicesdetailsLabel.layer.cornerRadius = 15
        invoicesdetailsLabel.clipsToBounds = true
    }
    
    private func registerCell(){
        tableView.register(UINib(nibName: InvoiceCell.identifier, bundle: nil), forCellReuseIdentifier: InvoiceCell.identifier)
    }
}


extension InvoicesView : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        invoicesdetailsLabel.text = "Invoices Details (\(selectedInstructors.count))"
        payNowLabel.text = "Pay Now (\(selectedInstructors.reduce(0, {$0 + $1.price}))EGP)"
        
        return selectedInstructors.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: InvoiceCell.identifier, for: indexPath) as! InvoiceCell
        cell.invoiceDetailsLabel.text = "Invoices (\(indexPath.item + 1)) Details"
        
        cell.totalPrice.text = "\(selectedInstructors[indexPath.item].price)"
        cell.teacherName.text = selectedInstructors[indexPath.item].name
        cell.teacherSubject.text = selectedInstructors[indexPath.item].subject
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        270
    }
    
    
}
