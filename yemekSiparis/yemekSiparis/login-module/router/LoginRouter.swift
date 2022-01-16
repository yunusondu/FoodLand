//
//  LoginRouter.swift
//  yemekSiparis
//
//  Created by Macbook Air on 15.01.2022.
//

import Foundation

class LoginRouter : PresenterToRouterLoginProtocol{
    static func createModule(ref: LoginVC) {
        let presenter = LoginPresenter()
        
        //View için yetkilendirme
        ref.loginPresenterNesnesi = presenter
        
        
        //Presenter için yetkilendirme
        ref.loginPresenterNesnesi?.loginInteractor = LoginInteractor()
        ref.loginPresenterNesnesi?.loginView = ref
        
        //Interactor için yetkilendirme
        ref.loginPresenterNesnesi?.loginInteractor?.loginPresenter = presenter
    }
    
}
