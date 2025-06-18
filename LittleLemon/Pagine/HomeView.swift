import SwiftUI

enum MenuCategory: String, CaseIterable {
    case starters = "Starters"
    case mains = "Mains"
    case desserts = "Desserts"
    case drinks = "Drinks"
}

struct MenuItem: Identifiable, Equatable {
    let id = UUID()
    let name: String
    let price: Double
    let imageName: String
    let category: MenuCategory
    let description: String

    static let sampleData: [MenuItem] = [
        MenuItem(name: "Bruschetta", price: 5.50, imageName: "Bruschetta", category: .starters, description: "Grilled bread rubbed with garlic and topped with tomatoes, olive oil, and salt."),
        MenuItem(name: "Greek Salad", price: 6.00, imageName: "Greek salad", category: .starters, description: "Fresh salad with tomatoes, cucumbers, olives, and feta cheese."),
        MenuItem(name: "Lemon Desert", price: 4.75, imageName: "Lemon dessert", category: .desserts, description: "Refreshing lemon-flavored dessert to end your meal."),
        MenuItem(name: "Grilled Fish", price: 12.90, imageName: "Grilled fish", category: .mains, description: "Deliciously grilled fish served with vegetables."),
        MenuItem(name: "Pasta", price: 10.90, imageName: "Pasta", category: .mains, description: "Italian style pasta.")
    ]
}

struct HomeView: View {
    @State private var selectedCategory: MenuCategory? = nil
    @State private var searchText: String = ""

    var filteredMenu: [MenuItem] {
        let baseList = selectedCategory == nil ? MenuItem.sampleData : MenuItem.sampleData.filter { $0.category == selectedCategory }
        if searchText.isEmpty {
            return baseList
        } else {
            return baseList.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
        }
    }

    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 10) {
                Image("LittleLemonLogo")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 80)
                    .padding(.horizontal)

                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(MenuCategory.allCases, id: \.self) { category in
                            Button(action: {
                                selectedCategory = category
                            }) {
                                Text(category.rawValue)
                                    .padding(.horizontal, 12)
                                    .padding(.vertical, 8)
                                    .background(selectedCategory == category ? Color.yellow : Color.gray.opacity(0.3))
                                    .foregroundColor(.black)
                                    .cornerRadius(10)
                            }
                        }
                    }
                    .padding(.horizontal)
                }

                TextField("Search menu...", text: $searchText)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                    .padding(.horizontal)

                List(filteredMenu) { item in
                    NavigationLink(destination: DishDetailView(menuItem: item)) {
                        HStack(spacing: 16) {
                            Image(item.imageName)
                                .resizable()
                                .frame(width: 70, height: 70)
                                .cornerRadius(10)

                            VStack(alignment: .leading, spacing: 5) {
                                Text(item.name)
                                    .font(.headline)
                                Text(String(format: "$%.2f", item.price))
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                            }
                        }
                        .padding(.vertical, 5)
                    }
                }
                .listStyle(.plain)
            }
            .navigationTitle("Menu")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                NavigationLink(destination: ProfileView()) {
                    Image(systemName: "person.circle.fill")
                        .font(.title2)
                }
            }
        }
    }
}
