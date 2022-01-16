//
//  SepetProtocols.swift
//  yemekSiparis
//
//  Created by Macbook Air on 10.01.2022.
//

import Foundation

protocol PresenterToInteractorSepetProtocol {
    var sepetPresenter:InteractorToPresenterSepetProtocol? {get set}
    func yemekleriYukle()
    func sil(sepet_yemek_id:Int,kullanici_adi: String)
}

//Ana protocol
protocol ViewToPresenterSepetProtocol {
    var sepetInteractor:PresenterToInteractorSepetProtocol? {get set}
    var sepetView:PresenterToViewSepetProtocol? {get set}
    
    func tumYemekleriAl()
   
    func yemekSil(sepet_yemek_id:Int,kullanici_adi: String)
}

//Taşıyıcı protocol
protocol InteractorToPresenterSepetProtocol {
    func presenteraVeriGonder(sepetListesi:Array<SepetYemekler>)
}

//Taşıyıcı Protocol
protocol PresenterToViewSepetProtocol {
    func vieweVeriGonder(sepetListesi:Array<SepetYemekler>)
}

//Router protocol
protocol PresenterToRouterSepetProtocol {
    static func createModule(ref:SepetVC)
}

