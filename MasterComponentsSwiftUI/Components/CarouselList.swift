//
//  CarouselList.swift
//  MasterComponentsSwiftUI
//
//  Created by Abdul R. Arraisi on 22/10/20.
//

import SwiftUI

struct CarouselList: View {
    var body: some View {
        Home()
    }
}

struct CarouselList_Previews: PreviewProvider {
    static var previews: some View {
        CarouselList()
    }
}

struct Home : View {
    
    @State var x : CGFloat = 0
    @State var count : CGFloat = 0
    @State var screen = UIScreen.main.bounds.width - 30
    @State var op : CGFloat = 0
    @State var translationWidth : CGFloat = 0
    
    @State var data = [
        
        Card(id: 0, img: "atm_diamond", name: "Diamond", show: false),
        Card(id: 1, img: "atm_pearl", name: "Pearl", show: false),
        Card(id: 2, img: "atm_bromo", name: "Bromo", show: false),
        Card(id: 3, img: "atm_brmo", name: "Bromo", show: false)
        
    ]
    
    var body : some View{
        
        NavigationView{
            
            VStack{
                Text("x: \(x)")
                Text("count: \(count)")
                Text("screen: \(screen)")
                Text("op: \(op)")
                Text("transalation: \(translationWidth)")
                
                Spacer()
                
                HStack(spacing: 15){
                    
                    ForEach(data){i in
                        
                        CardView(data: i)
                            .offset(x: self.x)
                            .highPriorityGesture(
                                
                                DragGesture()
                                    .onChanged({ (value) in
                                        self.translationWidth = value.translation.width
                                        
                                        if value.translation.width > 0 {
                                            print("slide right")
                                            self.x = value.location.x
                                        }
                                        else{
                                            
                                            print("slide left")
                                            self.x = value.location.x - self.screen
                                        }
                                        
                                    })
                                    .onEnded({ (value) in
                                        self.translationWidth = value.translation.width
                                        
                                        if value.translation.width > 0 {
                                            
                                            if value.translation.width > ((self.screen - 80) / 2) && Int(self.count) != 0 {
                                                
                                                self.count -= 1
                                                self.updateHeight(value: Int(self.count))
                                                self.x = -((self.screen + 15) * self.count)
                                            }
                                            else{
                                                self.x = -((self.screen + 15) * self.count)
                                            }
                                            
                                        }
                                        else{
                                            
                                            if -value.translation.width > ((self.screen - 80) / 2) && Int(self.count) !=  (self.data.count - 1){
                                                
                                                self.count += 1
                                                self.updateHeight(value: Int(self.count))
                                                self.x = -((self.screen + 15) * self.count)
                                            }
                                            else{
                                                
                                                self.x = -((self.screen + 15) * self.count)
                                            }
                                            
                                        }
                                    })
                            )
                    }
                }
                .frame(width: UIScreen.main.bounds.width)
                .offset(x: self.op)
                
                Spacer()
            }
            .background(Color.black.opacity(0.07).edgesIgnoringSafeArea(.bottom))
            .navigationBarTitle("Carousel List")
            .animation(.spring())
            .onAppear {
                
                self.op = ((self.screen + 15) * CGFloat(self.data.count / 2)) - (self.data.count % 2 == 0 ? ((self.screen + 15) / 2) : 0)
                
                self.data[0].show = true
            }
        }
    }
    
    func updateHeight(value : Int){
        
        
        for i in 0..<data.count{
            
            data[i].show = false
        }
        
        data[value].show = true
    }
}

struct CardView : View {
    
    var data : Card
    
    var body : some View{
        
        VStack(alignment: .leading, spacing: 0){
            
            Image(data.img)
                .resizable()
                .aspectRatio(contentMode: .fill)
            
        }
        .frame(width: UIScreen.main.bounds.width - 30, height: data.show == true ? 210:195)
        .background(Color.white)
        .cornerRadius(25)
    }
}

// SOURCE : https://kavsoft.dev/Swift/Carousel%20List/
