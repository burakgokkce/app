//
//  ReminderView.swift
//  FocusFlow
//
//  Created by Burak Gökce on 20.11.2024.
//

import SwiftUI

struct ReminderView: View {
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                
                // Logo
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 50)
                    .offset(y:-20)

                
                Spacer().frame(height: 20)
                
                // "Hatırlatma" başlığı
                Text("Hatırlatma")
                    .font(.system(size: 26))
                    .foregroundColor(.black)
                    .padding(.bottom, 20)
                    .offset(y:50)

                
                // Görsel
                Image("mail 1")
                    .resizable()
                    .scaledToFit()
                    .offset(y:-50)
            
                   
                
                // Bildirimlere izin butonu
                Button(action: {
                    // Bildirim izni işlevini buraya ekleyebilirsiniz.
                }) {
                    HStack {
                        Text("Bildirimlere izin ver")
                            .font(.system(size: 16, weight: .medium))
                            .foregroundColor(.purple)
                        
                        Image(systemName: "bell.fill")
                            .foregroundColor(.purple)
                            .offset(y:-0)

                        
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.purple.opacity(0.2))
                    .cornerRadius(20)
                    .offset(y:-80)

                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.purple, lineWidth: 2)
                            .offset(y:-80)

                    )
                }
                .padding(.horizontal, 40)
                
                
                // Alt açıklama
                Text("Başlaman önce bildirimlere izin vermelisin.")
                    .font(.system(size: 14))
                    .foregroundColor(.gray)
                    .padding(.top, 10)
                    .offset(y:-70)

                
                
                Spacer()
                
                // Sayfa göstergesi
                HStack(spacing: 10) {
                    Circle()
                        .frame(width: 10, height: 10)
                        .foregroundColor(.gray)
                        .offset(y:-30)

                    Circle()
                        .frame(width: 10, height: 10)
                        .foregroundColor(.purple)
                        .offset(y:-30)

                    Circle()
                        .frame(width: 10, height: 10)
                        .foregroundColor(.gray)
                        .offset(y:-30)

                    Circle()
                        .frame(width: 10, height: 10)
                        .foregroundColor(.gray)
                        .offset(y:-30)

                }
                .padding(.bottom, 20)
                
                // Devam et butonu
                NavigationLink(destination:izinView()) {
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

// İzinView ekranı
struct IzinView: View {
    var body: some View {
        Text("Bu, İzinView ekranıdır.")
            .font(.largeTitle)
            .padding()
    }
}

#Preview {
    ReminderView()
}
