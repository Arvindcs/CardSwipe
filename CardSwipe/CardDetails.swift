//
//  CardDetails.swift
//  CardSwipe
//
//  Created by Arvind on 04/01/21.
//

import SwiftUI

struct CardDetails: View {
    
    @State var dataList = getList()
    @State var selectedIndex: Int
    
    var body: some View {
        ZStack {
            let model = dataList[selectedIndex]
            Image(model.image)
                .resizable()
                .frame(height: UIScreen.main.bounds.height)
            
            VStack {
                HStack {
                    Button(action: {}) {
                        HStack {
                            Image(systemName: "arrow.left")
                                .resizable()
                                .renderingMode(.template)
                                .foregroundColor(.white)
                                .frame(width: 20, height: 20)
                            Text("Event Details")
                                .font(.system(size: 20, weight: .bold))
                                .foregroundColor(.white)
                        }
                    }
                    Spacer()
                    
                }.padding(.top, 30).padding(.leading, 25)
                
                Spacer(minLength: 0)
                
                ZStack {
                    VStack {
                        
                        HStack {
                            VStack(alignment: .leading) {
                                Text(model.title)
                                    .font(.system(size: 30, weight: .bold))
                                    .foregroundColor(.black)
                                
                                Text(model.location)
                                    .font(.system(size: 15, weight: .bold))
                                    .foregroundColor(.gray)
                                    .padding(.top, 2).padding(.bottom, 5)
                                
                                Text(model.date)
                                    .font(.system(size: 15, weight: .bold))
                                    .foregroundColor(.gray)
                                
                            }.padding(.leading, 5)
                            Spacer()
                            
                            Button(action: {}) {
                                Text("Going")
                                    .font(.system(size: 18, weight: .bold))
                                    .foregroundColor(.white)
                                    .frame(width: 100, height: 40)
                                    .background(Color.green)
                                    .cornerRadius(5)
                            }
                        }.padding(.top, 30) .padding()
                        
                        Text("").frame(width: UIScreen.main.bounds.width, height: 0.3).background(Color.gray)
                        
                        HStack {
                            Text("Add to calendar")
                                .font(.system(size: 20, weight: .medium))
                                .foregroundColor(.black)
                            
                            Spacer()
                            Button(action: {}) {
                                HStack {
                                    Text("Know More")
                                        .font(.system(size: 20, weight: .medium))
                                        .foregroundColor(.green)
                                    
                                    Image(systemName: "arrow.right")
                                        .resizable()
                                        .renderingMode(.template)
                                        .foregroundColor(.green)
                                        .frame(width: 20, height: 20)
                                }
                            }
                      
                        }.padding()
                    }
                }.frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height/3, alignment: .top)
                .background(Color.white)
            }
            .padding(.top, 20)
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .ignoresSafeArea(.all)
    }
}
