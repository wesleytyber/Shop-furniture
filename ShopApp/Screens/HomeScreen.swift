//
//  HomeScreen.swift
//  Shop App
//
//  Created by Developer on 04/12/21.
//  Copyright © 2021 Developer. All rights reserved.
//

import SwiftUI

struct HomeScreen: View {
    @State private var selectedIndex: Int = 0
    private let categories = ["All","Chair","Sofa","Lamp","Kitchen","Table"]
    var body: some View {
        NavigationView {
            ZStack {
                Color("Bg")
                    .edgesIgnoringSafeArea(.all)
                
                ScrollView {
                    VStack (alignment: .leading) {
                        AppBarView()
                        
                        TagLineView()
                            .padding()
                        
                        SeachAndScanView()
                        
                        ScrollView (.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(0 ..< categories.count) {item in
                                    // if index == 1 then isActive is true
                                    CategoryView(isActive: item == self.selectedIndex, text: self.categories[item])
                                        .onTapGesture {
                                            self.selectedIndex = item
                                    }
                                }
                            }
                            .padding()
                        }
                        
                        Text("Popular")
                            .font(.custom("PlayfairDisplay-Bold", size: 28))
                            .padding(.horizontal)
                        
                        ScrollView (.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(0 ..< 4) { index in
                                    NavigationLink(
                                        destination: DetailScreen(),
                                        label: {  ProductCardView(image: Image("chair_\(index + 1)"), size: 210)
                                            
                                    })
                                    
                                    
                                }
                                .padding(.trailing)
                            }
                            .padding(.leading)
                        }
                        
                        Text("Best")
                            .font(.custom("PlayfairDisplay-Bold", size: 28))
                            .padding(.horizontal)
                            .padding(.top)
                        
                        ScrollView (.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(0 ..< 4) { index in
                                    ProductCardView(image: Image("chair_\(index + 1)"),
                                                    size: 180)
                                }
                                .padding(.trailing)
                            }
                            .padding(.leading)
                        }
                        
                    }
                }
                
                //          Custom Bottom NavBar
                
                HStack {
                    ButtomNavBarItem(image: Image("home")) {}
                    ButtomNavBarItem(image: Image("fav")) {}
                    ButtomNavBarItem(image: Image("cart")) {}
                    ButtomNavBarItem(image: Image("user")) {}
                }
                .padding()
                .background(Color.white)
                .clipShape(Capsule())
                .padding(.horizontal)
                .shadow(color: Color.black.opacity(0.15), radius: 8, x: 2, y: 6)
                .frame(maxHeight: .infinity, alignment: .bottom)
            }
        }
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}

struct AppBarView: View {
    var body: some View {
        HStack {
            Button(action: {}) {
                Image("menu")
                    .padding()
                    .background(Color(.blue))
                    .cornerRadius(10.0)
            }
            
            Spacer()
            
            Button(action: {}) {
                Image(uiImage:#imageLiteral(resourceName: "Profile"))
                    .resizable()
                    .frame(width: 42, height: 42)
                    .cornerRadius(10.0)
            }
        }
        .padding(.horizontal)
    }
}

struct TagLineView: View {
    var body: some View {
        Text("Find The \nBest ")
            .font(.custom("PlayfairDisplay-regular", size: 28))
            .foregroundColor(Color("Primary"))
            + Text("Furniture!")
                .font(.custom("PlayfairDisplay-bold", size: 28))
                .foregroundColor(Color("Primary"))
    }
}

struct SeachAndScanView: View {
    @State private var search: String = ""
    
    var body: some View {
        HStack {
            HStack {
                Image(systemName: "Search")
                    .padding(.trailing, 8 )
                TextField("Search Furniture", text: $search)
            }
            .padding(.all, 20)
            .background(Color.white)
            .cornerRadius(10.0)
            .padding(.horizontal)
            
            Button(action: {}) {
                Image(systemName: "Scan")
                    .padding()
                    .background(Color("Primary"))
                    .cornerRadius(10.0)
            }
        }
        .padding(.horizontal)
    }
}

struct CategoryView: View {
    
    
    let isActive: Bool
    let text: String
    
    
    var body: some View {
        VStack (alignment: .leading, spacing: 0){
            Text(text)
                .font(.system(size: 18))
                .fontWeight(.medium)
                .foregroundColor(isActive ? Color("Primary"): Color.black.opacity(0.5))
            if (isActive) {
                Color("Primary")
                    .frame(width: 15, height: 2)
                    .clipShape(Capsule())
            }
            
        }
        .padding(.trailing)
    }
}

struct ProductCardView: View {
    let image: Image
    let size: CGFloat
    
    var body: some View {
        VStack {
            image
                .resizable()
                .frame(width: size, height: 200 * (size/210))
                .cornerRadius(20.0)
            
            Text("Luxury Swedian chair")
                .font(.title)
                .fontWeight(.bold)
            
            HStack (spacing: 2){
                ForEach(0 ..< 5) { item in
                    Text("*")
                }
                
                Spacer()
                
                Text("$1299")
                    .font(.title)
                    .fontWeight(.bold)
            }
        }
        .frame(width: size)
        .padding()
        .background(Color.white)
        .cornerRadius(20.0)
    }
}

struct ButtomNavBarItem: View {
    let image: Image
    let action: ()-> Void
    var body: some View {
        Button(action: action, label: {
            image
                .frame(maxWidth: .infinity)
        })
    }
}

