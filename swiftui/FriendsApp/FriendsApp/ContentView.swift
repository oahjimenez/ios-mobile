//
//  ContentView.swift
//  FriendsApp
//
//  Created by user164457 on 1/23/20.
//  Copyright © 2020 user164457. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    private func loadFriends() {
        print("Loading...")
    }
    
    var body: some View {
        //also available: HStack, ZStack
        VStack(alignment: .center, spacing: 10) {
            Text("Bienvenido").font(.largeTitle
            ).bold()
                .italic()
                .underline()
                .foregroundColor(Color(red: 16/255, green: 94/255, blue: 160/255))
                .background(Color.red)
            Text("a SwiftUI")
            VStack(spacing:20){
                Button(action: self.loadFriends){
                    VStack{
                        Text("Imprimir").foregroundColor(.white)
                        Text("Los usuarios seleccionados").padding()
                    }
                    .background(Color.blue)
                }
                Button(action: self.loadFriends){
                    VStack{
                        Text("Imprimir").foregroundColor(.white)
                    }
                    .background(Color.blue)
                }
            }
            Spacer()
        }.padding(.top, 50)
            .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
