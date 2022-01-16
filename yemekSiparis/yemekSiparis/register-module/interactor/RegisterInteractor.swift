//
//  RegisterInteractor.swift
//  yemekSiparis
//
//  Created by Macbook Air on 15.01.2022.
//

import Foundation


class RegisterInteractor: PresenterToInteractorRegisterProtocol {

let context = appDelegate.persistentContainer.viewContext
func kisiEkle(kullanici_adi: String, kullanici_sifre: String) {
    //Kayıt yapmak istiyorsan model sınıfından entities den bir sınıf oluştur.
    let kullanici = LoginModel(context: context)
    

    kullanici.kullanici_adi = kullanici_adi
    kullanici.kullanici_sifre = kullanici_sifre
    
    appDelegate.saveContext()
    
}

}
