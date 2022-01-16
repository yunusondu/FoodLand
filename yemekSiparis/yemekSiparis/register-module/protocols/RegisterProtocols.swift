//
//  RegisterProtocols.swift
//  yemekSiparis
//
//  Created by Macbook Air on 15.01.2022.
//

import Foundation


protocol PresenterToInteractorRegisterProtocol {
    func kisiEkle(kullanici_adi:String, kullanici_sifre:String)
}


protocol ViewToPresenterRegisterProtocol {
    var registerInteractor:PresenterToInteractorRegisterProtocol?{get set}
    
    func ekle(kullanici_adi:String,kullanici_sifre:String)
}


protocol PresenterToRouterRegisterProtocol {
    static func createModule(ref:RegisterVC)
}
