//
//  productDetailViewModel.swift
//  E-Commerce
//
//  Created by Iqlima Rahmawati on 24/03/23.
//

import Foundation
protocol productDetailViewModelProtocol {
    
    var urlString : String {get set}
    var bindDetailProductData : (([ProductModel]?)->())? {get set}
    func fetchDataProduct()
}

class productDetailViewModel: productDetailViewModelProtocol {
    private var apiService : ApiServiceProductProtocol?
    var urlString: String
    var data : [ProductModel]?
    
    var bindDetailProductData: (([ProductModel]?) -> ())?
    
    init(urlString : String, apiService: ApiServiceProductProtocol) {
        self.urlString = urlString
        self.apiService = apiService
        
        if let url = URL(string: urlString) {
            self.apiService?.get(url: url)
        }
        fetchDataProduct()
        
    }
    func fetchDataProduct() {
        self.apiService?.callApi(model: [ProductModel].self, completion: { response in
//            print("response: \(response)")
            switch response {
                
            case .success(let success):
                self.bindDetailProductData?(success)
            case .failure(_):
                self.bindDetailProductData?(nil)
            }
        })
    
    }
    
    
    
}

