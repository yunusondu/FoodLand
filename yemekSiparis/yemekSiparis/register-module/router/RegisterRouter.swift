//
//  RegisterRouter.swift
//  yemekSiparis
//
//  Created by Macbook Air on 15.01.2022.
//

import Foundation

class RegisterRouter : PresenterToRouterRegisterProtocol{
    static func createModule(ref: RegisterVC) {
        ref.registerPresenterNesnesi = RegisterPresenter()
        ref.registerPresenterNesnesi?.registerInteractor = RegisterInteractor()
    }
    
}

