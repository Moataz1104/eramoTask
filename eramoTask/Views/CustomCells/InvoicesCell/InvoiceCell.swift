//
//  InvoiceCell.swift
//  eramoTask
//
//  Created by Moataz Mohamed on 13/05/2024.
//

import UIKit

class InvoiceCell: UITableViewCell {
    static let identifier = "InvoiceCell"

    
    @IBOutlet weak var invoiceDetailsLabel: UILabel!
    @IBOutlet weak var totalPrice: UILabel!

    @IBOutlet weak var teacherSubject: UILabel!
    @IBOutlet weak var teacherName: UILabel!
    @IBOutlet weak var paymentDate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
     
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.layer.cornerRadius = 20

        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 0, left: 0, bottom: 10, right: 0))
    }


    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
}
