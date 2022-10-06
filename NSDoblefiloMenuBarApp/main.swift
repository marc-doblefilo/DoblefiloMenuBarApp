//
//  main.swift
//  NSDoblefiloMenuBarApp
//
//  Created by Marc Rodríguez on 5/10/22.
//

import Cocoa

let app = NSApplication.shared
let delegate = AppDelegate()
app.delegate = delegate

_ = NSApplicationMain(CommandLine.argc, CommandLine.unsafeArgv)
