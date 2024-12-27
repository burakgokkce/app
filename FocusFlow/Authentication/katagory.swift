import SwiftUI

struct CategoryView: View {
    @State private var categoryName: String = "Yürümek"
    @State private var description: String = ""
    @State private var selectedColor: Color = .purple
    @State private var target: String = "1"
    @State private var period: String = "Hedef Periyodu"
    @State private var reminderHour: String = ""
    @State private var reminderMinute: String = ""
    
    let colors: [Color] = [.purple, .blue, .pink, .green, .teal]
    
    var body: some View {
        ZStack {
            // Arka Plan
            Image("hesap")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
                .opacity(0.2)
            
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    
                    // Geri Butonu ve Başlık
                    HStack {
                        Button(action: {}) {
                            Image("yürümek")
                                .font(.system(size: 18))
                                .foregroundColor(.black)
                        }
                        Text("Spor")
                            .font(.system(size: 22, weight: .bold))
                        Spacer()
                    }
                    
                    // Kategori Adı
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Kategori Adı")
                            .font(.system(size: 14))
                            .foregroundColor(.gray)
                        TextField("", text: $categoryName)
                            .padding()
                            .background(Color(.systemGray6))
                            .cornerRadius(10)
                            .font(.system(size: 16))
                    }
                    
                    // Açıklama
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Açıklama")
                            .font(.system(size: 14))
                            .foregroundColor(.gray)
                        TextField("", text: $description)
                            .padding()
                            .frame(height: 80)
                            .background(Color.purple.opacity(0.1))
                            .cornerRadius(10)
                            .font(.system(size: 16))
                    }
                    
                    // Icon ve Renk Seçimi
                    HStack(spacing: 16) {
                        VStack {
                            Text("İkon")
                                .font(.system(size: 14))
                                .foregroundColor(.gray)
                            Image("yürümek")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 50, height: 50)
                                .padding()
                                .background(Color(.systemGray6))
                                .cornerRadius(10)
                        }
                        
                        Spacer()
                        
                        VStack(alignment: .leading) {
                            Text("Renk")
                                .font(.system(size: 14))
                                .foregroundColor(.gray)
                            HStack(spacing: 10) {
                                ForEach(colors, id: \.self) { color in
                                    Circle()
                                        .fill(color)
                                        .frame(width: 30, height: 30)
                                        .overlay(
                                            Circle()
                                                .stroke(selectedColor == color ? Color.black : Color.clear, lineWidth: 2)
                                        )
                                        .onTapGesture {
                                            selectedColor = color
                                        }
                                }
                            }
                        }
                    }
                    
                    // Hedef ve Periyot
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Hedef")
                                .font(.system(size: 14))
                                .foregroundColor(.gray)
                            TextField("1", text: $target)
                                .keyboardType(.numberPad)
                                .padding()
                                .background(Color(.systemGray6))
                                .cornerRadius(10)
                                .frame(width: 80)
                                .font(.system(size: 16))
                        }
                        
                        Spacer()
                        
                        VStack(alignment: .leading) {
                            Text("")
                                .font(.system(size: 14))
                            Picker(selection: $period, label: Text(period).font(.system(size: 16))) {
                                Text("Gün").tag("Gün")
                                Text("Hafta").tag("Hafta")
                                Text("Ay").tag("Ay")
                            }
                            .padding()
                            .background(Color(.systemGray6))
                            .cornerRadius(10)
                            .frame(width: 160)
                            .font(.system(size: 16))
                        }
                    }
                    
                    // Sıklık
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Sıklık")
                            .font(.system(size: 14))
                            .foregroundColor(.gray)
                        HStack {
                            Toggle("Gün", isOn: .constant(false))
                            Toggle("Hafta", isOn: .constant(false))
                            Toggle("Ay", isOn: .constant(false))
                        }
                        .font(.system(size: 14))
                    }
                    
                    // Zaman Aralığı
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Zaman Aralığı")
                            .font(.system(size: 14))
                            .foregroundColor(.gray)
                        HStack {
                            Toggle("Her Zaman", isOn: .constant(false))
                            Toggle("Öğleden Sonra", isOn: .constant(false))
                        }
                        HStack {
                            Toggle("Sabah", isOn: .constant(false))
                            Toggle("Akşam", isOn: .constant(false))
                        }
                    }
                    
                    // Hatırlatıcılar
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Hatırlatıcılar")
                            .font(.system(size: 14))
                            .foregroundColor(.gray)
                        HStack(spacing: 16) {
                            TextField("Saat", text: $reminderHour)
                                .keyboardType(.numberPad)
                                .padding()
                                .background(Color(.systemGray6))
                                .cornerRadius(10)
                                .frame(width: 80)
                                .font(.system(size: 16))
                            
                            TextField("Dakika", text: $reminderMinute)
                                .keyboardType(.numberPad)
                                .padding()
                                .background(Color(.systemGray6))
                                .cornerRadius(10)
                                .frame(width: 80)
                                .font(.system(size: 16))
                        }
                    }
                }
                .padding()
            }
        }
    }
}

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryView()
    }
}
