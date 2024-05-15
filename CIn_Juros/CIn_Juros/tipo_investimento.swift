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
    case posfixado = "Tesouro Pós-Fixado"
    case fundos = "Fundos Imobiliários"
    case cdb = "C D B"
    case lci = "LCI/LCA"
    
}
