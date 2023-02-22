//
//  SwiftUIMagnificationGesture.swift
//  SwiftUIContinuedLearning
//
//  Created by Baris Ciftci on 22/02/2023.
//

import SwiftUI

struct SwiftUIMagnificationGesture: View {
    
    @State var currentAmount: CGFloat = 0
    @State var lasttAmount: CGFloat = 0
    
    var body: some View {
        VStack(spacing: 10) {
            HStack {
                Circle()
                    .frame(width: 35, height: 35)
                Text("Zozan")
                Spacer()
                Image(systemName: "ellipsis")
            }
            .padding(.horizontal)
            
            Rectangle()
                .frame(height: 300)
                .scaleEffect(1 + currentAmount)
                .gesture(
                    MagnificationGesture()
                        .onChanged({ value in
                            currentAmount = value - 1
                        })
                        .onEnded({ value in
                            withAnimation(.spring()) {
                                currentAmount = 0
                            }
                                
                        })
                
                )
            
            HStack {
                Image(systemName: "heart.fill")
                Image(systemName: "heart.fill")
                Spacer()
            }
            .padding(.horizontal)
            .font(.headline)
            
            Text("Thsi is caption of my photo")
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
        }
        
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//            .font(.title)
//            .padding(40)
//            .background(Color.red.cornerRadius(26))
//            .scaleEffect(1 + currentAmount + lasttAmount)
//            .gesture(
//                MagnificationGesture()
//                    .onChanged({ value in
//                        currentAmount = value - 1
//                    })
//                    .onEnded({ value in
//                        lasttAmount = lasttAmount + currentAmount
//                        lasttAmount += currentAmount
//                        currentAmount = 0
//                    })
//
//            )
            
    }
}

struct SwiftUIMagnificationGesture_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIMagnificationGesture()
    }
}
