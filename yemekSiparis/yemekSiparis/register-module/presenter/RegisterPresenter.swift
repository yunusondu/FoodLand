//
//  RegisterPresenter.swift
//  yemekSiparis
//
//  Created by Macbook Air on 15.01.2022.
//

import Foundation

class RegisterPresenter : ViewToPresenterRegisterProtocol {
    var registerInteractor: PresenterToInteractorRegisterProtocol?
    
    func ekle(kullanici_adi: String, kullanici_sifre: String) {
        registerInteractor?.kisiEkle(kullanici_adi: kullanici_adi, kullanici_sifre: kullanici_sifre)
    }
    
}
