//
//  InstructorsView.swift
//  eramoTask
//
//  Created by Moataz Mohamed on 13/05/2024.
//

import UIKit

class InstructorsView: UIViewController {
    
    let fakInstructors = [
        InstructorModel(name: "MR.Mohamed", price: 4500, subject: "Math"),
        InstructorModel(name: "MR.Ahmed", price: 3000, subject: "History"),
        InstructorModel(name: "MR.youssef", price: 5500, subject: "Germany"),
        InstructorModel(name: "MR.Moataz", price: 6500, subject: "English"),
        InstructorModel(name: "MR.Mohamed", price: 2000, subject: "Arabic"),
        InstructorModel(name: "MR.Mohamed", price: 4500, subject: "Math"),
        InstructorModel(name: "MR.Mohamed", price: 6500, subject: "Biology"),
        InstructorModel(name: "MR.Mohamed", price: 6500, subject: "Programming"),
        InstructorModel(name: "MR.Mohamed", price: 3300, subject: "Math"),
        InstructorModel(name: "MR.Mohamed", price: 3500, subject: "History"),
        InstructorModel(name: "MR.Mohamed", price: 5000, subject: "Math"),
        InstructorModel(name: "MR.Mohamed", price: 2500, subject: "English")
    ]
    
    var selectedInstructors = [InstructorModel]()
    
    
    //    MARK: Outlets

    @IBOutlet weak var upperView: UIView!
    @IBOutlet weak var nextButtonOutlet: UIButton!
    @IBOutlet weak var backButtonOutlet: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!
    
    //    MARK: ViewController life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        registerCell()
        configUi()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.collectionViewLayout = TwoColumnFlowLayout()



    }
    
    //    MARK:  - Actions

    
    @IBAction func nextButtonAction(_ sender: Any) {
        navigationController?.pushViewController(InvoicesView(selectedInstructors: selectedInstructors), animated: true)
    }
    @IBAction func backButtonAction(_ sender: Any) {
        navigationController?.popViewController(animated: true)
        
    }
    
    //    MARK: Private functions

    private func configUi(){
        upperView.layer.cornerRadius = 40
        nextButtonOutlet.layer.cornerRadius = 15
        backButtonOutlet.layer.cornerRadius = 15
    }
    
    private func registerCell(){
        collectionView.register(UINib(nibName: InstructorCell.identifier, bundle: nil), forCellWithReuseIdentifier: InstructorCell.identifier)
    }

    
    
    

}


extension InstructorsView:UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        fakInstructors.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: InstructorCell.identifier, for: indexPath) as! InstructorCell
        
        cell.instructorName.text = fakInstructors[indexPath.item].name
        cell.instructorPrice.text = "\(fakInstructors[indexPath.item].price) EGP"
        cell.instructorSubject.text = fakInstructors[indexPath.item].subject

        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? InstructorCell else {return}
            
        selectedInstructors.append(fakInstructors[indexPath.item])
        cell.configureBooking()
        

    }
    
}
