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
    @State var totalAnos: Int = 0
    @State var tempoAnos: Double?
    @State var totalMeses: Double = 0
    
    @State var investimentoSelecionado1 = Data.maio
    @State var investimentoSelecionado2 = Data.junho
    @State var anoSelecionado1: Int = 2024
    @State var anoSelecionado2: Int = 2024
    @State var failedInput = false
    @State var tipoDeInvestimento = Investimento.selic
    @State var mostrarResultado = false
    @State var resultado = 0.0
    @State var anosResultado: Int?
    @State var mesesResultado: Int?
    
    
    @State private var showingAlert = false
    @State private var alertaAtivo: AlertaAtivo?
    
    
    let tituloPreencherCampos = "Preencha os campos para calcular!"
    let campoMaiorQueZero = "Pelo menos um dos campos tem que ser maior que zero."
    
    var body: some View {
        NavigationStack {
            
            VStack(alignment: .leading, spacing: 24) {
                
                Spacer()
                
                HStack{
                    Text("Selecione o tipo de investimento:")
                    Button(action: {
                        // Ação que você deseja realizar quando o botão for pressionado
                        alertaAtivo = .tipoInvestimento
                    }) {
                        Image("help")
                            .resizable()
                            .frame(width: 20, height: 20) // Ajuste o tamanho da imagem conforme necessário
                    }
                }
                Picker("tipoInvestimento", selection: $tipoDeInvestimento){
                    ForEach(Investimento.allCases, id:\.self) { data in
                        Text(data.rawValue.capitalized)}
                }
                
                Spacer()
                
                HStack {
                    Text("Qual o valor inicial?")
                    
                    Button(action: {
                        // Ação que você deseja realizar quando o botão for pressionado
                        alertaAtivo = .valorInicial
                    }) {
                        Image("help")
                            .resizable()
                            .frame(width: 20, height: 20) // Ajuste o tamanho da imagem conforme necessário
                    }
                }
                TextField("Digite o valor inicial",
                          value: $valorInicial,
                          format: .number)
                
                Spacer()
                HStack{
                    Text("Qual o valor do aposte mensal?")
                    Button(action: {
                        // Ação que você deseja realizar quando o botão for pressionado
                        alertaAtivo = .aporteMensal
                    }) {
                        Image("help")
                            .resizable()
                            .frame(width: 20, height: 20) // Ajuste o tamanho da imagem conforme necessário
                    }
                }
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
                        apagarCampos()
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
                    
                    
                    Button("Calcular", action:  {
                        processaCalculo()
                        alertaAtivo = .mostrarResultado
                    })
                    
                    .frame(height: 41)
                    .frame(maxWidth: .infinity)
                    .frame(alignment: .bottom)
                    .background(.indigo)
                    .clipShape(.rect(cornerRadius: 10))
                    .foregroundStyle(.white)
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
            
            
            //            .alert(isPresented: $showingAlert) {
            //                Alert(title: Text("Resultado"), message: Text("O resultado do seu investimento é de \(resultado, specifier: "%.2f")"), dismissButton: .default(Text("OK")))
            //            }
            
            .navigationBarTitle("CIn Juros")
            .scrollDismissesKeyboard(.immediately)
            .toolbarBackground(.roxinho, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbarColorScheme(.dark, for: .navigationBar)
            
            
            .alert(item: $alertaAtivo) { alertaAtivo in
                switch alertaAtivo {
                case .tipoInvestimento:
                    return Alert(
                        title: Text("Tipo de Investimento"),
                        message: Text("Aqui você deve selecionar o tipo de investimento que você deseja investir"),
                        dismissButton: .default(Text("OK"))
                    )
                case .valorInicial:
                    return Alert(
                        title: Text("Valor Inicial"),
                        message: Text("Aqui você deve digitar o valor inicial que você deseja investir."),
                        dismissButton: .default(Text("OK"))
                    )
                case .aporteMensal:
                    return Alert(
                        title: Text("Aporte Mensal"),
                        message: Text("Aqui você deve digitar o valor do aporte mensal, ou seja, o valor que você deseja investir mensalmente."),
                        dismissButton: .default(Text("OK"))
                    )
                case .mostrarResultado:
                    return Alert(
                        title: Text("Resultado do Investimento"),
                        message:
                            Text("""
                                                                                  Investimento Selecionado: \(tipoDeInvestimento.rawValue)
                                                                                  Valor Inicial: \(String(format: "%.2f", valorInicial ?? 0))
                                                                                  Aporte Mensal: \(String(format: "%.2f", aporteMensal ?? 0))
                                                                                  Tempo: \(anosResultado ?? 0) anos e \(mesesResultado ?? 0) meses
                                                                                  Resultado: \(String(format: "%.2f", resultado))
                                                                                  """),
                        dismissButton: .default(Text("OK"))
                    )
                }
            }
        }
        
        .fontDesign(.rounded)
    }
    
}


//MARK: - Function
extension ContentView {
    
    func apagarCampos() {
        valorInicial = nil
        aporteMensal = nil
        anoSelecionado1 = 2024
        anoSelecionado2 = 2024
        investimentoSelecionado1 = .maio
        investimentoSelecionado2 = .junho
    }
    
    
    func calcularJuros(valorInicial: Double, taxaDeJuros: Double, totalAnos: Int) -> Double {
        let juros = valorInicial * pow(1 + taxaDeJuros, Double(totalAnos))
        return juros
    }
    
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
        
        //        totalAnos = anoSelecionado2 - anoSelecionado1
        //
        //        if investimentoSelecionado2.monthNumber < investimentoSelecionado1.monthNumber {
        //            totalMeses = Double(12 - investimentoSelecionado1.monthNumber + investimentoSelecionado2.monthNumber)
        //            totalAnos = anoSelecionado2 - anoSelecionado1 - 1 // Subtrai 1 ano se o mês final for anterior ao mês inicial
        //        } else {
        //            totalMeses = Double(investimentoSelecionado2.monthNumber - investimentoSelecionado1.monthNumber)
        //            totalAnos = anoSelecionado2 - anoSelecionado1 // Calcula os anos normalmente
        //        }
        
        
        let calculo1 = anoSelecionado1 * 12 + investimentoSelecionado1.monthNumber
        let calculo2 = anoSelecionado2 * 12 + investimentoSelecionado2.monthNumber
        
        // Cálculo da diferença total de meses
        let totalMeses = calculo2 % calculo1
        
        // Convertendo meses para anos e meses
        anosResultado = totalMeses / 12
        mesesResultado = totalMeses % 12
        
        
        // Cálculo do resultado
        resultado = tipoDeInvestimento.calcularJuros(deValorInicial: valorInicial, eAporteMensal: aporteMensal, eTotalAnos: Double(anosResultado!), eTotalMeses: Double(mesesResultado!))
        
        
        mostrarResultado = true

        
        print("Resultado do investimento: \(resultado)")
    }
}
#Preview {
    ContentView()
}
