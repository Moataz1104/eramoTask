//
//  SubjectCell.swift
//  eramoTask
//
//  Created by Moataz Mohamed on 13/05/2024.
//

import UIKit

class SubjectCell: UICollectionViewCell {
    static let identifier = "SubjectCell"

    @IBOutlet weak var subjectImage: UIImageView!
    @IBOutlet weak var subjectName: UILabel!
    
    var isSelect = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configUI()
        
    }
    
    
    private func configUI() {
        contentView.layer.cornerRadius = 25 
        contentView.layer.masksToBounds = true
        contentView.backgroundColor = .white
        
    }
    
    func configSelection(){
        isSelect.toggle()
        if isSelect {
            addGradiant()
        } else {
            removeGradiant()
        }
        
    }
    
    private func addGradiant(){
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor.green.withAlphaComponent(0.35).cgColor, UIColor.white.cgColor]
        gradientLayer.startPoint = CGPoint(x: 1, y: 1)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        gradientLayer.cornerRadius = 25
        gradientLayer.frame = bounds
        layer.addSublayer(gradientLayer)

    }
    
    private func removeGradiant(){
        layer.sublayers?.removeAll { $0 is CAGradientLayer }

    }


}
