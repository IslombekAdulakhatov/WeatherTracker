//
//  StartingView.swift
//  WeatherTracker
//
//  Created by Islombek Abdulakhatov on 19/12/24.
//


import SwiftUI

struct StartingView: View {
    var body: some View {
        VStack(alignment: .center, spacing: 8) {
            Text("No City Selected")
                .font(.title)
                .fontWeight(.bold)
            
            Text("Please Search For A City")
                .font(.subheadline)
                .foregroundColor(.gray)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
        .padding()
    }
}
