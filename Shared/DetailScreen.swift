//
//  DetailScreen.swift
//  SwiftUI_by_SBS (iOS)
//
//  Created by Rohit Saini on 01/05/22.
//

import SwiftUI


struct DetailScreen: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {
        ZStack {
            Color("Bg")
                .edgesIgnoringSafeArea(.all)
            ScrollView{
                Image("chair_1")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    
                DescriptionView()
                    .offset(y: -40)
                
            }
            .edgesIgnoringSafeArea(.top)
            HStack{
                Text("$1299")
                    .font(.title)
                    .foregroundColor(.white)
                Spacer()
                
                Button(action: {}) {
                    Text("Add to Cart")
                        .padding()
                        .padding(.horizontal)
                        .foregroundColor(Color("Primary"))
                        .background(Color.white)
                        .cornerRadius(10)
                }
            }
            .padding()
            .padding(.horizontal)
            .background(Color("Primary"))
            .cornerRadius(50, corners: .topLeft)
            .frame(maxHeight: .infinity, alignment: .bottom)
            
            
        }
        .edgesIgnoringSafeArea(.bottom)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading:
                                NavigationBackButton(action: {presentationMode.wrappedValue.dismiss()}), trailing: Image("threeDot")
        )
    }
}

struct DescriptionView: View {
    var body: some View {
        VStack(alignment: .leading){
            Text("Luxury Swedia\nChair")
                .font(.title)
                .fontWeight(.bold)
            HStack{
                ForEach(0 ..< 5) { item in
                    Image("star")
                    
                }
                Text("(4.9)")
                    .opacity(0.5)
                Spacer()
                
            }
            Text("Description")
                .fontWeight(.medium)
                .padding(.vertical, 8)
            Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book")
                .lineSpacing(4)
                .opacity(0.6)
            
            HStack(alignment: .top) {
                VStack(alignment: .leading){
                    Text("Size")
                        .fontWeight(.semibold)
                        .padding(.bottom, 4)
                    Text("Height: 120 cm")
                        .opacity(0.6)
                    Text("Wide: 80 cm")
                        .opacity(0.6)
                    Text("Diameter: 72 cm")
                        .opacity(0.6)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                VStack(alignment: .leading){
                    Text("Treatment")
                        .fontWeight(.semibold)
                        .padding(.bottom, 4)
                    
                    Text("Jati wood canvas,")
                        .opacity(0.6)
                    Text("Amazing love")
                        .opacity(0.6)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
            }
            .padding(.vertical)
            
            HStack(alignment: .bottom) {
                VStack(alignment: .leading) {
                    Text("Colors")
                        .fontWeight(.semibold)
                    HStack{
                        ColorDotView(color: Color.white)
                        ColorDotView(color: Color.blue)
                        ColorDotView(color: Color("Primary"))
                    }
                }
                
                Spacer()
                
                VStack(alignment: .leading){
                    Text("Quantity")
                        .fontWeight(.semibold)
                    HStack{
                        Button(action: {}) {
                                Image(systemName: "minus")
                                .padding(.all, 8)
                        }
                        .frame(width: 30, height: 30)
                        .overlay(RoundedRectangle(cornerRadius: 50).stroke())
                        .foregroundColor(.black)
                        
                        Text("1")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .padding(.horizontal, 8)
                        
                        Button(action: {}) {
                                Image(systemName: "plus")
                                .padding(.all, 8)
                        }
                        .overlay(RoundedRectangle(cornerRadius: 50).stroke())
                        .background(Color("Primary"))
                        .clipShape(Circle())

                        .foregroundColor(.white)
                    }
                    
                }
            }
            .padding(.bottom, 60)
            
          
        }
        .padding()
        .padding(.top)
        .background(Color("Bg"))
        .cornerRadius(40)
    }
}

struct ColorDotView: View {
    let color: Color
    var body: some View {
            color
                .frame(width: 24, height: 24)
                .clipShape(Circle())
    }
}

struct RoundedCorner: Shape {

    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View{
        clipShape(RoundedCorner(radius: radius, corners: corners))
        
    }
}



struct DetailScreen_Previews: PreviewProvider {
    static var previews: some View {
        DetailScreen()
    }
}

struct NavigationBackButton: View {
    let action: () -> Void
    var body: some View {
        Button(action: action, label: {
                Image(systemName: "chevron.backward")
                    .padding(.all, 12)
                    .background(Color.white)
                    .cornerRadius(8)
                    .foregroundColor(.black)
        })
    }
}
