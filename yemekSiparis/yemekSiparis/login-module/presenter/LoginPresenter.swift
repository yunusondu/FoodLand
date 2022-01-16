//
//  LoginPresenter.swift
//  yemekSiparis
//
//  Created by Macbook Air on 15.01.2022.
//

import Foundation

class LoginPresenter : ViewToPresenterLoginProtocol {
    var loginInteractor: PresenterToInteractorLoginProtocol?
    var loginView: PresenterToViewLoginProtocol?
    
    func kisileriYukle() {
        loginInteractor?.tumKisileriAl()
    }
}

extension LoginPresenter : InteractorToPresenterLoginProtocol {
    func presenteraVeriGonder(kullaniciListesi: Array<LoginModel>) {
        loginView?.vieweVeriGonder(kullaniciListesi: kullaniciListesi)
    }
}
