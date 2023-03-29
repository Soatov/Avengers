//
//  HeroesCollectionViewCell.swift
//  AvangersInfo
//
//  Created by Soatov on 27/03/23.
//

import UIKit
import SnapKit
import Kingfisher

class HeroesCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "HeroesCollectionViewCell"
    
    var heroName = UILabel()
    var heroImage = UIImageView()
    
    private var urlString: String = ""
    var url = URL(string: "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784.jpg")

    
    func setCellWithValueOf(_ hero:Result){
        updateUI(name: hero.name)
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setCellItems()
        
    }
    private func updateUI(name: String? ) {
        self.heroName.text = name
//        self.url = URL(string: "\(String(describing: imageURL)).jpg?")
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setCellItems(){
    
        self.addSubview(heroImage)
        heroImage.kf.setImage(with: url)
        heroImage.layer.cornerRadius = 20
        heroImage.layer.borderColor = UIColor.black.cgColor
        heroImage.layer.borderWidth = 1
        heroImage.snp.makeConstraints { make in
            make.left.right.top.equalToSuperview()
            make.height.equalTo(self.snp.height).multipliedBy(0.8)
        }
        self.addSubview(heroName)
        heroName.text = "Hulk"
        heroName.textAlignment = .center
        heroName.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        heroName.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalTo(heroImage.snp.bottom).offset(10)
            make.height.equalTo(self.snp.height).multipliedBy(0.2)
        }
    }
}
