//
//  HomeContracts.swift
//  Reddit_Clone
//
//  Created by Kemal Ekren on 15.04.2021.
//

import Foundation

protocol HomeVMProtocol: class {
    var delegate: HomeVMOutputDelegate? { get set }
    func load()
}

protocol HomeVMOutputDelegate: class {
    func updateItems(_ items:[HomePresentation])
    func showAlert(type: NetworkError)
}

