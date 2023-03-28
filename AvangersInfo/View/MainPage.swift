//
//  MainPage.swift
//  AvangersInfo
//
//  Created by Soatov on 26/03/23.
//

import UIKit
import SnapKit

class MainPage: UIViewController {
    
    var apiService = ApiService()
    
    var heroesCollectionView : UICollectionView?
    var heroInfoCollectionView : UICollectionView?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setNavigations()
        
        setHeroesCollectionView()
        
        apiService.getHeroesData { (result) in
            print(result)
        }
        
    }
    
    func setNavigations(){
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(DismissSelf))
    }
    @objc private func DismissSelf(){
        dismiss(animated: true, completion: nil)
        
    }
    func setHeroesCollectionView(){
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let heroesCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.addSubview(heroesCollectionView)
        heroesCollectionView.showsHorizontalScrollIndicator = false
        heroesCollectionView.register(HeroesCollectionViewCell.self, forCellWithReuseIdentifier: HeroesCollectionViewCell.identifier)
        heroesCollectionView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.right.equalToSuperview()
            make.left.equalToSuperview().offset(10)
            make.top.equalToSuperview().offset(30)
            make.height.equalTo(view.snp.height).multipliedBy(0.25)
        }
        heroesCollectionView.delegate = self
        heroesCollectionView.dataSource = self
        
        let layout2 = UICollectionViewFlowLayout()
        layout2.scrollDirection = .vertical
        
        let heroInfoCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout2)
        
        view.addSubview(heroInfoCollectionView)
        heroInfoCollectionView.showsVerticalScrollIndicator = false
        heroInfoCollectionView.register(HeroInfoCollectionViewCell.self, forCellWithReuseIdentifier: HeroInfoCollectionViewCell.identifier)
        heroInfoCollectionView.snp.makeConstraints { make in
            make.top.equalTo(heroesCollectionView.snp.bottom).offset(10)
            make.height.equalTo(view.snp.height)
            make.centerX.equalToSuperview()
            make.width.equalTo(view.snp.width).multipliedBy(0.9)
            
            
        }
        heroInfoCollectionView.delegate = self
        heroInfoCollectionView.dataSource = self
        self.heroesCollectionView = heroesCollectionView
        self.heroInfoCollectionView = heroInfoCollectionView
    }
    
    
   
}
extension MainPage: UICollectionViewDataSource,UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if (collectionView == heroesCollectionView){
            return 10
        }else{
            return 1
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if (collectionView == heroesCollectionView){
            let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: HeroesCollectionViewCell.identifier, for: indexPath) as! HeroesCollectionViewCell
            return cell
        }else{
            let cell2 = collectionView.dequeueReusableCell(withReuseIdentifier: HeroInfoCollectionViewCell.identifier, for: indexPath) as!
                HeroInfoCollectionViewCell
            return cell2
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if (collectionView == heroesCollectionView){
            return CGSize(width: collectionView.frame.width/4, height: collectionView.frame.width/4 )
            
        }else{
            return CGSize(width: collectionView.frame.width/1.1, height: collectionView.frame.height/1.5)
        }
    }
    
    
}
