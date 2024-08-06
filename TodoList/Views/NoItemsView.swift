//
//  NoItemsView.swift
//  TodoList
//
//  Created by Nicholas Cher Kwok Hui on 06/08/2024.
//

import SwiftUI

struct NoItemsView: View {
    
    @State var animate: Bool = false
    let secondaryAccentColor = Color("SecondaryAccentColor")
    
    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                Text("There are no items")
                    .font(.title)
                    .fontWeight(.semibold)
                Text("Try adding some new items now!!")
                    .padding(.bottom, 10)
                NavigationLink(
                    destination: AddView(),
                    label: {
                        Text("Add new item!! 🥳")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(height: 55)
                            .frame(width: 200)
                            .background(animate ? secondaryAccentColor : Color.accentColor)
                            .cornerRadius(10)
                    })
                .padding(.horizontal, animate ? 30 : 50)
                .shadow(
                    color: animate ? secondaryAccentColor.opacity(0.7) : Color.accentColor.opacity(0.7),
                    radius: animate ? 30 : 10,
                    y: animate ? 50 : 30
                )
                .scaleEffect(animate ? 1.1 : 1.0)
                .offset(y: animate ? -7 : 0)
            }
            .multilineTextAlignment(.center)
            .padding(40)
            .onAppear(perform: addAnimation)
        }
        .frame( maxWidth: .infinity, maxHeight: .infinity)
    }
    
    func addAnimation() {
        if !animate {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                withAnimation(
                    Animation
                        .easeInOut(duration: 2.0)
                        .repeatForever()
                ) {
                    animate.toggle()
                }
            }
        }
    }
}

#Preview {
    NavigationView{
        NoItemsView()
            .navigationTitle("title")
    }

}
