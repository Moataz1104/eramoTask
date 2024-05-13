//
//  SubjectsView.swift
//  eramoTask
//
//  Created by Moataz Mohamed on 13/05/2024.
//

import UIKit

class SubjectsView: UIViewController {

//    MARK: Outlets
    
    let fakeSubjectsData = ["Math","English","Biology","France",
                            "Geography","History","Chemistry","Programming",
                            "Arabic","Germany"]
    
    var selectedSubjects:[String] = []
    
    @IBOutlet weak var upperView: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var nextButton: UIButton!
    
    
//    MARK: ViewController life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.collectionViewLayout = TwoColumnFlowLayout()

        configUI()

        registerCell()
    }

//    MARK:  - Actions
    
    @IBAction func nextButtonAction(_ sender: Any) {
        navigationController?.pushViewController(InstructorsView(), animated: true)
    }
    

    
    
    
//    MARK: Private functions
    
    private func configUI(){
        upperView.layer.cornerRadius = 40
        nextButton.layer.cornerRadius = 15
    }
    
    private func registerCell(){
        collectionView.register(UINib(nibName: SubjectCell.identifier, bundle: nil), forCellWithReuseIdentifier: SubjectCell.identifier)
    }


}



extension SubjectsView:UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return fakeSubjectsData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SubjectCell.identifier, for: indexPath) as! SubjectCell
        cell.subjectImage.image = UIImage(named: fakeSubjectsData[indexPath.item])
        cell.subjectName.text = fakeSubjectsData[indexPath.item]
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? SubjectCell else {
            return
        }
        cell.configSelection()
        if cell.isSelect{
            selectedSubjects.append(fakeSubjectsData[indexPath.item])
        }else{
            selectedSubjects.removeAll(where: {s in s == fakeSubjectsData[indexPath.item]})
        }
        
        print(selectedSubjects)
    }
    
}


class TwoColumnFlowLayout: UICollectionViewFlowLayout {
    
    override init() {
        super.init()
        scrollDirection = .vertical
        minimumInteritemSpacing = 12
        sectionInset = UIEdgeInsets(top: 15, left: 8, bottom: 0, right: 8)

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepare() {
        super.prepare()
        
        guard let collectionView = collectionView else { return }
        
        let availableWidth = collectionView.bounds.width - sectionInset.left - sectionInset.right - minimumInteritemSpacing
        let itemWidth = availableWidth / 2
        itemSize = CGSize(width: itemWidth, height: itemWidth)
    }
}
