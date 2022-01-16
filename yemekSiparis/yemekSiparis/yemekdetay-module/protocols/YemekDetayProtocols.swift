//
//  YemekDetayProtocols.swift
//  yemekSiparis
//
//  Created by Macbook Air on 10.01.2022.
//

import Foundation
protocol PresenterToInteractorYemekDetayProtocol {
    func sepeteEkle(yemek_adi:String,yemek_resim_adi:String,yemek_fiyat:Int,yemek_siparis_adet:Int,kullanici_adi:String)

}

protocol ViewToPresenterYemekDetayProtocol {
    var yemekDetayInteractor:PresenterToInteractorYemekDetayProtocol? {get set}
    func Ekle(yemek_adi:String,yemek_resim_adi:String,yemek_fiyat:Int,yemek_siparis_adet:Int,kullanici_adi:String)

}

protocol PresenterToRouterYemekDetayProtocol {
    static func createModule(ref:YemekDetayVC)
}
