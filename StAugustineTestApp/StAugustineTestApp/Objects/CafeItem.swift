//
//  CafeItem.swift
//  StAugustineTestApp
//
//  Created by Sam Liu on 2021-01-26.
//

import SwiftUI



struct CafeItem: View {



    
    var imageName: String
    var item: String
    var price: Double
    var size: CGFloat
    
    
    let pColor:Color = Color(red: 141/255, green: 18/255, blue: 48/255)
    let tmpColor = Color(red: 211/255, green: 211/255, blue: 211/255, opacity: 0.7)

    // Cadawas
    @State var image:UIImage = UIImage()
    @ObservedObject var imageLoader:ImageLoader
    init(imageName:String, item:String, price:Double, size:CGFloat){
        self.imageName = imageName
        self.item = item
        self.price = price
        self.size = size
        imageLoader = ImageLoader(urlString:"https://firebasestorage.googleapis.com/v0/b/staugustinechsapp.appspot.com/o/cafMenu%2F5.png?alt=media&token=d0c636b9-ad55-42bf-92b8-281d92fa8ee9")
    }
    var body: some View {
    
        ZStack {
            
            Image(uiImage:image)
                .resizable()
                .scaledToFit()
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(pColor, lineWidth: 3)
                        .foregroundColor(.clear)
                        .background(LinearGradient(gradient: Gradient(colors: [Color.clear, tmpColor]), startPoint: .top, endPoint: .bottom))
                        
                    )
                .cornerRadius(10)
                .onReceive(imageLoader.didChange) { data in
                    self.image = UIImage(data: data) ?? UIImage() }
                
            VStack {
                
                Text(item)
                    .foregroundColor(.white)
                    .bold()
                    .font(.system(size: size))
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 5)
                
                Text(String(format: "%.02f", price))
                    .foregroundColor(.white)
                    .bold()
                    .font(.system(size: size))
                    .padding(.bottom, 10)
            }
            .offset(y: 4.5 * size)
                
        }
    
    }
}

struct CafeItem_Previews: PreviewProvider {
    static var previews: some View {
        CafeItem(imageName: "rotini_pasta", item: "Rotini Pasta", price: 4.50, size: 8)
    }
}
