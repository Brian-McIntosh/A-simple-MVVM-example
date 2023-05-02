# A simple MVVM example

<img src="https://github.com/Brian-McIntosh/MVVM1/blob/main/images/1.png" width="350"/> 

```swift
struct Item: Identifiable, Codable {
    var id = UUID()
    var name: String
    var description: String
    
    // it's always good to have an example of your model/sample data for Preview purposes
    static var exampleItem = Item(name: "Xbox", description: "Sample description")
}

struct ContentView: View {
    
    // Look how I started! For speed's sake, I went right into the View portion of the app to hold onto variables, as opposed to putting them in the ViewModel!!
    // You forgot your training...
    //@State var isOn: Bool = false
    
    @StateObject private var vm = ViewModel()
    
    var body: some View {
        VStack {
            Toggle("Toggle Switch", isOn: $vm.isTurnedOn)            
            HStack {
                Button("Increment") {
                    vm.increment()
                }
                Text("\(vm.counter)")
                    .bold()
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
```
Different way to add ViewModel: as an extension of the ContentView
```swift
extension ContentView {
    
    // Step 2
    // @MainActor = always on main thread
    @MainActor class ViewModel: ObservableObject {
        
        @Published var isTurnedOn: Bool = false
        @Published var counter = 0
        @Published var itemList = [Item]()
        
        func increment() {
            counter += 1
        }
        
        func addItem() {
            let randomItems = ["Playstation", "Xbox", "Nintendo Wii", "Gameboy"]
            let item = randomItems.randomElement()!
            
            let newItem = Item(name: item, description: "Item: \(itemList.count + 1)")
            
            //1st thought...
            //itemList.append(newItem)
            
            withAnimation {
                itemList.insert(newItem, at: 0) // <-- 2nd new
            }
        }
    } 
}
```
