//
//  SwiftUIRotationGesture.swift
//  SwiftUIContinuedLearning
//
//  Created by Baris Ciftci on 26/02/2023.
//

import SwiftUI

struct SwiftUIRotationGesture: View {
    @State var angle:Angle = Angle(degrees: 0)
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .font(.title)
            .padding()
            .padding(.horizontal)
            .background(Color.pink)
            .cornerRadius(25)
            .rotationEffect(angle)
            .gesture(
                RotationGesture()
                    .onChanged({ value in
                        angle = value
                    })
                    .onEnded({ value in
                        withAnimation(.spring()) {
                            angle = Angle(degrees: 0)
                        }
                    })
            )
    }
}

struct SwiftUIRotationGesture_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIRotationGesture()
    }
}
