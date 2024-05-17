//
//  tipo_investimento.swift
//  CIn_Juros
//
//  Created by Keine Vitor de Santana on 15/05/24.
//

import Foundation

enum investimento: String, CaseIterable {
    case selic = "Tesouro Selic"
    case prefixado = "Tesouro Prefixado"
    case ipca = "Tesouro IPCA+"
    case fundos = "Fundos Imobiliários"
    
    func calcularJuros(deValorInicial valorInicial: Double, eAporteMensal aporteMensal: Double, eTotalAnos totalAnos: Double, eTotalMeses totalMeses: Double) -> Double {
        switch self {
        case .selic:
            let r = 0.05
            let n = 262
            let totalAnos = totalMeses / 12
            let totalMeses = totalMeses
            let valorFinal = valorInicial * pow((1 + r / Double(n)), (Double(n) * totalAnos))
            return valorFinal
        case .prefixado:
            let r = 0.08
            let n = 1 // Considerando um ano
            let totalAnos = totalAnos
            let valorFinal = valorInicial * pow((1 + r), (Double(n) * totalAnos))
            return valorFinal
        case .ipca:
            let variacaoIpca = 0.05
            let taxaJuros = 0.06
            let valorCorrigido = valorInicial * (1 + variacaoIpca)
            let totalAnos = totalAnos
            let valorFinal = valorCorrigido * pow((1 + taxaJuros), Double(totalAnos))
            return valorFinal
        case .fundos:
            let valorCota = 10.0
            let jurosCota = 0.1
            let totalAnos = totalAnos
            let valorFinal = valorInicial * (1 + jurosCota) * Double(totalAnos) + aporteMensal
            return valorFinal
        }
    }
}
