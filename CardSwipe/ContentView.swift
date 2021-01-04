//
//  ContentView.swift
//  CardSwipe
//
//  Created by Arvind on 04/01/21.
//

import SwiftUI

struct ContentView: View {
        
    @State var dataList = getList()
    @State var index = 0
    @State var scrolled = 0
    @State var index1 = 0
    @State var isShowDetail = false
    
    
    var body: some View {
        if !isShowDetail {
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    HStack {
                        Button(action: {}) {
                            HStack {
                                Image(systemName: "arrow.left")
                                    .resizable()
                                    .renderingMode(.template)
                                    .foregroundColor(.black)
                                    .frame(width: 20, height: 20)
                                
                                Text("Events")
                                    .font(.system(size: 18, weight: .bold))
                                    .foregroundColor(.black)
                            }
                        }
                        Spacer()
                        Button(action: {}) {
                            Image("search")
                                .renderingMode(.template)
                                .foregroundColor(.black)
                        }
                    }.padding(.leading, 30).padding(.trailing, 30)
                    
                    ZStack {
                        ForEach(dataList.reversed()) { story in
                            VStack {
                                HStack {
                                    VStack(alignment: .leading) {
                                        Text(story.id == scrolled ? story.title : "")
                                            .font(.system(size: 30, weight: .bold))
                                            .foregroundColor(.black)
                                        
                                        Text(story.id == scrolled ? story.location : "")
                                            .font(.system(size: 15, weight: .bold))
                                            .foregroundColor(.gray)
                                            .padding(.top, 2).padding(.bottom, 5)
                                        
                                    }.padding(.leading, 5)
                                    Spacer(minLength: 0)
                                    Text(story.id == scrolled ? story.date : "")
                                        .font(.system(size: 15, weight: .bold))
                                        .foregroundColor(.gray)
                                }
                                
                                HStack {
                                    ZStack(alignment: Alignment(horizontal: .leading, vertical: .bottom)) {
                                        Image(story.image)
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: getWidth(), height: (UIScreen.main.bounds.height / 1.8) - CGFloat(story.id - scrolled) * 50)
                                            .cornerRadius(15)
                                                                       
                             
                                    }
                                    .offset(x: story.id - scrolled <= 2 ? CGFloat(story.id - scrolled) * 30 : 60)
                                    .onTapGesture(count: 1) {
                                        withAnimation(Animation.easeInOut(duration: 0.3)) {
                                            self.isShowDetail.toggle()
                                        }
                                    }
                                    Spacer(minLength: 0)
                                }
                            }
                            .contentShape(Rectangle())
                            .offset(x: story.offset)
                            .gesture(DragGesture().onChanged({ (value) in
                                withAnimation {
                                    if value.translation.width < 0 && story.id != dataList.last!.id{
                                        dataList[story.id].offset = value.translation.width
                                    } else {
                                        if story.id > 0 {
                                            dataList[story.id - 1].offset = -(getWidth() + 60) + value.translation.width
                                        }
                                    }
                                }
                            }).onEnded({ (value) in
                                withAnimation {
                                    if value.translation.width < 0 {
                                        if -value.translation.width > 180 && story.id != dataList.last!.id {
                                            dataList[story.id].offset = -(getWidth() + 60)
                                            scrolled += 1
                                        }
                                        else {
                                            dataList[story.id].offset = 0
                                        }
                                    }
                                    else{
                                        if story.id > 0 {
                                            if value.translation.width > 180{
                                                dataList[story.id - 1].offset = 0
                                                scrolled -= 1
                                            }
                                            else {
                                                dataList[story.id - 1].offset = -(getWidth() + 60)
                                            }
                                        }
                                    }
                                }
                            }))
                        }
                    }
                    .frame(height: UIScreen.main.bounds.height / 1.5)
                    .padding(.horizontal, 25)
                    .padding(.top,25)
                    
                    HStack {
                        Image(systemName: "line.horizontal.3")
                            .resizable()
                            .frame(width: 25, height: 17)
                            .foregroundColor(.black)
                        Spacer(minLength: 0)
                        Text("+ Create Event")
                            .font(.system(size: 20, weight: .medium))
                            .foregroundColor(.black)
                            .padding()
                    }.padding(.leading, 30)
                }
            }.background(Color.white)
        } else {
            ZStack {
                let model = dataList[index]
                
                Image(model.image)
                    .resizable()
                    .frame(height: UIScreen.main.bounds.height)
                
                VStack {
                    HStack {
                        Button(action: {
                            withAnimation(Animation.easeInOut(duration: 0.3)) {
                                self.isShowDetail.toggle()
                            }
                        }) {
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
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
