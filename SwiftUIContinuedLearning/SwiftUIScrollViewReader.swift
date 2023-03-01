//
//  SwiftUIScrollViewReader.swift
//  SwiftUIContinuedLearning
//
//  Created by Baris Ciftci on 01/03/2023.
//

import SwiftUI

struct SwiftUIScrollViewReader: View {
    
    @State var textFieldText: String = ""
    @State var scrollToIndex: Int = 0
    
    var body: some View {
        VStack {
            TextField("Enter a number here...", text: $textFieldText)
                .frame(height: 55)
                .border(Color.gray)
                .padding(.horizontal)
                .keyboardType(.numberPad)
            
            
            Button("SCROLL NOW") {
                withAnimation(.spring()) {
                    if let index = Int(textFieldText) {
                        scrollToIndex = index
                    }
//                    proxy.scrollTo(scrollToIndex, anchor: .top)
                }
            }
            ScrollView {
                
                ScrollViewReader{ proxy in
                    
                    ForEach(1..<50) { index in
                        Text("index: \(index)")
                            .font(.headline)
                            .frame(height: 200)
                            .frame(maxWidth: .infinity)
                            .background(Color.white).cornerRadius(20)
                            .shadow(radius: 10)
                            .padding()
                            .id(index)
                    }
                    .onChange(of: scrollToIndex) { newValue in
                        withAnimation(.spring()) {
                            proxy.scrollTo(newValue, anchor: .top)
                        }
                    }
                }
                
                
            }
        }
    }
}

struct SwiftUIScrollViewReader_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIScrollViewReader()
    }
}
