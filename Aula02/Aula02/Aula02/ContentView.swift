//
//  ContentView.swift
//  Aula02
//
//  Created by Turma02 on 03/07/25.
//

import SwiftUI

struct ContentView: View {
    @State private var distancia = 0.0
    @State private var tempo = 0.0
    @State private var velocidade = 0.0
    @State private var cor: Color = .gray
    @State private var foto = "interrogacao"
    
    
    var body: some View {
        ZStack {
            
            cor.ignoresSafeArea();

            //Inputs
            VStack {
                Text("Digite a distância (km):")
                TextField("Digite a distância:", value: $distancia, formatter: NumberFormatter())
                    .foregroundColor(.white)
                    .background(RoundedRectangle(cornerRadius: 10))
                    .multilineTextAlignment(.center)
                    .frame(width: 200, height: 20)
                    
                
                Text("Digite o tempo (h):")
                TextField("Digite o tempo:", value: $tempo, formatter: NumberFormatter())
                    .foregroundColor(.white)
                    .background(RoundedRectangle(cornerRadius: 10))
                    .multilineTextAlignment(.center)
                    .frame(width: 200, height: 20)
                
                //Calcular
                Button("Calcular") {
                    velocidade = distancia/tempo
                    if velocidade > 0 && velocidade < 10 {
                        foto = "tartaruga"
                        cor = .verde
                    }
                    else if velocidade >= 10 && velocidade < 30 {
                        foto = "elefante"
                        cor = .azul
                    }
                    
                    else if velocidade >= 30 && velocidade < 70 {
                        foto = "avestruz"
                        cor = .laranja
                    }
                    
                    else if velocidade >= 70 && velocidade < 90 {
                        foto = "leao"
                        cor = .vermelho
                    }
                    else {
                        foto = "leao"
                        cor = .amarelo
                    }
                }
                .foregroundColor(.yellow)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.black)
                        .frame(width: 120, height: 30)
                )
                .padding()
                
                Text("\(velocidade, specifier: "%.2f") km/h")
                    .font(.largeTitle)
                
    
                    
                Image("\(foto)")
                    .resizable()
                    .clipShape(RoundedRectangle(cornerRadius: 400))
                    .frame(width: 300, height: 300)
                                
                //Quadro com informações
                ZStack {
                    Rectangle()
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.black)
                        )
                        .frame(height: 180)
                        .padding()
                    
                    VStack {
                        HStack {
                            Text ("TARTARUGA                          (0 - 9.9km/h)")
                                .foregroundColor(.white)
                            Spacer()
                            Circle().fill(Color.green).frame(width: 20, height: 20)
                            
                        }
                        HStack {
                            Text ("ELEFANTE                          (10 - 29.9km/h)")
                                .foregroundColor(.white)
                            Spacer()
                            Circle().fill(Color.blue).frame(width: 20, height: 20)
                        }
                    
                        HStack {
                            Text ("AVESTRUZ                        (30 - 69.9km/h)")
                                .foregroundColor(.white)
                            Spacer()
                            Circle().fill(Color.brown).frame(width: 20, height: 20)
                            
                        }
                        HStack {
                            Text ("LEÃO                                  (70 - 89.9km/h)")
                                .foregroundColor(.white)
                            Spacer()
                            Circle().fill(Color.yellow).frame(width: 20, height: 20)
                            
                        }
                        HStack {
                            Text ("GUEPARDO                         (90 - 130km/h)")
                                .foregroundColor(.white)
                            Spacer()
                            Circle().fill(Color.red).frame(width: 20, height: 20)
            
                            
                        }
                    }
                    .padding(30)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
