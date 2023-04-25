//
//  ContentView.swift
//  Streaks
//
//  Created by Alexander Davis on 4/23/23.
//

import SwiftUI

struct ContentView: View {
    @State private var specifiedDate = Date()
    @State private var showingDatePicker = false
    
    private func saveDate() {
        UserDefaults.standard.set(specifiedDate, forKey: "specifiedDate")
    }

    private func loadDate() {
        if let savedDate = UserDefaults.standard.object(forKey: "specifiedDate") as? Date {
            specifiedDate = savedDate
        }
    }
    
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                Button("Change Date") {
                    showingDatePicker = true
                }
                .padding(.bottom)
            }
            
            VStack {
                Spacer(minLength: 0)
                
                VStack {
                    Text("🔥")
                        .font(.system(size: 80))
                    
                    Text(daysElapsedText + " days")
                        .font(.system(size: 80, design: .rounded))
                        .bold()
                    
                    Text("Let's keep it going!")
                }
                
                Spacer(minLength: 0)
            }
        }
        .sheet(isPresented: $showingDatePicker) {
            DatePickerView(selectedDate: $specifiedDate)
                .onDisappear {
                    saveDate()
                }
        }
        .onAppear {
            loadDate()
        }
    }
    
    private var daysElapsedText: String {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.day], from: specifiedDate, to: Date())
        let daysElapsed = components.day ?? 0
        return String(daysElapsed)
    }
}

