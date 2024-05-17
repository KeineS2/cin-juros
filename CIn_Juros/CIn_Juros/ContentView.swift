//
//  ContentView.swift
//  CIn_Juros
//
//  Created by Keine Vitor de Santana on 15/05/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var tipoInvestimento: Bool?
    @State var aporteMensal: Double?
    @State var valorInicial: Double?
    @State var totalAnos: Double?
    @State var tempoAnos: Double?
    @State var totalMeses: Double?
    
    @State var investimentoSelecionado1 = Data.mai
    @State var investimentoSelecionado2 = Data.jun
    @State var anoSelecionado1: Int = 2024
    @State var anoSelecionado2: Int = 2024
    @State var failedInput = false
    @State var tipoDeInvestimento = investimento.selic
    
    let tituloPreencherCampos = "Preencha os campos para calcular!"
    let campoMaiorQueZero = "Pelo menos um dos campos tem que ser maior que zero."
    
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
                    
                    Text("Qual o valor inicial?")
                    TextField("Digite o valor inicial",
                              value: $valorInicial,
                              format: .number)
                    
                    Spacer()
                    
                    Text("Qual o valor do aposte mensal?")
                    TextField("Digite o valor do aporte mensal",
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
                            processaCalculo()
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
            
            .alert(tituloPreencherCampos, isPresented: $failedInput, actions: {
                Button("Ok", role: .cancel, action: {})
            })
            .alert(campoMaiorQueZero, isPresented: $failedInput, actions: {
                Button("Ok", role: .cancel, action: {})
            })
            
            .navigationBarTitle("CIn Juros")
            .scrollDismissesKeyboard(.immediately)
            .toolbarBackground(.roxinho, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbarColorScheme(.dark, for: .navigationBar)
        }
        
        .fontDesign(.rounded)
    }
    
}


//MARK: - Function
extension ContentView {
    func processaCalculo() {
        guard let valorInicial = valorInicial, let aporteMensal = aporteMensal else {
            print("Campo não preenchido")
            failedInput = true
            return
        }
        
        guard valorInicial > 0 || aporteMensal > 0 else {
            print("Pelo menos um campo tem que ser maior que zero")
            failedInput = true
            return
        }
        
        // Calcula o número total de anos entre as datas selecionadas
        let totalAnos = anoSelecionado2 - anoSelecionado1
        
        // Realiza o cálculo dos juros com base nos valores fornecidos e nos anos selecionados
        let resultado = tipoDeInvestimento.calcularJuros(deValorInicial: valorInicial, eAporteMensal: aporteMensal, eTotalAnos: Double(totalAnos), eTotalMeses: Double(totalAnos))
//        calcularJuros(valorInicial: valorInicial, aporteMensal: aporteMensal, totalAnos: totalAnos)
        
        print("Resultado do investimento: \(resultado)")
    }
    
    // Função para calcular os juros com base nos valores fornecidos
    func calcularJuros(valorInicial: Int, aporteMensal: Int, totalAnos: Int, totalMeses: Double) -> Double {
        
        return 1  }
}

#Preview {
    ContentView()
}
