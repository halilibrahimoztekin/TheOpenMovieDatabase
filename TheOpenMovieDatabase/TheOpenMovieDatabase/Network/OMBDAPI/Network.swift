//
//  Network.swift
//  TheOpenMovieDatabase
//
//  Created by bukefalosWorkMac on 23.09.2022.
//

import Foundation

protocol NetworkDelegate: AnyObject {
    func request<T: Decodable>(with type: RequestType, completion: @escaping (Result<T, CustomError>) -> Void)
}
class Network : NetworkDelegate {
   

    func request<T: Decodable>(with type: RequestType, completion: @escaping (Result<T, CustomError>) -> Void) {
        
        guard let url = URL(string: type.endPoint) else {
            completion(.failure(.urlError))
            return
        }
        Logger.log(text: type.endPoint)
        
        var request = URLRequest(url: url)
        request.httpMethod = type.httpMethod.rawValue

        let session = URLSession.shared
        session.dataTask(with: request) { data, response, error in
            guard let data = data else {
                completion(.failure(.dataError))
                return
            }
            data.printAsJSON()

            let decoder = JSONDecoder()

            do {
                let decodedResponse = try decoder.decode(T.self, from: data)
                completion(.success(decodedResponse))
            }
            catch let error {
                let failure = self.errorHandling(data: data)
                completion(.failure(.decodingError(model: failure)))
                Logger.log(type: .error, text: error.localizedDescription)
            }
        }.resume()
        
    }
    
    func errorHandling(data: Data?) -> APIErrorModel {
        let decoder = JSONDecoder()
        
        guard let data = data else {
            return APIErrorModel(response: "Error", error: "No Data")
        }
        
        guard let decodedResponse = try? decoder.decode(APIErrorModel.self, from: data) else { return APIErrorModel(response: "Error", error: "Decode Error") }
        
        return decodedResponse
    }
    
}
