//
//  ApiService.swift
//  AvangersInfo
//
//  Created by Soatov on 27/03/23.
//

import Foundation

class ApiService{
    
    private var dataTask: URLSessionDataTask?
    
    func  getHeroesData(completion: @escaping  (Swift.Result<Welcome, Error>) -> Void){
        
        let heroesInfoURL =  "https://gateway.marvel.com:443/v1/public/characters?ts=1&apikey=9bd900ab61a43d9f00f432f1092a15c8&hash=e66ebc195fbde4f419240c0dac28adae&offset=0&limit=10"
        
        guard let url = URL(string: heroesInfoURL) else {return}
        //Create URL session - work on the background
         
        dataTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            //Handle Error
            if let error = error {
                completion(.failure(error))
                print("DataTask error: \(error.localizedDescription)")
                return
            }
            guard let response = response as? HTTPURLResponse else{
                //Handle Empty Response
                print("Empty Response")
                return
            }
            print("Responce status code:\(response.statusCode)")
            
            guard let data = data else {
                //Handle Empty Data
                print("Empty data")
                return
            }
            do {
                //Parse the data
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(Welcome.self, from: data)
                
                DispatchQueue.main.async {
                    completion(.success(jsonData))
                }
            } catch let error{
                 completion(.failure(error))
            }
        }
        dataTask?.resume()
    }
}
