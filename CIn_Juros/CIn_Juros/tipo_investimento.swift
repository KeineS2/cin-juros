//
//  tipo_investimento.swift
//  CIn_Juros
//
//  Created by Keine Vitor de Santana on 15/05/24.
//

import Foundation

enum investimento: String, CaseIterable{
    case selic = "Tesouro Selic"
    case prefixado = "Tesouro Prefixado"
    case ipca = "Tesouro IPCA+"
    case fundos = "Fundos Imobiliários"
    
    func calcularJurosSelic (deValorInicial valorInicialSelic: Int, eAporteMensal aporteMensal: Int) -> Int{
        
        let resultado: Double
        let r: Double
        let n: Double
        let valorCorrigido: Double
        let valorCota: Double
        let jurosCota: Double
        let valorInicial: Double
        let variacaoIpca: Double
        let taxaJuros: Double
        let t: Double
        
        switch self {
        case .selic:
            r = 0.05
            n = 252
        case .prefixado:
            r = 0.08
        case .ipca:
            valorCorrigido = Double(valorInicial * (1 + variacaoIpca))
            variacaoIpca = 0.05
            taxaJuros = 0.06
        case .fundos:
            valorCota = 10
            jurosCota = 0.1
        }
        
        let resultado = valorInicialSelic * (1 + r / n) * n * t
        
        return resultado
        
    }
    
}
