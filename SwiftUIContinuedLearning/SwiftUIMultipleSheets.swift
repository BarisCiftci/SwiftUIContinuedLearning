//
//  SwiftUIMultipleSheets.swift
//  SwiftUIContinuedLearning
//
//  Created by Baris Ciftci on 03/03/2023.
//

import SwiftUI

struct RandomModel: Identifiable {
    let id = UUID().uuidString
    let title: String
}

struct SwiftUIMultipleSheets: View {
    
    @State var selectedModel: RandomModel? = nil
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                
                ForEach(0..<20) { index in
                    Button("BUTTON \(index)") {
                        selectedModel = RandomModel(title: "\(index)")
                        
                    }
                }
            }
            .sheet(item: $selectedModel) { model in
                NewxtScreen(selectedModel: model)
            }
        }
    }
}

struct NewxtScreen: View {
    
    let selectedModel: RandomModel
    
    var body: some View {
        Text(selectedModel.title)
            .font(.largeTitle)
    }
}

struct SwiftUIMultipleSheets_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIMultipleSheets()
    }
}
