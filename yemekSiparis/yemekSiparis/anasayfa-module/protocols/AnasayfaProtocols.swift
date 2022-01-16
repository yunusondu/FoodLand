//
//  AnasayfaProtocols.swift
//  yemekSiparis
//
//  Created by Macbook Air on 10.01.2022.
//

import Foundation

protocol PresenterToInteractorAnasayfaProtocol {
    var anasayfaPresenter:InteractorToPresenterAnasayfaProtocol? {get set}
     
    func tumYemekleriAl()
   
    
}
protocol ViewToPresenterAnasayfaProtocol {
    var anasayfaInteractor:PresenterToInteractorAnasayfaProtocol?{get set}
    var anasayfaView:PresenterToViewAnasayfaProtocol? {get set}
   
    func yemekleriAl()

}
protocol InteractorToPresenterAnasayfaProtocol {
    func presenteraVeriGonder(yemeklerListesi:Array<Yemekler>)

    
    
}
protocol PresenterToViewAnasayfaProtocol {
    func vieweVeriGonder(yemeklerListesi:Array<Yemekler>)

    
}
protocol PresenterToRouterAnasayfaProtocol {
    static func createModule(ref:AnasayfaVC)
}

