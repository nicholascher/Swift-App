//
//  AddView.swift
//  TodoList
//
//  Created by Nicholas Cher Kwok Hui on 06/08/2024.
//

import SwiftUI

struct AddView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel: ListViewModel
    @State var textFieldText: String = ""
    
    @State var alertTitle: String = "Your new item must be at least 3 chars long"
    @State var showAlert: Bool = false
    
    var body: some View {
        ScrollView {
            VStack {
                TextField("Type here", text: $textFieldText)
                    .font(.title)
                    .foregroundColor(.purple)
                    .padding()
                    .background(.yellow.opacity(0.2))
                    .cornerRadius(10)
                Button(action: handleButtonPress
                , label: {
                    Text("Add item")
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 30)
                        .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                        .background(Color.accentColor)
                        .cornerRadius(10)

                })
            }
            .padding(12)
        }
        .navigationTitle("Add an Item ✍️")
        .alert(isPresented: $showAlert, content: getAlert)
    }
    
    func handleButtonPress() {
        if isValidText() {
            listViewModel.addItem(title: textFieldText)
            presentationMode.wrappedValue.dismiss()
        } else {
            showAlert.toggle()
        }
    }
    
    func isValidText() -> Bool {
        return textFieldText.count >= 3
    }
    
    func getAlert() -> Alert {
        return Alert(title: Text(alertTitle))
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddView()
        }
        .environmentObject(ListViewModel())
    }
}
