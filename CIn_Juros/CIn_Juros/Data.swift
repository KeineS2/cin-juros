//
//  Data.swift
//  CIn_Juros
//
//  Created by Keine Vitor de Santana on 15/05/24.
//

import Foundation

enum Data: String, CaseIterable {
    case janeiro = "Janeiro"
    case fevereiro = "Fevereiro"
    case marco = "Março"
    case abril = "Abril"
    case maio = "Maio"
    case junho = "Junho"
    case julho = "Julho"
    case agosto = "Agosto"
    case setembro = "Setembro"
    case outubro = "Outubro"
    case novembro = "Novembro"
    case dezembro = "Dezembro"

    var monthNumber: Int {
        switch self {
        case .janeiro: return 1
        case .fevereiro: return 2
        case .marco: return 3
        case .abril: return 4
        case .maio: return 5
        case .junho: return 6
        case .julho: return 7
        case .agosto: return 8
        case .setembro: return 9
        case .outubro: return 10
        case .novembro: return 11
        case .dezembro: return 12
        }
    }
}
