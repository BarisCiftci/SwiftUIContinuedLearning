//
//  SwiftUISoundEffects.swift
//  SwiftUIContinuedLearning
//
//  Created by Baris Ciftci on 04/03/2023.
//

import SwiftUI
import AVKit

class SoundManager {
    
    static let instance = SoundManager()
    
    var player: AVAudioPlayer?
    
    enum SoundOption: String {
        case C
        case D
        case E
        case F
        case G
        case A
        case B
    }
    
    func playSound(sound: SoundOption) {
        
        guard let url = Bundle.main.url(forResource: sound.rawValue, withExtension: "mp3") else { return }
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch let error {
            print("error playing sound. \(error.localizedDescription)")
        }
        
    }
}

struct SwiftUISoundEffects: View {
    
    var body: some View {
        ZStack {
            Capsule()
                .frame(width: 30)
                .frame(maxHeight: .infinity)
                .foregroundColor(.gray)
            VStack {
                Button {
                    SoundManager.instance.playSound(sound: .C)
                } label: {
                    Capsule()
                        .frame(height: 100)
                        .frame(maxWidth: .infinity)
                        .foregroundColor(Color.red)
                        .padding(.horizontal, 10)
                }
                Button {
                    SoundManager.instance.playSound(sound: .D)
                } label: {
                    Capsule()
                        .frame(height: 100)
                        .frame(maxWidth: .infinity)
                        .foregroundColor(Color.orange)
                        .padding(.horizontal, 20)
                }
                Button {
                    SoundManager.instance.playSound(sound: .E)
                } label: {
                    Capsule()
                        .frame(height: 100)
                        .frame(maxWidth: .infinity)
                        .foregroundColor(Color.yellow)
                        .padding(.horizontal, 30)
                }
                Button {
                    SoundManager.instance.playSound(sound: .F)
                } label: {
                    Capsule()
                        .frame(height: 100)
                        .frame(maxWidth: .infinity)
                        .foregroundColor(Color.green)
                        .padding(.horizontal, 40)
                }
                Button {
                    SoundManager.instance.playSound(sound: .G)
                } label: {
                    Capsule()
                        .frame(height: 100)
                        .frame(maxWidth: .infinity)
                        .foregroundColor(Color.indigo)
                        .padding(.horizontal, 50)
                }
                Button {
                    SoundManager.instance.playSound(sound: .A)
                } label: {
                    Capsule()
                        .frame(height: 100)
                        .frame(maxWidth: .infinity)
                        .foregroundColor(Color.blue)
                        .padding(.horizontal, 60)
                }
                Button {
                    SoundManager.instance.playSound(sound: .B)
                } label: {
                    Capsule()
                        .frame(height: 100)
                        .frame(maxWidth: .infinity)
                        .foregroundColor(Color.purple)
                        .padding(.horizontal, 70)
                }
                
                
                
            }
        }
        
    }
    
}

struct SwiftUISoundEffects_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUISoundEffects()
    }
}
