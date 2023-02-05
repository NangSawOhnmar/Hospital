//
//  NRCData.swift
//  Hospital
//
//  Created by nang saw on 04/02/2023.
//

import Foundation

class NRCData: NSObject{
    static let naing = ["N(နိုင်)","F(ဧည့်)","P(ပြု)","T(ယာယီ)","Other"]
    static let N = ["N","F","P","T","O"]
    static let state_no = ["1","2","3","4","5","6","7","8","9","10","11","12","13","14"]
    static let district = [["HsaBaTa", "HsaDaNa", "RaBaYa", "KaPaTa", "PaWaNa", "KaMaTa", "MaLaNa", "AhGaYa", "BaMaNa", "DaPhaYa", "HaPaNa", "KaMaNa", "KhaBaDa", "KhaLaPha", "KhaPhaNa", "LaGaNa", "MaKaNa", "MaKaTa", "MaKaBa", "MaMaNa", "NaMaNa", "MaNyaNa", "MaSaNa", "PaNaDa", "PaTaAh", "SaLaNa", "SaPaBa", "TaNaNa", "WaMaNa", "YaKaNa"],
                           ["BaLaKha", "DaMaSa", "LaKaNa", "MaSaNa", "PhaSaNa", "PhaYaSa", "YaTaNa", "YaThaNa"],
                           ["RaRaTha", "LaThaNa", "BaGaLa", "KaMaMa", "SaKaLa", "WaLaMa", "BaAhNa", "BaThaSa", "KaSaKa", "KaDaNa", "KaKaYa", "LaBaNa", "MaWaTa", "PaKaNa", "PhaPaNa", "ThaTaKa", "ThaTaNa"],
                           ["HsaMaNa", "HaKhaNa", "HtaTaLa", "KaKhaNa", "KaPaLa", "MaTaNa", "MaTaPa", "PaLaWa", "PhaLaNa", "TaTaNa", "TaZaNa", "YaKhaDa", "TaZaNa"],
                           ["KhaPaNa", "DaHaNa", "MaPaLa", "HtaPaKha", "HsaMaRa", "AhTaNa", "AhYaTa", "BaMaNa", "BaTaLa", "DaPaYa", "HaMaLa", "HtaKhaNa", "KaBaLa", "KaLaHta", "KaLaNa", "KaLaTa", "KaLaWa", "KaNaNa", "KaMaNa", "KhaTaNa", "KaThaNa", "KhaOoNa", "KhaOoTa", "LaHaNa", "LaYaNa", "MaKaNa", "MaLaNa", "MaMaTa", "MaThaNa", "NaYaNa", "NgaZaNa", "PaLaNa", "PaSaNa", "SaKaNa", "SaLaKa", "TaSaNa", "WaLaNa", "YaBaNa", "YaMaPa", "MaMaNa", "MaYaNa", "PaLaBa", "PhaPaNa", "TaMaNa", "WaThaNa", "YaOoNa"],
                           ["KaLaAh", "PaLaTa", "PaKaMa", "BaPaNa", "HtaWaNa", "KaThaNa", "KaYaYa", "LaLaNa", "MaAhNa", "MaAhYa", "PaLaNa", "TaThaYa", "YaPhaNa", "MaMaNa", "KaSaNa", "KhaMaKa", "MaTaNa", "ThaYaKha"],
                           ["AhPhaNa", "DaOoNa", "HtaTaPa", "KaPaKa", "KaTaKha", "LaPaTa", "MaLaNa", "NaTaLa", "NyaLaPa", "PaKhaNa", "PaTaNa", "PhaMaNa", "TaNgaNa", "ThaNaPa", "ThaWaTa", "YaKaNa", "YaTaNa", "ZaKaNa", "AhTaNa", "KaKaNa", "KaWaNa", "MaNyaNa", "PaKhaTa", "PaTaTa", "ThaKaNa", "WaMaNa", "YaTaYa"],
                           ["MaHtaNa", "AhLaNa", "HtaLaNa", "KaHtaNa", "KhaMaNa", "MaBaNa", "MaLaNa", "MaMaNa", "MaTaNa", "NaMaNa", "NgaPhaNa", "PaMaNa", "PaPhaNa", "SaMaNa", "SaPaWa", "SaTaYa", "TaTaKa", "YaNaKha", "YaSaKa", "GaGaNa", "KaMaNa", "MaKaNa", "MaThaNa", "PaKhaKa", "SaLaNa", "SaPhaNa", "ThaYaNa"],
                           ["NgaZaNa", "AhMaZa", "KaPaTa", "KaSaNa", "KhaMaSa", "LaWaNa", "MaHtaLa", "MaKaNa", "MaLaNa", "MaMaNa", "MaNaTa", "MaTaYa", "MaYaMa", "MaYaTa", "NgaThaYa", "NyaOoNa", "PaBaNa", "PaMaNa", "PaOoLa", "SaKaNa", "SaKaTa", "TaKaTa", "TaTaOo", "ThaPaKa", "ThaSaNa", "YaMaTha", "OoTaTha", "ZaYaTha", "PaBaTha", "DaKhaTha", "ZaBaTha", "AhMaYa", "KhaAhZa", "MaHaMa", "MaKhaNa", "MaNaMa", "MaThaNa", "NaHtaKa", "PaKaKha", "PaThaKa", "TaKaNa", "TaThaNa", "WaTaNa"],
                           ["KhaZaNa", "BaLaNa", "KaMaYa", "KhaSaNa", "LaMaNa", "MaLaMa", "PaMaNa", "ThaPhaYa", "YaMaNa", "KaHtaNa", "MaDaNa", "ThaHtaNa"],
                           ["TaPaWa", "BaThaTa", "GaMaNa", "KaPhaNa", "KaTaNa", "MaAhNa", "MaAhTa", "MaPaTa", "MaOoNa", "MaPaNa", "MaTaNa", "PaNaKa", "PaTaNa", "SaTaNa", "TaKaNa", "ThaTaNa", "YaBaNa", "YaThaTa", "AhMaNa", "KaTaLa"],
                           ["AhLaNa", "AhSaNa", "BaHaNa", "BaTaHta", "DaGaMa", "DaGaNa", "DaGaSa", "DaGaTa", "DaGaYa", "DaLaNa", "DaPaNa", "HtaTaPa", "KaKaKa", "KaKhaKa", "KaMaNa", "KaMaTa", "KaMaYa", "KaTaNa", "KaTaTa", "KhaYaNa", "LaKaNa", "LaMaNa", "LaMaTa", "LaThaNa", "LaThaYa", "MaBaNa", "MaGaDa", "MaGaTa", "MaYaKa", "OKaMa", "OKaTa", "PaBaTa", "PaZaTa", "SaKaKha", "SaKaNa", "SaKhaNa", "TaKaNa", "TaMaNa", "TaTaNa", "TaTaTa", "ThaGaKa", "ThaKaTa", "ThaKhaNa", "ThaLaNa", "YaKaNa", "TaPaTha"],
                           ["KaTaLa", "NaTaYa", "KhaLaNa", "KaLaDa", "PaHSaNa", "MaKaHta", "PaHsaTa", "MaLaTa", "PaLaHta", "MaYaNa", "MaHsaNa", "MaHtaNa", " AhTaNa", "HaMaNa", "HaPaNa", "HaPaTa", "KaHaNa", "KaKaNa", "KaKhaNa", "KaLaHta", "KaLaNa", "KaLaTa", "KaMaNa", "KaTaKa", "KaTaNa", "KaTaTa", "KaThaNa", "KhaYaHa", "LaKaNa", "LaKhaNa", "LaKhaTa", "LaLaNa", "LaYaNa", "MaBaNa", "MaHaYa", "MaKaNa", "MaKaTa", "MaKhaNa", "MaKhaTa", "MaLaNa", "MaMaHta", "MaMaNa", "MaMaTa", "MaNaNa", "MaNaTa", "MaNgaNa", "MaPaHta", "MaPaNa", "MaPaTa", "MaPhaNa", "MaPhaTa", "MaSaNa", "MaHsaTa", "MaHtaTa", "MaTaNa", "MaTaTa", "MaYaHta", "MaRaTa", "MaRaNa", "MaYaTa", "NaKhaNa", "NaKhaTa", "NaMaTa", "NaPhaNa", "NaHsaNa", "NaSaNa", "NaTaNa", "NyaYaNa", "PhaKhaNa", "PaLaNa", "PaLaTa", "PaPaKa", "PaTaYa", "PaWaNa", "PaYaNa", "HsaHsaNa", "TaKaNa", "TaKhaLa", "TaLaNa", "TaMaNya", "TaTaNa", "TaYaNa", "ThaNaNa", "ThaPaNa", "YaNgaNa", "YaSaNa"],
                           ["KaKaHta", "AhGaPa", "AhMaNa", "AhMaTa", "BaKaLa", "DaDaYa", "DaNaPha", "HaKaKa", "HaThaTa", "KaKaTa", "KaKaNa", "KaKhaNa", "KaLaNa", "KaPaNa", "LaMaNa", "LaPaTa", "MaAhNa", "MaAhPa", "MaMaKa", "MaMaNa", "NgaPaTa", "NgaSaNa", "NgaThaKha", "NgaYaKa", "NyaTaNa", "PaSaLa", "PaTaNa", "PaThaNa", "PaThaYa", "PhaPaNa", "ThaPaNa", "WaKhaMa", "YaKaNa", "YaThaYa", "ZaLaNa"]]
}
