//
//  DishDetailView.swift
//  LittleLemon
//
//  Created by Matteo Pinzauti on 18/06/25.
//


import SwiftUI

struct DishDetailView: View {
    let menuItem: MenuItem

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Image(menuItem.imageName)
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(15)
                    .padding()

                Text(menuItem.name)
                    .font(.largeTitle)
                    .bold()

                Text(String(format: "$%.2f", menuItem.price))
                    .font(.title2)
                    .foregroundColor(.secondary)

                Text(menuItem.description)
                    .font(.body)
                    .padding()
            }
        }
        .navigationTitle(menuItem.name)
    }
}