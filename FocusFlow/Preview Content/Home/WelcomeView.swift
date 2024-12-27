//
//  WelcomeView.swift
//  FocusFlow
//
//  Created by Burak Gökce on 19.11.2024.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                
                // Logo
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 50) // Logo boyutları
                    .offset(y: -120)
                
                Spacer().frame(height: 20)
                
                // "Hoş Geldiniz" yazısı
                Text("Hoş Geldiniz")
                    .font(.system(size: 26, weight: .bold))
                    .foregroundColor(.black)
                    .offset(y: -70)
                
                Spacer().frame(height: 10)
                
                // Alttaki görseller ve daireler
                ZStack {
                    Image("Grup 13")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 306, height: 290)
                }
                
                Spacer().frame(height: 20)
                
                // "Alışkanlıkların Gücüyle Hedeflerine Ulaş" yazısı
                Text("Alışkanlıkların Gücüyle Hedeflerine Ulaş!")
                    .font(.system(size: 16))
                    .foregroundColor(.gray)
                    .offset(y: 20)
                
                Spacer().frame(height: 20)
                
                // Sayfa göstergesi
                HStack(spacing: 10) {
                    Circle()
                        .frame(width: 10, height: 10)
                        .foregroundColor(.purple)
                        .offset(y: 60)
                    Circle()
                        .frame(width: 10, height: 10)
                        .foregroundColor(.gray)
                        .offset(y: 60)
                    Circle()
                        .frame(width: 10, height: 10)
                        .foregroundColor(.gray)
                        .offset(y: 60)
                    Circle()
                        .frame(width: 10, height: 10)
                        .foregroundColor(.gray)
                        .offset(y: 60)
                }
                
                Spacer().frame(height: 20)
                
                // "Başla" butonu
                NavigationLink(destination: ReminderView()) { // ReminderView'e yönlendirme yapıldı.
                    Text("Başla")
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.purple)
                        .cornerRadius(30)
                        .shadow(color: .gray, radius: 5, x: 0, y: 3)
                        .offset(y: 80)
                }
                .padding(.horizontal, 40)
                
                Spacer()
            }
        }
    }
}



#Preview {
    WelcomeView()
}
