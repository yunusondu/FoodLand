//
//  YemekDetayRouter.swift
//  yemekSiparis
//
//  Created by Macbook Air on 10.01.2022.
//

import Foundation

class YemekDetayRouter : PresenterToRouterYemekDetayProtocol {
    static func createModule(ref: YemekDetayVC) {
        ref.yemekDetayPresenterNesnesi = YemekDetayPresenter()
        ref.yemekDetayPresenterNesnesi?.yemekDetayInteractor = YemekDetayInteractor()
    }
}
