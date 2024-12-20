//
//  SearchBarView.swift
//  WeatherTracker
//
//  Created by Islombek Abdulakhatov on 19/12/24.
//

import SwiftUI

struct SearchBar: View {
    @Binding var city: String
    var onSearch: () -> Void
    
    var body: some View {
        HStack {
            TextField("Search Location", text: $city)
                .padding(.horizontal, 16)
                .padding(.vertical, 12)
                .background(Color(UIColor.systemGray6))
                .cornerRadius(10)
            
            Button(action: onSearch) {
                Image(systemName: "magnifyingglass.circle.fill")
                    .font(.title2)
                    .foregroundColor(.blue)
            }
        }
        .padding(.horizontal)
    }
}
