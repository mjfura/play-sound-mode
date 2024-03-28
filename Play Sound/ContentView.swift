//
//  ContentView.swift
//  Play Sound
//
//  Created by Marco Fura on 28/03/24.
//

import SwiftUI
import AVFoundation
struct ContentView: View {
    var soundController: SoundController
    @State private var isPianoModeOn:Bool
    @State private var textoIngresado: String = ""

    init() {
        let soundURL = Bundle.main.url(forResource: "audio_muestra", withExtension: "mp3")!
        print("URL del archivo de audio:", soundURL)
        self.soundController = SoundController(soundURL: soundURL)!
        self.isPianoModeOn=false
    }
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
            PlayButton(action: {
                print("Inicando modo Piano")
                self.isPianoModeOn=true
            })
            StopButton(
                action: {
                    print("Deteniendo modo Piano")
                    self.isPianoModeOn=false
                }
            )
            MyTextField(text: $textoIngresado)
                            .frame(width: 0, height: 0)
        }
        .padding()
    }
}
struct MyTextField: NSViewRepresentable {
    @Binding var text: String

    func makeNSView(context: Context) -> NSView {
        let textField = NSTextField()
        textField.delegate = context.coordinator
        return textField
    }

    func updateNSView(_ nsView: NSView, context: Context) {
        guard let textField = nsView as? NSTextField else { return }
        textField.stringValue = text
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(text: $text)
    }

    class Coordinator: NSObject, NSTextFieldDelegate {
        @Binding var text: String

        init(text: Binding<String>) {
            _text = text
        }

        func controlTextDidChange(_ obj: Notification) {
            if let textField = obj.object as? NSTextField {
                text = textField.stringValue
                // Imprimir en la consola cada vez que se cambia el texto
                print("Texto ingresado:", text)
            }
        }
    }
}
#Preview {
    ContentView()
}
