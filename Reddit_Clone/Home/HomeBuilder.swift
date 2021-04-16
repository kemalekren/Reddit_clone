//
//  HomeBuilder.swift
//  Reddit_Clone
//
//  Created by Kemal Ekren on 15.04.2021.
//

import UIKit

final class HomeBuilder {

    static func make()-> HomeVC {
        let storyBoard = UIStoryboard(name: "HomeVC", bundle: nil)
        let viewController = storyBoard.instantiateViewController(withIdentifier: "HomeVC") as! HomeVC
        viewController.vm = HomeVM(service: PostRequest())
        return viewController
    }
}
