//
//  ContentView.swift
//  NSDoblefiloMenuBarApp
//
//  Created by Marc Rodríguez on 5/10/22.
//

import SwiftUI

var system = System()
var cpuUsage = system.usageCPU()
let internalFinder = InternalFinder()

var memoryUsage = System.memoryUsage()

func cpuInString() -> String {
    let value = ((cpuUsage.user+cpuUsage.system)/100)
    return NSString(format:"%.2f", value) as String
}

func cpuInDouble() -> Double {
    let value = ((cpuUsage.user+cpuUsage.system)/100)
    return value
}

func memoryInDouble() -> Double {
    let value = (memoryUsage.active/8)
    return value
}

struct SwiftUIView: View {
    
    @State private var cpuUsageState: Double = 0.0
    @State private var memoryUsageState: Double = 0.0
    @State private var batteryCapacityState: Double = 0.0
    
    @State private var isKeyboardOff: Bool = false
    
    func refreshInformation() {
            cpuUsage = system.usageCPU()
            
            memoryUsage = System.memoryUsage()
    }
    
    var body: some View {
        VStack {
            HStack {
                ZStack {
                    Circle().stroke(
                        Color.gray.opacity(0.5),
                        lineWidth: 6
                    )
                    Circle().trim(from:0, to:(cpuUsageState))
                        .stroke(
                            Color.green,
                            style: StrokeStyle(
                                lineWidth: 6,
                                lineCap: .round
                            )
                        ).rotationEffect(.degrees(-90))
                    Text("CPU").bold()
                }.frame(width: 50, height: 50)
                ZStack {
                    Circle().stroke(
                        Color.gray.opacity(0.5),
                        lineWidth: 6
                    )
                    Circle().trim(from:0, to:(memoryUsageState)).stroke(
                        Color.green,
                        style: StrokeStyle(
                            lineWidth: 6,
                            lineCap: .round
                        )
                    ).rotationEffect(.degrees(-90))
                    Text("RAM").bold()
                }.frame(width: 50, height: 50)
                    .padding(.horizontal, 15)
                ZStack {
                    Circle().stroke(
                        Color.gray.opacity(0.5),
                        lineWidth: 6
                    )
                    Circle().trim(from:0, to:(batteryCapacityState)).stroke(
                        Color.green,
                        style: StrokeStyle(
                            lineWidth: 6,
                            lineCap: .round
                        )
                    ).rotationEffect(.degrees(-90))
                    Text("BATT").bold()
                }.frame(width: 50, height: 50)
            }.padding(.bottom, 20).padding(.top, 15)
            //HStack {
            //    Text("Keyboard cleaning").padding(.horizontal, 10)
            //   Toggle("Keyboard cleaning", isOn: self.$isKeyboardOff)
            //        .toggleStyle(.switch).labelsHidden().padding(.horizontal, 10)
            //        .onChange(of: isKeyboardOff) { value in
            //            if value == true {
            //                print("IT IS TRUE")
            //            }
            //        }
            //}
            HStack {
                Button("Quit") {
                    exit(0)
                }
            }
        }.onAppear {
            refreshInformation()
            self.cpuUsageState = cpuInDouble()
            self.memoryUsageState = memoryInDouble()
            if let internalBattery = internalFinder.getInternalBattery() {
                batteryCapacityState = (Double(internalBattery.currentCapacity!) / 100)
            }
            }
    }
}
