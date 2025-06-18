import SwiftUI

struct OnboardingView: View {
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var email = ""
    @AppStorage("isLoggedIn") private var isLoggedIn = false

    var body: some View {
        VStack {
            Image("LittleLemonLogo")
                .resizable()
                .scaledToFit()
                .frame(height: 100)
                .padding(.top, 40)

            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    Text("Let's get to know you!")
                        .font(.title2)
                        .bold()
                        .padding(.top, 30)

                    Group {
                        TextField("First Name", text: $firstName)
                            .padding()
                            .background(Color(.systemGray6))
                            .cornerRadius(10)

                        TextField("Last Name", text: $lastName)
                            .padding()
                            .background(Color(.systemGray6))
                            .cornerRadius(10)

                        TextField("Email", text: $email)
                            .keyboardType(.emailAddress)
                            .autocapitalization(.none)
                            .padding()
                            .background(Color(.systemGray6))
                            .cornerRadius(10)
                    }

                    Button(action: {
                        if !firstName.isEmpty && !lastName.isEmpty && !email.isEmpty {
                            UserDefaults.standard.set(firstName, forKey: "firstName")
                            UserDefaults.standard.set(lastName, forKey: "lastName")
                            UserDefaults.standard.set(email, forKey: "email")
                            isLoggedIn = true
                        }
                    }) {
                        Text("Get Started")
                            .foregroundColor(.white)
                            .bold()
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.yellow)
                            .cornerRadius(12)
                            .shadow(radius: 2)
                            .padding(.top, 40)
                    }
                }
                .padding(.horizontal, 30)
                .padding(.bottom, 60)
            }
        }
        .ignoresSafeArea(.keyboard)
    }
}
