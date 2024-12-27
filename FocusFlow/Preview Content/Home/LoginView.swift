import SwiftUI

struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""

    var body: some View {
        NavigationView {
            ZStack {
                Spacer()
                Image("logo")
                    .offset(y: -370)
                    .frame(width: 135, height: 53)
                Image("Giris")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .edgesIgnoringSafeArea(.all)
                    .opacity(0.2)
                    .offset(y: -50)

                VStack {
                    Text("Giriş Yap")
                        .font(.custom("SP Pro Display-Bold", size: 22))
                        .bold()
                        .padding()

                    VStack {
                        VStack {
                            HStack {
                                Image("@")
                                    .offset(x: 40, y: -50)
                                ZStack(alignment: .trailing) {
                                    if email.isEmpty {
                                        Text("*")
                                            .foregroundColor(.red)
                                            .padding(.trailing)
                                            .offset(x: -230, y: -50)
                                    }
                                    TextField("E-posta", text: $email)
                                        .frame(width: 323, height: 50)
                                        .keyboardType(.emailAddress)
                                        .foregroundColor(.black)
                                        .padding()
                                        .offset(x: 25, y: -50)
                                }
                            }
                            .background(
                                RoundedRectangle(cornerRadius: 50)
                                    .stroke(Color.black, lineWidth: 2)
                                    .frame(width: 350, height: 50)
                                    .offset(y: -50)
                            )
                        }

                        VStack {
                            HStack {
                                Image("Lock")
                                    .offset(x: 50, y: -60)
                                Image("eyes")
                                    .offset(x: 300, y: -50)
                                ZStack(alignment: .trailing) {
                                    if password.isEmpty {
                                        Text("*")
                                            .foregroundColor(.red)
                                            .padding(.trailing)
                                            .offset(x: -245, y: -60)
                                    }
                                    SecureField("Şifreniz", text: $password)
                                        .frame(width: 323, height: 50)
                                        .foregroundColor(.black)
                                        .padding()
                                        .offset(x: 10, y: -60)
                                }
                            }
                            .background(
                                RoundedRectangle(cornerRadius: 50)
                                    .stroke(Color.black, lineWidth: 2)
                                    .frame(width: 350, height: 50)
                                    .offset(y: -60)
                            )
                        }
                    }
                    .padding(.top, 50)
                    
                    Text("Şifrenizi mi unuttunuz?")
                        .underline()
                        .offset(x: 80, y: -70)

                    NavigationLink(destination: RegisterView()) {
                        Text("Giriş Yap")
                            .bold()
                            .frame(width: 350, height: 50)
                            .foregroundColor(.white)
                            .background(Color.purple)
                            .cornerRadius(25)
                            .offset(y: -54)
                    }

                    HStack {
                        Text("Hesabınız yok mu?")
                            .offset(x: -2, y: 130)
                        NavigationLink(destination: RegisterView()) {
                            Text("Kaydolun")
                                .underline()
                                .foregroundColor(.purple)
                                .offset(x: -1, y: 130)
                        }
                    }

                    NavigationLink(destination: ReminderView()) {
                        Text("Misafir olarak devam et")
                            .offset(y: 150)
                            .underline()
                            .foregroundColor(.purple)
                    }
                }
            }
        }
    }
}

struct Reminder: View {
    var body: some View {
        Text("Ana Sayfa")
            .font(.largeTitle)
            .padding()
    }
}


#Preview {
    LoginView()
}
