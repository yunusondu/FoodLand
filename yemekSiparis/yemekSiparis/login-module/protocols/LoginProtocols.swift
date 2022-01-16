//
//  LoginProtocols.swift
//  yemekSiparis
//
//  Created by Macbook Air on 15.01.2022.
//

import Foundation

//Ana protocol

protocol PresenterToInteractorLoginProtocol {
    var loginPresenter:InteractorToPresenterLoginProtocol? {get set}
    
    func tumKisileriAl()
   
    
}

// Ana protocol
protocol ViewToPresenterLoginProtocol {
    var loginInteractor:PresenterToInteractorLoginProtocol?{get set}
    var loginView:PresenterToViewLoginProtocol? {get set}
    func kisileriYukle()
    
}

//Taşıyıcı protocol
protocol InteractorToPresenterLoginProtocol {
    func presenteraVeriGonder(kullaniciListesi:Array<LoginModel>)
    
}

//Taşıyıcı Protocol
protocol PresenterToViewLoginProtocol {
    func vieweVeriGonder(kullaniciListesi:Array<LoginModel>)
}

//Router Protocol
protocol PresenterToRouterLoginProtocol {
    static func createModule(ref:LoginVC)
}
