//
//  SwiftUIDragGestureTwo.swift
//  SwiftUIContinuedLearning
//
//  Created by Baris Ciftci on 01/03/2023.
//

import SwiftUI

struct SwiftUIDragGestureTwo: View {
    
    @State var startingOffsetY: CGFloat = UIScreen.main.bounds.height * 0.85
    @State var currentDragOffsetY: CGFloat = 0
    @State var endingDragOffsetY: CGFloat = 0
    
    var body: some View {
        ZStack {
            Color.green.ignoresSafeArea()
            
            MySignUpView()
                .offset(y: startingOffsetY)
                .offset(y: currentDragOffsetY)
                .offset(y: endingDragOffsetY)
                .gesture(
                    DragGesture()
                        .onChanged({ value in
                            currentDragOffsetY = value.translation.height
                        })
                        .onEnded({ value in
                            withAnimation(.spring()) {
                                if currentDragOffsetY < -150 {
                                    endingDragOffsetY = -startingOffsetY
                                    currentDragOffsetY = 0
                                } else if endingDragOffsetY != 0 && currentDragOffsetY > 150 {
                                    endingDragOffsetY = 0
                                    currentDragOffsetY = 0
                                }
                                currentDragOffsetY = 0
                            }
                            
                        })
                    
                )
        }
        .ignoresSafeArea(edges: .bottom)
    }
}

struct SwiftUIDragGestureTwo_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIDragGestureTwo()
    }
}

struct MySignUpView: View {
    var body: some View {
        VStack {
            Image(systemName: "chevron.up")
                .padding()
            
            Text("SIGN UP")
                .font(.headline)
                .fontWeight(.semibold)
            
            Image(systemName: "flame.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
            
            Text("This is the decription for our app. This is my favorite SwitUI course and I recommend to all of my friend to subsicribe")
                .multilineTextAlignment(.center)
            
            Text("CREATE AN ACCOUNT")
                .foregroundColor(.white)
                .font(.headline)
                .padding()
                .padding(.horizontal)
                .background(Color.black.cornerRadius(20))
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .background(Color.white)
        .cornerRadius(30)
    }
}
