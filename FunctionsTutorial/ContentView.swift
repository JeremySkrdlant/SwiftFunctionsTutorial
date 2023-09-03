//
//  ContentView.swift
//  FunctionsTutorial
//
//  Created by Jeremy Skrdlant on 9/1/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        //An app only needs one navigation view at the root.  If you add other ones, you will get nested back buttons.
        NavigationView{
            VStack (alignment: .leading) {
                //This text is large because it is of type system title.
                Text("Check out the different types of function calls.")
                    .font(.system(.title))
                
                
                //I am using VStacks to group my label and link on top of each other.
                VStack (alignment: .leading){
                    Text("No Parameters / No Return")
                    //Note that the destination is the EmptyFunction() file.
                    NavigationLink("( )->nil", destination: EmptyFunction())
                }.padding()
                
                
                
                VStack (alignment: .leading){
                    Text("1 Parameter / No Return")
                    //Note that the destination is the OneParameter() file.
                    NavigationLink("(String)->nil", destination: OneParameter())
                }.padding()
                
                
                
                VStack (alignment: .leading){
                    Text("2 Parameters / No Return")
                    //This one links to the MultiParamter file
                    NavigationLink("(String, Int)->nil", destination: MultiParameter())
                }.padding()
                
                
                
                VStack (alignment: .leading){
                    Text("1 Parameter / Returns Int")
                    //This one links to the ParamtersAndReturn file.
                    NavigationLink("(String)->Int", destination: ParametersAndReturn())
                }.padding()
                
            //This closes out the outer VStack
            }.padding()
        //This closes out the navigation view
        }
    //This closes out the body
    }
//This closes out the ContentView struct.
}

//You can remove this and the app will still build. The only thing this does is create the simulator that you see on the right or the bottom.
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        //You can add more ContentViews down here if you want to see different orientations and dark/light modes. 
        ContentView()
    }
}
