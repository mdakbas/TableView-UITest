//
//  TableViewTestUITests.swift
//  TableViewTestUITests
//
//  Created by Mert Deniz Akbaş on 4.09.2023.
//

import XCTest

final class TableViewTestUITests: XCTestCase {
    
    func testaddNoiseMaker() {
        
        let app = XCUIApplication()
        app.launch()
        let newNameButton = app.navigationBars["TableViewTest.HomeVC"].buttons["Add"]
        
    
        let nameField = app.alerts["Add Noise Maker"].scrollViews.otherElements.collectionViews/*@START_MENU_TOKEN@*/.textFields["Shaggy"]/*[[".cells.textFields[\"Shaggy\"]",".textFields[\"Shaggy\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        
        let addButton = app.alerts["Add Noise Maker"].scrollViews.otherElements.buttons["Add"]
        let addedCell = app.tables.staticTexts["Mert"]
       
        newNameButton.tap()
        nameField.tap()
        nameField.typeText("Mert")
        addButton.tap()
        XCTAssertTrue(addedCell.exists)
    }
    
    func testDeleteAddNoiseMaker() {
        
        let app = XCUIApplication()
        app.launch()
        let addButton = app.navigationBars["TableViewTest.HomeVC"].buttons["Add"]
        let nameTextField = app.alerts["Add Noise Maker"].scrollViews.otherElements.collectionViews/*@START_MENU_TOKEN@*/.textFields["Shaggy"]/*[[".cells.textFields[\"Shaggy\"]",".textFields[\"Shaggy\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
       let addedCell = app.alerts["Add Noise Maker"].scrollViews.otherElements.buttons["Add"]
        let tablesQuery = app.tables
 
        let deleteAction = tablesQuery/*@START_MENU_TOKEN@*/.buttons["Delete"]/*[[".cells.buttons[\"Delete\"]",".buttons[\"Delete\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        
        addButton.tap()
        nameTextField.tap()
        nameTextField.typeText("Oyku")
        addedCell.tap()
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Oyku"]/*[[".cells.staticTexts[\"Oyku\"]",".staticTexts[\"Oyku\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.swipeLeft()
        deleteAction.tap()
        XCTAssertFalse(addedCell.exists)
        
    }
}
