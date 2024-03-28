//
//  PlayButtonTest.swift
//  Play SoundUITests
//
//  Created by Marco Fura on 28/03/24.
//

import XCTest
import AVFoundation


final class PlayButtonTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    func testRenderPlayButton() throws {
        // UI tests must launch the application that they test.
            let app = XCUIApplication()
            app.launch()
            
            // Buscar el botón con el identificador "button-play"
            let playButton = app.buttons["button-play"]
            
            // Verificar si el botón existe
            XCTAssert(playButton.exists)
            // Get the descendants of the button
            XCTAssert(playButton.label == "Iniciar musica")
    }
    func testClickButton() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        // Presiona el botón para iniciar la reproducción de música
        let playButton = app.buttons["Iniciar musica"]
        playButton.tap()
           
        // Espera un tiempo suficiente para que el reproductor de audio se inicie
        sleep(2) // Puedes ajustar este tiempo según sea necesario
           
        // Verifica si el reproductor de audio está reproduciendo música
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
