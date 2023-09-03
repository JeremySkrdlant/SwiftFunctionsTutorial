//
//  MultiParameter.swift
//  FunctionsTutorial
//
//  Created by Jeremy Skrdlant on 9/1/23.
//

import SwiftUI

struct MultiParameter: View {
    
    //The box is more complex than just a string now.  This is an example of an object.
    struct Box:Hashable{
        var label:String
        var hue:Double
    }
    
    @State var boxes:[Box] = []
    @State var inputText = ""
    @State var hueValue = 0.5
    
    //This function takes two parameters.  One is a string and the other is a double.
    func addBox(label:String, hue:Double){
        let newBox = Box(label: label, hue: hue)
        boxes.append(newBox)
        inputText = ""
    }
    
    var body: some View {
        VStack{
            //This VStack has my controls to add two parameters to the function.
            VStack{
                TextField("label", text: $inputText)
                    .padding(3)
                    .border(Color.gray)
                    .padding(.horizontal)
                
                HStack{
                    Color(hue: hueValue, saturation: 0.7, brightness: 0.6)
                        .frame(width: 20, height: 20)
                        .padding()
                    Slider(value: $hueValue)
                        .padding(.trailing)
                }
            }
            
            ScrollView{
                //Grid of 3 items each 100 pixels wide.
                LazyVGrid(columns: [GridItem(.fixed(100)), GridItem(.fixed(100)), GridItem(.fixed(100))]){
                    //Loop from 0 to the number of boxes.
                    ForEach(boxes, id:\.self){ box in
                        //Add a box with the label and a color with the hue we passed into the function to the grid for each box in the array.
                        Text(box.label)
                            .bold()
                            .frame(width:100, height:100)
                            .background(Color(hue: Double(box.hue), saturation: 0.7, brightness: 0.6))
                            .foregroundColor(.white)
                    }
                }
            }
            //Pushes the button to the bottom of the screen.
            Spacer()
            //Our button title now had 2 parameters. The label and the hue of the color.
            Button("addBox(label:\"\(inputText)\", hue:\(String(format:"%.2f",hueValue)))") {
                
                //Here is our function call.
                addBox(label: inputText, hue: hueValue)
            }
            .bold()
            .font(.system(size: 20))
            .foregroundColor(.white)
            .padding()
            .background(Color.black)
            .cornerRadius(10)
            .shadow(radius: 6)
            .padding()
        }
    }
}

struct MultiParameter_Previews: PreviewProvider {
    static var previews: some View {
        MultiParameter()
    }
}
