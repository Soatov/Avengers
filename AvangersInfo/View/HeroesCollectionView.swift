//
//  HeroesCollectionView.swift
//  AvangersInfo
//
//  Created by Soatov on 05/04/23.
//

import UIKit

protocol UpdateContentViewData {
    func getItem(model: Result)
}
class HeroesCollectionView: UICollectionView {
    
    let viewModel: HeroesViewModel
    var navDelegate: UpdateContentViewData?
    
    init(viewModel: HeroesViewModel) {
        let flowLayout: UICollectionViewFlowLayout = .init()
        flowLayout.scrollDirection = .horizontal
        self.viewModel = viewModel
        super.init(frame: .zero, collectionViewLayout: flowLayout)
        initView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initView(){
        self.showsHorizontalScrollIndicator = false
        self.dataSource = self
        self.delegate   = self
        self.register(HeroesCollectionViewCell.self, forCellWithReuseIdentifier: "HeroesCollectionViewCell")
        
        
    }
        
    
}
extension HeroesCollectionView: UICollectionViewDataSource,UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            
            return viewModel.numberOfRowsInSection(section: section)
           
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
                let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: HeroesCollectionViewCell.identifier, for: indexPath) as! HeroesCollectionViewCell
                let hero = viewModel.cellForRowAt(indexPath: indexPath)
                
                cell.setCellWithValueOf(hero)
            
                return cell
            
        }
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            
            return CGSize(width: collectionView.frame.width/4, height: collectionView.frame.width/4 )
        }
        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

            navDelegate?.getItem(model: viewModel.cellForRowAt(indexPath: indexPath))

            }
       func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
            print("IndexPath\(indexPath)")
           if indexPath.item == (viewModel.numberOfRowsInSection(section: indexPath.section)-1){
               viewModel.fetchHeroesData {
                   collectionView.reloadData()
               }
           }
        }
        
    }
