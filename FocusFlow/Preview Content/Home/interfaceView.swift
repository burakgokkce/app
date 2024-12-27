import SwiftUI

struct interfaceView: View {
    var body: some View {
        NavigationView{
            VStack(spacing: 20) {
                // Logo
                Image("logo")
                    .frame(width: 135, height: 53)
                    .offset(y:-40)
                
                // Başlık ve Alt Başlık
                Text("Faydalı Grafikler ve Durum Sayfası")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 40)
                    .offset(y:-10)
                
                // Görsel
                Image("aa") // Görsel dosyasını proje assets'e eklemelisin
                    .resizable()
                    .scaledToFit()
                    .frame( width: 300 ,height: 200)
                    .offset(y:70)
                
                Text("Alışkanlık ilerlemenizi görselleştirin")
                    .font(.subheadline)
                    .foregroundColor(.black)
                    .offset(y:100)
                
                Spacer()
                
                // Sayfa Gösterimi (Dots)
                HStack(spacing: 8) {
                    Circle()
                        .fill(Color.gray)
                        .frame(width: 8, height: 8)
                        .offset(y:-30)
                    Circle()
                        .fill(Color.gray)
                        .frame(width: 8, height: 8)
                        .offset(y:-30)
                    Circle()
                        .fill(Color.gray)
                        .frame(width: 8, height: 8)
                        .offset(y:-30)
                    Circle()
                        .fill(Color.purple)
                        .frame(width: 8, height: 8)
                        .offset(y:-30)
                    
                }
                
                // Devam Et Butonu
                Button(action: {
                    print("Devam et tıklandı")
                }) {
                    NavigationLink(destination: LoginView()) {
                        Text("Devam et")
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.purple)
                            .cornerRadius(30)
                            .padding(.horizontal, 40)
                    }
                }
                .padding(.vertical, 40)
            }
        }
    }
    
    struct Login: View {
        var body: some View {
            Text("Bu, InterfaceView ekranıdır.")
                .font(.largeTitle)
                .padding()
        }
    }
}
#Preview {
    izinView()
}
