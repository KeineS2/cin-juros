//
//  ContentView.swift
//  CIn_Juros
//
//  Created by Keine Vitor de Santana on 15/05/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var tipoInvestimento: Bool?
    @State var aporteMensal: Int?
    @State var valorInicial: Int?
    
    @State var investimentoSelecionado1 = Data.jan
    @State var investimentoSelecionado2 = Data.fev
    @State var anoSelecionado1: Int = 2024
    @State var anoSelecionado2: Int = 2024
    @State var tipoDeInvestimento = investimento.selic
    
    var body: some View {
        NavigationStack {
           
                VStack(alignment: .leading, spacing: 24) {
                
                    Spacer()
                    
                    Text("Selecione o tipo de investimento:")
                    Picker("tipoInvestimento", selection: $tipoDeInvestimento){
                        ForEach(investimento.allCases, id:\.self) { data in
                            Text(data.rawValue.capitalized)}
                    }
                    
                    Spacer()
                    
                    Text("Quanto será o aporte mensal?")
                    TextField("Digite o valor inicial",
                              value: $aporteMensal,
                              format: .number)
                    
                    Spacer()
                    
                    Text("Qual o valor inicial?")
                    TextField("Digite o valor inicial",
                              value: $aporteMensal,
                              format: .number)
                    Spacer()
                    
                    Text("Por quanto tempo deseja investir?")
                    
                    
                    VStack (alignment: .leading, spacing: 36) {
                        HStack{
                            Text("Data Inicial:")
                            Picker("Meses", selection: $investimentoSelecionado1){
                                ForEach(Data.allCases, id:\.self) { data in
                                    Text(data.rawValue.capitalized)}
                            }
                            Picker("Anos", selection: $anoSelecionado1){
                                ForEach(2024...2065, id: \.self) { data in
                                    Text("\(String(data))")
                                }
                            }
                        }
                        
                        HStack{
                            Text("Data Final:")
                            Picker("Meses", selection: $investimentoSelecionado2){
                                ForEach(Data.allCases, id:\.self) { data in
                                    Text(data.rawValue.capitalized)}
                            }
                            Picker("Anos", selection: $anoSelecionado2){
                                ForEach(2024...2065, id: \.self) { data in
                                    Text("\(String(data))")}
                            }
                            
                        }
                    }
                    Spacer()
                    
                    HStack{
                        Button("Apagar", action: {
                            print("Botão foi clicado")
                        })
                        .frame(height: 40)
                        .frame(maxWidth: .infinity)
                        .frame(alignment: .bottom)
                        .background(.white)
                        .clipShape(.rect(cornerRadius: 10))
                        .foregroundStyle(.red)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.red, lineWidth: 1))
                        
                        
                        Button("Calcular", action: {
                            print("Botão foi clicado")
                        })
                        .frame(height: 41)
                        .frame(maxWidth: .infinity)
                        .frame(alignment: .bottom)
                        .background(.indigo)
                        .clipShape(.rect(cornerRadius: 10))
                        .foregroundStyle(.white)
                        //                .font(.body1)
                    }
                
                }
                
                .padding(5)
            
            
            .textFieldStyle(.roundedBorder)
            .keyboardType(.numberPad)
            .padding()
            .containerRelativeFrame(.vertical)
            //  .animation(.easeInOut.speed(0.5), value: result)
            
            .navigationBarTitle("CIn Juros")
            .scrollDismissesKeyboard(.immediately)
            .toolbarBackground(.roxinho, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbarColorScheme(.dark, for: .navigationBar)
        }
        
        .fontDesign(.rounded)
    }
    
}

#Preview {
    ContentView()
}
