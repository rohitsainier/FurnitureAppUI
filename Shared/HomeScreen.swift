//
//  HomeScreen.swift
//  SwiftUI_by_SBS (iOS)
//
//  Created by Rohit Saini on 01/05/22.
//

import SwiftUI

struct HomeScreen: View {
    private let categories = ["All", "Chair", "Sofa", "Lamp", "Kitchen", "Table"]
    @State private var selectedIndex: Int = 0
    var body: some View {
        NavigationView {
            ZStack {
                Color("Bg")
                    .edgesIgnoringSafeArea(.all)
            ScrollView {
                VStack(alignment: .leading) {
                    HeaderView()
                    TagLineView()
                        .padding()
                    SearchAndScanView()
                    
                    ScrollView(.horizontal,showsIndicators: false){
                        HStack {
                            ForEach(0 ..< categories.count) { item in
                                CategoryView(isActive: item == selectedIndex, text: categories[item])
                                    .onTapGesture {
                                        selectedIndex = item
                                    }
                            }
                        }
                        .padding()
                    }
                    
                    Text("Popular")
                        .font(.custom("PlayfairDisplay-Bold", size: 24))
                        .padding(.horizontal)
                    
                    ScrollView(.horizontal,showsIndicators: false){
                        HStack{
                            ForEach(1 ..< 5) { i in
                                NavigationLink(destination: DetailScreen()) {
                                    ProductCardView(image: Image("chair_\(i)"), size: 210)
                                }
                                .navigationBarHidden(true)
                                .foregroundColor(.black)
                            }
                            .padding(.trailing)
                        }
                        .padding(.leading)
                    }
                    
                    Text("Best")
                        .font(.custom("PlayfairDisplay-Bold", size: 24))
                        .padding(.horizontal)
                    
                    ScrollView(.horizontal,showsIndicators: false){
                        HStack{
                            ForEach(1 ..< 5) { i in
                                ProductCardView(image: Image("chair_\(i)"), size: 180)
                            }
                            .padding(.trailing)
                        }
                        .padding(.leading)
                    }
                    .padding(.bottom, 100)
                }
            }
                
                HStack {
                    BottomNavBarItem(image: Image("Home")) {}
                    BottomNavBarItem(image: Image("fav")) {}
                    BottomNavBarItem(image: Image("shop")) {}
                    BottomNavBarItem(image: Image("User")) {}
                }
                .padding()
                .background(Color.white)
                .clipShape(Capsule())
                .padding()
                .shadow(radius: 20)
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

struct HeaderView: View {
    var body: some View {
        VStack {
            HStack {
                
                Button (action: {}) {
                    Image ("menu")
                        .padding()
                        .background(Color(.white))
                        .cornerRadius(10)
                }
                Spacer()
                Button (action: {}) {
                    Image("Profile")
                        .resizable()
                        .frame(width: 42, height: 42)
                        .cornerRadius(10)
                }
                
            }
            .padding(.horizontal)
            
        }
    }
}

struct TagLineView: View {
    var body: some View {
        Text("Find The \nBest ")
            .font(.custom("PlayfairDisplay-Regular", size: 28))
            .foregroundColor(Color("Primary"))
        + Text("Furniture!")
            .font(.custom("PlayfairDisplay-Bold", size: 28))
            .foregroundColor(Color("Primary"))
    }
}

struct SearchAndScanView: View {
    @State private var search: String = ""
    var body: some View {
        HStack {
            HStack {
                Image("Search")
                    .padding(.trailing, 8)
                TextField("Search Furniture", text: $search)
            }
            .padding(.all, 20)
            .background(Color.white)
            .cornerRadius(10)
            .padding(.trailing)
            
            Button(action: {}) {
                Image("Scan")
                    .padding()
                    .background(Color("Primary"))
                    .cornerRadius(10)
            }
        }
        .padding(.horizontal)
    }
}

struct CategoryView: View {
    var isActive: Bool
    var text: String
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(text)
                .font(.system(size: 18))
                .fontWeight(.medium)
                .foregroundColor(isActive ? Color("Primary") : Color.black.opacity(0.5))
            
            if isActive {
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
                .frame(width: size, height: 200 * (size / 210))
                .cornerRadius(20)
            Text("Luxury Swedian chair")
                .font(.title3)
                .fontWeight(.bold)
            HStack(spacing: 2) {
                ForEach(0 ..< 5) { item in
                    Image("star")
                }
                
                Spacer()
                
                Text("$1299")
                    .font(.title3)
                    .fontWeight(.bold)
            }
        }
        .frame(width: size)
        .padding()
        .background(Color.white)
        .cornerRadius(20)
    }
}

struct BottomNavBarItem: View {
    let image: Image
    let action: () -> Void
    var body: some View {
        Button(action: action, label: {
            image
                .frame(maxWidth: .infinity)
        })
    }
}
