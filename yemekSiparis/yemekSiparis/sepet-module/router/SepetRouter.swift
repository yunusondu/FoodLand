//
//  SepetRouter.swift
//  yemekSiparis
//
//  Created by Macbook Air on 10.01.2022.
//

import Foundation

class SepetRouter : PresenterToRouterSepetProtocol {
    static func createModule(ref: SepetVC) {
        let presenter = SepetPresenter()
        
        //View için yetkilendirme
        ref.sepetPresenterNesnesi = presenter
        
        //Presenter için yetkilendirme
        ref.sepetPresenterNesnesi?.sepetInteractor = SepetInteractor()
        ref.sepetPresenterNesnesi?.sepetView = ref
        
        //Interactor için yetkilendirme
        ref.sepetPresenterNesnesi?.sepetInteractor?.sepetPresenter = presenter
    }
}
