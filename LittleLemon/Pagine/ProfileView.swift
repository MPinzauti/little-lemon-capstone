import SwiftUI

struct ProfileView: View {
    @AppStorage("firstName") var firstName: String = ""
    @AppStorage("lastName") var lastName: String = ""
    @AppStorage("email") var email: String = ""
    @AppStorage("isLoggedIn") var isLoggedIn: Bool = true

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Personal Information")) {
                    TextField("First Name", text: $firstName)
                    TextField("Last Name", text: $lastName)
                    TextField("Email", text: $email)
                        .keyboardType(.emailAddress)
                }

                Section {
                    Button("Save Changes") {
                    }
                }

                Section {
                    Button("Log Out") {
                        firstName = ""
                        lastName = ""
                        email = ""
                        isLoggedIn = false
                    }
                    .foregroundColor(.red)
                }
            }
            .navigationTitle("Profile")
        }
    }
}
