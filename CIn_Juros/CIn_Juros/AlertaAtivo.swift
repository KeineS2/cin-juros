//
//  AlertaAtivo.swift
//  CIn_Juros
//
//  Created by Keine Vitor de Santana on 21/05/24.
//

import Foundation

enum AlertaAtivo: Identifiable {
    case tipoInvestimento
    case valorInicial
    case aporteMensal
    case mostrarResultado
    
    var id: Int {
        hashValue
    }
}
