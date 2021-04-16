//
//  HomeVM.swift
//  Reddit_Clone
//
//  Created by Kemal Ekren on 15.04.2021.
//

import Foundation

class HomeVM: HomeVMProtocol {
   weak var delegate: HomeVMOutputDelegate?
    
    private let service: PostRequest
    init(service: PostRequest) {
        self.service = service
    }
    
    func load() {
            self.service.fetchPost {  (result) in
                switch result {
                case .success(let data):
                    let presentation = data.map(HomePresentation.init)
                    self.delegate?.updateItems(presentation)
                case .failure(let error):
                    self.delegate?.showAlert(type: error)
                }
            }
    }
}
