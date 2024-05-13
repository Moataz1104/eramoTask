//
//  InstructorCell.swift
//  eramoTask
//
//  Created by Moataz Mohamed on 13/05/2024.
//

import UIKit

class InstructorCell: UICollectionViewCell {

    static let identifier = "InstructorCell"
    @IBOutlet weak var instructorImage: UIImageView!
    @IBOutlet weak var instructorName: UILabel!
    @IBOutlet weak var instructorPrice: UILabel!
    @IBOutlet weak var instructorSubject: UILabel!
    @IBOutlet weak var bookLabel: UILabel!
    
    
    var isBooked = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configUi()
    }
    
    
    private func configUi(){
        layer.cornerRadius = 25
        layer.masksToBounds = true

        
        instructorImage.layer.cornerRadius = instructorImage.bounds.width / 2
        instructorImage.clipsToBounds = true
        
        bookLabel.layer.cornerRadius = 10
        bookLabel.clipsToBounds = true
        bookLabel.backgroundColor = .blue

    }
    
    
    @objc func configureBooking(){
        isBooked.toggle()
        
        if isBooked{
            bookLabel.text = "✓ Booked"
            bookLabel.backgroundColor = UIColor(named: "greencolor")
            layer.borderWidth = 2
            layer.borderColor = UIColor(named: "greencolor")?.cgColor
        }else{
            bookLabel.text = "Book"
            bookLabel.backgroundColor = .blue
            layer.borderWidth = 0
        }
        
    }

}
