//
//  DowloadView.swift
//  FocusFlow
//
//  Created by Burak Gökce on 23.11.2024.
//

import SwiftUI

struct DowloadView: View {
    var body: some View {
        ZStack{
            Image("logo")
                .offset(y:-350)
                .scaledToFit()
                .edgesIgnoringSafeArea(.all)
            
            Image("hesap")
                .resizable()
                .scaledToFit()
                .edgesIgnoringSafeArea(.all)
                .opacity(0.2)
            Text("Hesabınız Başarıyla Oluşturulmuştur")
                .font(.custom("SP Pro Display Bold", size: 22))
                .bold()
            
            Image("Tik")
                .resizable()
                .scaledToFit()
                .edgesIgnoringSafeArea(.all)
                .frame(width: 30, height: 30)
                .offset(y: 50)
            
        }
    }
}
#Preview {
    DowloadView()
}
