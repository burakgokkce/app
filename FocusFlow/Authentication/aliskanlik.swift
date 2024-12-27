import SwiftUI

struct HabitsView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    // Özel Alışkanlık Ekle Butonu
                    HStack {
                        Spacer()
                        Button(action: {
                            // Özel Alışkanlık Ekleme İşlemi
                        }) {
                            Text("Özel Alışkanlık Ekle")
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding()
                                .background(Color.purple)
                                .cornerRadius(20)
                                .padding(.horizontal)
                                .opacity(0.7)
                        }
                    }
                    
                    // Spor Kategorisi
                    CategorySection(
                        title: "Spor",
                        habits: [
                            Habit(imageName: "yürümek", name: "Yürümek"),
                            Habit(imageName: "kosmak", name: "Koşmak"),
                            Habit(imageName: "bisiklet", name: "Bisiklet Sürmek"),
                            Habit(imageName: "yuzme", name: "Yüzmek"),
                            Habit(imageName: "antrenman", name: "Antrenman Yapmak"),
                            Habit(imageName: "yoga", name: "Yoga"),
                            Habit(imageName: "zihni", name: "Zihin")
                        ]
                        
                    )
                    
                    // Düşünce Kategorisi
                    CategorySection(
                        title: "Düşünce",
                        habits: [
                            Habit(imageName: "meditasyon", name: "Meditasyon"),
                            Habit(imageName: "nefes", name: "Nefes Egzersizi"),
                            Habit(imageName: "kitap", name: "Kitap Okumak"),
                            Habit(imageName: "ogrenme", name: "Öğrenmek")
                        ]
                    )
                }
                .padding(.top)
            }
            .navigationTitle("Yeni Alışkanlıklar")
        }
    }
}

// Struct ile Alışkanlık Tanımlama
struct Habit {
    let imageName: String
    let name: String
}

struct CategorySection: View {
    var title: String
    var habits: [Habit]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .font(.title2)
                .bold()
                .padding(.horizontal)
            
            ForEach(habits, id: \.name) { habit in
                NavigationLink(destination: HabitDetailView(habit: habit)) {
                    HabitRow(habit: habit)
                        .padding(.horizontal)
                }
            }
        }
        .padding(.bottom)
    }
}

struct HabitRow: View {
    var habit: Habit
    
    var body: some View {
        HStack {
            Image(habit.imageName) // Resim dosyasını kullanır
                .resizable()
                .frame(width: 40, height: 40)
                .cornerRadius(8)
            
            Text(habit.name)
                .font(.system(size: 18))
            Spacer()
            Image(systemName: "chevron.right")
                .foregroundColor(.gray)
        }
        .padding(.vertical, 5)
    }
}

// Detay Ekranı
struct HabitDetailView: View {
    var habit: Habit
    
    @State private var description: String = ""
    @State private var selectedColor: Color = .purple
    @State private var target: Int = 1
    @State private var timeRange: [String: Bool] = [
        "Her Zaman": false,
        "Sabah": false,
        "Öğleden Sonra": false,
        "Akşam": false
    ]
    
    var body: some View {
        ZStack {
            Image("hesap") // Arka plan resmi
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
                .opacity(0.3) // Arka plan opaklık ayarı
            
            ScrollView {
                VStack(spacing: 16) {
                    // Kategori Adı ve İkon
                    HStack {
                        Image(habit.imageName)
                            .resizable()
                            .frame(width: 40, height: 40)
                        Text(habit.name)
                            .font(.largeTitle)
                            .bold()
                        Spacer()
                    }
                    .padding()
                    
                    // Kategori Adı
                    TextField("Kategori Adı", text: .constant(habit.name))
                        .font(.headline)
                        .padding()
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(8)
                        .padding(.horizontal)
                        .disabled(true) // Düzenlenemez
                    
                    // Açıklama
                    TextField("Açıklama", text: $description)
                        .padding()
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(8)
                        .padding(.horizontal)
                    
                    // İkon ve Renk
                    HStack {
                        Text("İkon:")
                        Image(habit.imageName)
                            .resizable()
                            .frame(width: 40, height: 40)
                            .cornerRadius(8)
                        
                        Spacer()
                        
                        Text("Renk:")
                        HStack {
                            Circle()
                                .fill(Color.purple)
                                .frame(width: 30, height: 30)
                                .onTapGesture {
                                    selectedColor = .purple
                                }
                            Circle()
                                .fill(Color.red)
                                .frame(width: 30, height: 30)
                                .onTapGesture {
                                    selectedColor = .red
                                }
                            Circle()
                                .fill(Color.green)
                                .frame(width: 30, height: 30)
                                .onTapGesture {
                                    selectedColor = .green
                                }
                            Circle()
                                .fill(Color.blue)
                                .frame(width: 30, height: 30)
                                .onTapGesture {
                                    selectedColor = .blue
                                }
                        }
                    }
                    .padding(.horizontal)
                    
                    // Hedef
                    HStack {
                        Text("Hedef:")
                        Stepper(value: $target, in: 1...100) {
                            Text("\(target)")
                        }
                        Spacer()
                    }
                    .padding(.horizontal)
                    
                    // Zaman Aralığı
                    Text("Zaman Aralığı:")
                        .font(.headline)
                        .padding(.horizontal)
                    HStack {
                        ForEach(timeRange.keys.sorted(), id: \.self) { key in
                            Toggle(key, isOn: Binding(
                                get: { self.timeRange[key] ?? false },
                                set: { self.timeRange[key] = $0 }
                            ))
                        }
                    }
                    .padding(.horizontal)
                }
                .padding(.top)
            }
        }
        .navigationTitle(habit.name)
    }
}

struct HabitsView_Previews: PreviewProvider {
    static var previews: some View {
        HabitsView()
    }
}
