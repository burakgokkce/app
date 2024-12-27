import SwiftUI

struct RegisterView: View {
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var age: String = ""
    @State private var gender: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var isPasswordVisible: Bool = false
    @State private var isAccountCreated: Bool = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Image("hesap")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                    .opacity(0.2)
                
                VStack(spacing: 20) {
                    Image("logo")
                        .offset(y: -350)
                        .frame(width: 135, height: 53)
                    
                    Text("Hesap Oluştur")
                        .bold()
                        .font(.custom("SP Pro Display Bold", size: 22))
                   
                    
                    // First Name and Last Name
                    HStack(spacing: 10) {
                        CustomTextField(text: $firstName, placeholder: "Ad " )
                            .multilineTextAlignment(.trailing) // Sağa hizalar
                            .frame(width: 156.5, height: 50)
                            .offset(x:-7)
                    
                        CustomTextField(text: $lastName, placeholder: "Soyad")
                            .frame(width: 156.5, height: 50)
                            
                    }
                    
                    // Age and Gender
                    HStack(spacing: 10) {
                        CustomTextField(text: $age, placeholder: "Yaş")
                            .multilineTextAlignment(.trailing)
                            .keyboardType(.numberPad)
                            .frame(width: 156.5, height: 50)
                            .offset(x:-20)
                        
                        Menu {
                            Button("Erkek", action: { gender = "Erkek" })
                            Button("Kadın", action: { gender = "Kadın" })
                        } label: {
                            HStack {
                                Text(gender.isEmpty ? "Cinsiyet" : gender)
                                    .foregroundColor(gender.isEmpty ? .gray : .black)
                                   

                                Image(systemName: "chevron.down")
                                    .foregroundColor(.gray)
                            }
                            .padding()
                            .frame(height: 50)
                            .overlay(
                                Capsule().stroke(Color.gray, lineWidth: 1)
                            )
                        }
                    }
                    
                    CustomTextField(text: $email, placeholder: "E-posta")
                        .keyboardType(.emailAddress)
                        .frame(width: 330, height: 50)
                        .multilineTextAlignment(.trailing)

                    
                    // Password
                    HStack {
                        CustomTextField(text: $password, placeholder: "Şifre")
                            .frame(width: 330, height: 50)
                            .padding(.leading, 10)
                            .overlay(
                                
                                HStack {
                                    Spacer()
                                    Button(action: {
                                        isPasswordVisible.toggle()
                                    }) {
                                        Image(systemName: isPasswordVisible ? "eye.slash" : "eye")
                                            .foregroundColor(.gray)
                                    }
                                    .padding(.trailing, 25)
                                }
                            )
                            .textContentType(isPasswordVisible ? .none : .password)
                            .autocapitalization(.none)
                            .disableAutocorrection(true)
                    }
                    
                    // Password Requirements
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Şifrenizde bulunması gerekenler")
                            .font(.footnote)
                            .bold()
                        
                        VStack(alignment: .leading) {
                            
                            RequirementView(text: "En az 8 karakter")
                            RequirementView(text: "Büyük ve küçük harfler")
                            RequirementView(text: "En az 1 rakam")
                        }
                        .frame(maxWidth: .infinity, alignment: .leading )
                    }
                    .padding(.leading)
                    
                    // Create Account Button
                    NavigationLink(destination: DowloadView(), isActive: $isAccountCreated) {
                        Button(action: {
                            isAccountCreated = true
                        }) {
                            Text("Hesap Oluştur")
                                .bold()
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.purple)
                                .foregroundColor(.white)
                                .cornerRadius(25)
                                .padding(.horizontal)
                        }
                    }
                    
                    // Login and Continue as Guest Options
                    VStack(spacing: 8) {
                        HStack {
                            Text("Hesabınız var mı?")
                            Button(action: {
                                // Login action
                            }) {
                                Text("Giriş yapın")
                                    .foregroundColor(.purple)
                                    .underline()
                            }
                        }
                        
                        Button(action: {
                            // Continue as guest action
                        }) {
                            Text("Misafir olarak devam et")
                                .foregroundColor(.purple)
                                .underline()
                        }
                    }
                }
                .padding()
            }
        }
    }
}
struct CustomTextField: View {
    @Binding var text: String
    var placeholder: String
    
    var body: some View {
        ZStack {
            HStack {
                if text.isEmpty {
                    HStack(spacing: 2) {
                        Text(placeholder)
                            .foregroundColor(.gray)
                        
                        Text("*")
                            .foregroundColor(.red)
                    }
                    .padding(.leading, 10)
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
            }
            
            TextField("", text: $text)
                .padding(.leading, 10)
                .frame(height: 50)
                .background(Color.clear)
                .autocapitalization(.none)
                .disableAutocorrection(true)
        }
        .overlay(
            Capsule().stroke(Color.gray, lineWidth: 1)
        )
        .padding(.horizontal)
    }
}

// RequirementView component for password requirements
struct RequirementView: View {
    var text: String
    
    var body: some View {
        HStack {
            Circle()
                .stroke(Color.gray, lineWidth: 2)
                .frame(width: 8, height: 8)
            
            Text(text)
                .font(.footnote)
        }
    }
}

// Preview
struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
