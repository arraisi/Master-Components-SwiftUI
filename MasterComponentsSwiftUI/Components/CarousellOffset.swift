//
//  CarousellOffset.swift
//  MasterComponentsSwiftUI
//
//  Created by Abdul R. Arraisi on 04/11/20.
//

import SwiftUI

struct CarousellOffset: View {
    var body: some View {
        CarousellOffsetView()
    }
}

struct CarousellOffset_Previews: PreviewProvider {
    static var previews: some View {
        CarousellOffset()
    }
}

struct CarousellOffsetView : View {
    
    @State var x : CGFloat = 0
    @State var count : CGFloat = 0
    @State var op : CGFloat = 0
    @State var translationWidth : CGFloat = 0
    
    let itemWidth:CGFloat = 236
    let itemHeight:CGFloat = 197
    let itemGapHeight:CGFloat = 5
    
    @State var data = [
        
        Card(id: 0, img: "kartuku_1", name: "Diamond", show: false),
        Card(id: 1, img: "kartuku_2", name: "Pearl", show: false),
        Card(id: 2, img: "kartuku_3", name: "Bromo", show: false),
        Card(id: 3, img: "kartuku_4", name: "Bromo", show: false),
//        Card(id: 4, img: "kartuku_1", name: "Diamond", show: false),
//        Card(id: 5, img: "kartuku_2", name: "Pearl", show: false),
//        Card(id: 6, img: "kartuku_3", name: "Bromo", show: false),
//        Card(id: 7, img: "kartuku_4", name: "Bromo", show: false),
//        Card(id: 8, img: "kartuku_2", name: "Pearl", show: false),
//        Card(id: 9, img: "kartuku_3", name: "Bromo", show: false),
//        Card(id: 10, img: "kartuku_4", name: "Bromo", show: false),
//        Card(id: 11, img: "kartuku_1", name: "Diamond", show: false),
//        Card(id: 12, img: "kartuku_2", name: "Pearl", show: false),
//        Card(id: 13, img: "kartuku_3", name: "Bromo", show: false),
//        Card(id: 14, img: "kartuku_4", name: "Bromo", show: false),
//        Card(id: 15, img: "kartuku_4", name: "Bromo", show: false),
//        Card(id: 16, img: "kartuku_1", name: "Diamond", show: false),
//        Card(id: 17, img: "kartuku_2", name: "Pearl", show: false),
//        Card(id: 18, img: "kartuku_3", name: "Bromo", show: false),
//        Card(id: 19, img: "kartuku_4", name: "Bromo", show: false),
//        Card(id: 20, img: "kartuku_4", name: "Bromo", show: false),
//        Card(id: 21, img: "kartuku_4", name: "Bromo", show: false),
//        Card(id: 22, img: "kartuku_1", name: "Diamond", show: false),
//        Card(id: 23, img: "kartuku_2", name: "Pearl", show: false),
//        Card(id: 24, img: "kartuku_3", name: "Bromo", show: false),
//        Card(id: 25, img: "kartuku_4", name: "Bromo", show: false),
//        Card(id: 26, img: "kartuku_4", name: "Bromo", show: false),
//        Card(id: 27, img: "kartuku_1", name: "Diamond", show: false),
//        Card(id: 28, img: "kartuku_2", name: "Pearl", show: false),
//        Card(id: 29, img: "kartuku_3", name: "Bromo", show: false),
//        Card(id: 30, img: "kartuku_4", name: "Bromo", show: false),
//        Card(id: 31, img: "kartuku_4", name: "Bromo", show: false),
//        Card(id: 32, img: "kartuku_4", name: "Bromo", show: false),
//        Card(id: 33, img: "kartuku_4", name: "Bromo", show: false),
//        Card(id: 34, img: "kartuku_4", name: "Bromo", show: false),
//        Card(id: 35, img: "kartuku_4", name: "Bromo", show: false),
//        Card(id: 36, img: "kartuku_4", name: "Bromo", show: false),
//        Card(id: 37, img: "kartuku_4", name: "Bromo", show: false),
//        Card(id: 38, img: "kartuku_4", name: "Bromo", show: false),
//        Card(id: 39, img: "kartuku_4", name: "Bromo", show: false),
//        Card(id: 40, img: "kartuku_4", name: "Bromo", show: false),
//        Card(id: 41, img: "kartuku_4", name: "Bromo", show: false),
//        Card(id: 42, img: "kartuku_4", name: "Bromo", show: false),
//        Card(id: 43, img: "kartuku_4", name: "Bromo", show: false),
//        Card(id: 44, img: "kartuku_4", name: "Bromo", show: false),
//        Card(id: 45, img: "kartuku_4", name: "Bromo", show: false),
//        Card(id: 46, img: "kartuku_4", name: "Bromo", show: false),
//        Card(id: 47, img: "kartuku_4", name: "Bromo", show: false),
//        Card(id: 48, img: "kartuku_4", name: "Bromo", show: false),
//        Card(id: 49, img: "kartuku_4", name: "Bromo", show: false),
//        Card(id: 50, img: "kartuku_4", name: "Bromo", show: false),
//
        
    ]
    
    var body : some View{
        
        NavigationView{
            
            VStack{
                Text("x: \(x)")
                Text("count: \(count)")
                Text("itemWidth: \(itemWidth)")
                Text("op: \(op)")
                Text("transalation: \(translationWidth)")
                
                Spacer()
                
                HStack(spacing: itemWidth * 0.09){
                    
                    ForEach(data){i in
                        Image(i.img)
                            .resizable()
                            .frame(width: itemWidth, height: i.show == true ? itemHeight:(itemHeight-itemGapHeight))
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
                                            self.x = value.location.x - self.itemWidth
                                        }
                                        
                                    })
                                    .onEnded({ (value) in
                                        self.translationWidth = value.translation.width
                                        
                                        if value.translation.width > 0 {
                                            // dragThreshold -> distance of drag to next item
                                            if value.translation.width > (self.itemWidth / 5) && Int(self.count) != 0 {
                                                
                                                self.count -= 1
                                                self.updateHeight(value: Int(self.count))
                                                self.x = -((self.itemWidth + (itemWidth*0.08)) * self.count)
                                            }
                                            else{
                                                self.x = -((self.itemWidth + (itemWidth*0.08)) * self.count)
                                            }
                                            
                                        }
                                        else{
                                            // dragThreshold -> distance of drag to next item
                                            if -value.translation.width > (self.itemWidth / 5) && Int(self.count) !=  (self.data.count - 1){
                                                
                                                self.count += 1
                                                self.updateHeight(value: Int(self.count))
                                                self.x = -((self.itemWidth + (itemWidth*0.08)) * self.count)
                                            }
                                            else{
                                                
                                                self.x = -((self.itemWidth + (itemWidth*0.08)) * self.count)
                                            }
                                            
                                        }
                                    })
                            )
                    }
                }
                .frame(width: itemWidth)
                .offset(x: self.op)
                
                Spacer()
            }
            .edgesIgnoringSafeArea(.bottom)
            .navigationBarTitle("Carousel List")
            .animation(.spring())
            .onAppear {
                
                self.op = ((self.itemWidth + (itemWidth*0.08)) * CGFloat(self.data.count / 2)) - (self.data.count % 2 == 0 ? ((self.itemWidth + (itemWidth*0.08)) / 2) : 0)
                
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
