//
//  tipo_investimento.swift
//  CIn_Juros
//
//  Created by Keine Vitor de Santana on 15/05/24.
//

import Foundation

enum Investimento: String, CaseIterable {
    case selic = "Tesouro Selic"
    case prefixado = "Tesouro Prefixado"
    case ipca = "Tesouro IPCA+"
    case fundos = "Fundos Imobiliários"
    
    func calcularJuros(deValorInicial valorInicial: Double, eAporteMensal aporteMensal: Double, eTotalAnos totalAnos: Double, eTotalMeses totalMeses: Double) -> Double {
            let totalMeses = Int(totalAnos * 12) + Int(totalMeses) // Total de meses

            switch self {
            case .selic:
                let taxaAnual = 0.05
                let taxaMensal = pow(1 + taxaAnual, 1 / 12.0) - 1 // Taxa de juros mensal composta
                return calcularJurosRecursivo(valorAtual: valorInicial, aporteMensal: aporteMensal, taxaMensal: taxaMensal, mesesRestantes: totalMeses)

            case .prefixado:
                let taxaAnual = 0.08
                let taxaMensal = pow(1 + taxaAnual, 1 / 12.0) - 1 // Taxa de juros mensal composta
                return calcularJurosRecursivo(valorAtual: valorInicial, aporteMensal: aporteMensal, taxaMensal: taxaMensal, mesesRestantes: totalMeses)

            case .ipca:
                let variacaoIpcaAnual = 0.05
                let taxaJurosAnual = 0.06
                let taxaMensal = pow(1 + variacaoIpcaAnual + taxaJurosAnual, 1 / 12.0) - 1 // Taxa de juros mensal composta
                return calcularJurosRecursivo(valorAtual: valorInicial, aporteMensal: aporteMensal, taxaMensal: taxaMensal, mesesRestantes: totalMeses)

            case .fundos:
                let jurosCotaAnual = 0.1
                let taxaMensal = pow(1 + jurosCotaAnual, 1 / 12.0) - 1 // Taxa de juros mensal composta
                return calcularJurosRecursivo(valorAtual: valorInicial, aporteMensal: aporteMensal, taxaMensal: taxaMensal, mesesRestantes: totalMeses)
            }
        }

    private func calcularJurosRecursivo(valorAtual: Double, aporteMensal: Double, taxaMensal: Double, mesesRestantes: Int) -> Double {
            guard mesesRestantes > 0 else {
                return valorAtual
            }

            // Calcular o novo valor com juros compostos para o próximo mês
            let novoValor = valorAtual * (1 + taxaMensal) + aporteMensal

            // Chamada recursiva para o próximo mês
            return calcularJurosRecursivo(valorAtual: novoValor, aporteMensal: aporteMensal, taxaMensal: taxaMensal, mesesRestantes: mesesRestantes - 1)
        }
    }


