//
//  SwiftUIArrays.swift
//  SwiftUIContinuedLearning
//
//  Created by Baris Ciftci on 08/03/2023.
//

import SwiftUI

struct UserModel: Identifiable {
    let id = UUID().uuidString
    let name: String
    let points: Int
    let isVerified: Bool
}

class ArrayModificationViewModel: ObservableObject {
    
    @Published var dataArray: [UserModel] = []
    @Published var filteredArray: [UserModel] = []
    
    init() {
        getUser()
        updateFilterArray()
    }
    
    func updateFilterArray() {
        
        
        //sort
      filteredArray = dataArray.sorted{ (user1, user2) -> Bool in
            return user1.points > user2.points
        }
    }
    
    func getUser() {
        let user1 = UserModel(name: "Baris", points: 3, isVerified: true)
        let user2 = UserModel(name: "Natalia", points: 6, isVerified: false)
        let user3 = UserModel(name: "Ebru", points: 10, isVerified: true)
        let user4 = UserModel(name: "Zozo", points: 100, isVerified: true)
        let user5 = UserModel(name: "Yavuz", points: 0, isVerified: false)
        self.dataArray.append(contentsOf: [
            user1,
            user2,
            user3,
            user4,
            user5,
        ])
    }
}

struct SwiftUIArrays: View {
    
    @StateObject var vm = ArrayModificationViewModel()
    
    var body: some View {
        ScrollView {
            VStack(spacing: 12) {
                ForEach(vm.filteredArray) { user in
                    VStack(alignment: .leading) {
                        Text(user.name)
                            .font(.headline)
                        HStack {
                            Text("Points: \(user.points)")
                            Spacer()
                            if user.isVerified {
                                Image(systemName: "checkmark.seal.fill")
                            }
                        }
                    }
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(20)
                    .padding(.horizontal)
                }
            }
        }
    }
}

struct SwiftUIArrays_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIArrays()
    }
}
