import Cocoa
import SwiftUI
import AppKit

class AppDelegate: NSObject, NSApplicationDelegate {
    
    private var statusItem: NSStatusItem!

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        NSApp.setActivationPolicy(.prohibited)
        
        statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
        if let button = statusItem.button {
            button.title = "Doblefilo"
            button.image = NSImage(systemSymbolName: "d.circle", accessibilityDescription: "d")
            button.alternateImage = NSImage(systemSymbolName: "1.circle", accessibilityDescription: "1")

        }
        
        let view = NSHostingView(rootView: SwiftUIView())
        
        view.frame = NSRect(x: 0, y: 0, width: 170, height: 120)
        
        let menuItem = NSMenuItem()
        menuItem.view = view
        
        let menu = NSMenu()
        menu.addItem(menuItem)
    
                
        
        statusItem?.menu = menu
    }
}
