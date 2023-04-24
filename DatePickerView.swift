//
//  DatePickerView.swift
//  Streaks
//
//  Created by Alexander Davis on 4/23/23.
//

import SwiftUI

struct DatePickerView: View {
    @Binding var selectedDate: Date
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            DatePicker("Select Date", selection: $selectedDate, displayedComponents: .date)
                .datePickerStyle(GraphicalDatePickerStyle())
                .labelsHidden()
            
            Button("Done") {
                presentationMode.wrappedValue.dismiss()
            }
            .padding(.top)
        }
        .padding()
    }
}
