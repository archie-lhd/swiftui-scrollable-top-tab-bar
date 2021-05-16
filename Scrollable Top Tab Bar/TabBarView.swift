//
//  TabBarView.swift
//  Timetable
//
//  Created by Archie Liu on 2021-05-15.
//

import SwiftUI

struct TabBarView: View {
    @Binding var index: Int
    var titles = ["Home", "NewTab1","NewTab2","NewTab3","NewTab4"]
    var body: some View {
        ScrollViewReader { proxy in
            ScrollView(.horizontal, showsIndicators: false){
                HStack {
                    ForEach(titles.indices) {id in
                        let title = Text(titles[id]).id(id)
                            .onTapGesture {
                                withAnimation() {
                                    index = id
                                }
                            }
                        if self.index == id {
                            title.foregroundColor(.black)
                        } else {
                            title.foregroundColor(.gray)
                        }
                    }
                    .font(.title)
                    .padding(.top, 50)
                    .padding(.horizontal, 5)
                }
                .padding(.leading, 20)
            }.onChange(of: index) { value in
                withAnimation() {
                    proxy.scrollTo(value, anchor: UnitPoint(x: UnitPoint.leading.x + leftOffset, y: UnitPoint.leading.y))
                }
            }.animation(.easeInOut)
        }
    }
    private let leftOffset: CGFloat = 0.1
}

//struct TabBarView_Previews: PreviewProvider {
//    static var previews: some View {
//        TabBarView(index: 1)
//    }
//}
