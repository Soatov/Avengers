//
//  HeroesViewModel.swift
//  AvangersInfo
//
//  Created by Soatov on 29/03/23.
//

import Foundation

class HeroesViewModel {
    
    private var apiService = ApiService()
    private var heroes     = [Result] ()
    
    func fetchHeroesData(completion: @escaping() -> ()){
        apiService.getHeroesData { [weak self] (result) in
            switch result{
            case .success(let listOf):
                self?.heroes = listOf.data.results
                completion()
            case.failure(let error):
                print("Error processing json data: \(error)")
            }
            
        }
    }
    func numberOfRowsInSection(section: Int)-> Int {
        if (heroes.count != 0) {
            return heroes.count
        }
        return 0
    }
    func cellForRowAt (indexPath: IndexPath) -> Result {
        return heroes[indexPath.row]
    }
}
