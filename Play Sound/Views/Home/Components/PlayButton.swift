//
//  PlayButton.swift
//  Play Sound
//
//  Created by Marco Fura on 28/03/24.
//

import SwiftUI

struct PlayButton: View {
    var action: () -> Void
        
    var body: some View {
    Button(action: action) {
        Text("Iniciar modo Piano")
    }
    .accessibility(identifier: "button-play")
    }
}

#Preview {
    PlayButton(action: {})
}
