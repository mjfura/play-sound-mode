//
//  StopButton.swift
//  Play Sound
//
//  Created by Marco Fura on 28/03/24.
//


import SwiftUI

struct StopButton: View {
    var action: () -> Void
        
    var body: some View {
    Button(action: action) {
        Text("Detener modo Piano")
    }
    .accessibility(identifier: "button-stop")
    }
}

#Preview {
    StopButton(action: {})
}
