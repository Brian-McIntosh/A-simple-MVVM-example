//
//  ContentView.swift
//  MVVM1
//
//  Created by Brian McIntosh on 4/22/23.
//

import SwiftUI

struct ContentView: View {
    
    // Look how I started! For speed's sake, I went right into the View portion of the app to hold onto variables, as opposed to putting them in the ViewModel!!
    // You forgot your training...
    //@State var isOn: Bool = false
    @StateObject private var vm = ViewModel()
    
    var body: some View {
        VStack {
            HStack {
                // DIDN'T NEED!!!
                //Text("Toggle")
                //Spacer()
                Toggle("Toggle Switch", isOn: $vm.isTurnedOn)
                    .padding()
            }// also don't need this HStack... just sayin'
            
            HStack {
                Button("Increment") {
                    vm.increment()
                }
                Text("\(vm.counter)")
                    .bold()
                    .padding()
            }
            List(vm.itemList) { item in
                HStack {
                    Text(item.name)
                    Spacer()
                    Text(item.description)
                }
            }
            .listStyle(.plain)
            .background(.thinMaterial)
            
            Button("Add item") {
                vm.addItem()
            }
            .padding()
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
