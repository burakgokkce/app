//
//  izinView.swift
//  FocusFlow
//
//  Created by Burak Gökce on 20.11.2024.
//

//
//  NotificationView.swift
//  FocusFlow
//
//  Created by Burak Gökce on 20.11.2024.
//

import SwiftUI

struct izinView: View {
    @State private var selectedOption: String? = nil
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                
                // Logo
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 135, height: 53)
                    .padding(.top, 20)
                    .offset(y:-20)
                
                Spacer().frame(height: 20)
                
                // Görsel
                Image("smartphone 1")
                    .resizable()
                    .scaledToFit()
                    .padding(.bottom, 20)
                    .offset(y:-50)
                    .offset(y:-20)
                
                // "İzin ver" ve "İzin verme" butonları
                HStack(spacing: 20) {
                    Button(action: {
                        selectedOption = "İzin verildi"
                    }) {
                        Text("İzin ver")
                            .font(.system(size: 16, weight: .medium))
                            .foregroundColor(.purple)
                            .frame(width: 120, height: 50)
                            .background(Color.purple.opacity(0.1))
                            .cornerRadius(10)
                            .offset(y:-120)
                            .overlay(
                                
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.purple, lineWidth: 2)
                                    .offset(y:-120)

                            )
                    }
                    
                    Button(action: {
                        selectedOption = "İzin verilmedi"
                    }) {
                        Text("İzin verme")
                            .font(.system(size: 16, weight: .medium))
                            .foregroundColor(.purple)
                            .frame(width: 120, height: 50)
                            .background(Color.purple.opacity(0.1))
                            .cornerRadius(10)
                            .offset(y:-120)

                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.purple, lineWidth: 2)
                                    .offset(y:-120)

                            )
                    }
                }
                .padding(.bottom, 20)
                
                // Alt açıklama
                Text("Lütfen bir seçenek belirleyin, bildirim tercihinizi yapmadan devam edemezsiniz!")
                    .font(.system(size: 14))
                    .foregroundColor(.purple)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 40)
                    .offset(y:-60)
                
                Spacer()
                
                // Sayfa göstergesi
                HStack(spacing: 10) {
                    Circle()
                        .frame(width: 10, height: 10)
                        .foregroundColor(.gray)
                    Circle()
                        .frame(width: 10, height: 10)
                        .foregroundColor(.purple)
                    Circle()
                        .frame(width: 10, height: 10)
                        .foregroundColor(.gray)
                    Circle()
                        .frame(width: 10, height: 10)
                        .foregroundColor(.gray)
                }
                .padding(.bottom, 20)
                
                // "Devam et" butonu
                NavigationLink(
                    destination: interfaceView(),
                    isActive: .constant(selectedOption != nil) // Eğer seçenek seçildiyse geçiş yapılır
                ) {
                    Text("Devam et")
                        .font(.system(size: 18, weight: .bold))
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.purple)
                        .cornerRadius(30)
                        .shadow(color: .gray, radius: 5, x: 0, y: 3)
                }
                .padding(.horizontal, 40)
                
                Spacer().frame(height: 10)
            }
            .navigationBarHidden(true)
        }
    }
}

// InterfaceView ekranı
struct interface: View {
    var body: some View {
        Text("Bu, InterfaceView ekranıdır.")
            .font(.largeTitle)
            .padding()
    }
}

#Preview {
    izinView()
}
