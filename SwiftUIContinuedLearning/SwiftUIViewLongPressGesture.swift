//
//  SwiftUIViewLongPressGesture.swift
//  SwiftUIContinuedLearning
//
//  Created by Baris Ciftci on 21/02/2023.
//

import SwiftUI

struct SwiftUIViewLongPressGesture: View {
    
    @State var isComplete: Bool = false
    @State var isSuccess: Bool = false
    
    var body: some View {
        
        VStack {
            Circle()
                .padding()
                .foregroundColor(isSuccess ? Color.green : Color.gray)
            
            Rectangle()
                .fill(isSuccess ? Color.green : Color.pink)
                .frame(maxWidth: isComplete ? .infinity : 0)
                .frame(height: 55)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color.gray)
            
            HStack {
                Text("CLICK HERE")
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .padding()
                    .padding(.horizontal)
                    .background(Color.black)
                    .cornerRadius(26)
                    .onLongPressGesture(minimumDuration: 1.0, maximumDistance: 20) { (isPressing) in
                        // Start of press -> min duration
                        if isPressing {
                            withAnimation(.easeInOut(duration: 1.0)) {
                                isComplete = true
                            }
                        } else {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                                if !isSuccess {
                                    withAnimation(.easeInOut) {
                                        isComplete = false
                                    }
                                }
                            }
                        }
                    } perform: {
                        // at the min duration
                        withAnimation(.easeInOut) {
                            isSuccess = true
                        }
                    }

                
                Image(systemName: "restart.circle.fill")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.black)
                    .cornerRadius(32)
                    .onTapGesture {
                        isComplete = false
                        isSuccess = false
                    }
            }
            
        }
        
        
        
        
//        Text(isComplete ? "COMPLETED" : " NOT COMPLETE" )
//            .padding()
//            .padding(.horizontal)
//            .background(isComplete ? Color.green : Color.gray)
//            .cornerRadius(10)
//            .onLongPressGesture(minimumDuration: 1.0, maximumDistance: 50) {
//                isComplete.toggle()
//            }
    
    }
}

struct SwiftUIViewLongPressGesture_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIViewLongPressGesture()
    }
}
