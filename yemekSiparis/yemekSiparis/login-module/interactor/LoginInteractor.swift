//
//  LoginInteractor.swift
//  yemekSiparis
//
//  Created by Macbook Air on 15.01.2022.
//

import Foundation

class LoginInteractor : PresenterToInteractorLoginProtocol {
        var loginPresenter: InteractorToPresenterLoginProtocol?
    
        let context = appDelegate.persistentContainer.viewContext
        
        func tumKisileriAl() {
            
            do{
                let liste = try context.fetch(LoginModel.fetchRequest())
                loginPresenter?.presenteraVeriGonder(kullaniciListesi: liste)
            }catch{}
            
        }
      
    }

