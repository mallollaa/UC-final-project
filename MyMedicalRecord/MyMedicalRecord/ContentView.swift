//
//  ContentView.swift
//  MyMedicalRecord
//
//  Created by Manal H R Alajmi  on 24/09/2022.
// this is the beging of my final project

import SwiftUI

struct Clinic: Identifiable {
    let id = UUID()
    let name: String
    let clinicName: String
    let staff: [StaffMember]
}

struct StaffMember: Identifiable{
    let id = UUID()
    let name: String
    let clinicImage: String
}

struct ContentView: View {
    var body: some View {
        HomeBage()
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct HomeBage: View {
    @State var HomeBotton: Bool = true
    let clinics = [
        Clinic(name: "Ear , Nose & Throat", clinicName: "Ear , Nose & Throat",
               staff : [
                StaffMember(
                    name: "Andolex Throat Spray",
                    clinicImage: "Andolex Throat Spray"),
                StaffMember(
                    name: "Medicine Tree Instant Calm ",
                    clinicImage: "Medicine Tree Instant Calm "),
                StaffMember(
                    name: "Medicine Tree LM Formula ",
                    clinicImage: "Medicine Tree LM Formula ")]),
        //Dermatology clinic
        Clinic(name: "Dermatology", clinicName: "Dermatology",
               staff : [
                StaffMember(
                    name: "Nifedipine Er 10 ",
                    clinicImage: "Nifedipine Er 10 "),
                StaffMember(
                    name: "Andolex Throat Spray",
                    clinicImage: "Andolex Throat Spray"),
                StaffMember(
                    name: "Nifedipine Retard ",
                    clinicImage: "Nifedipine Retard ")]),
        
        //Dentistry
        Clinic(name: "Dentistry", clinicName: "Dentistry",
               staff : [
                StaffMember(
                    name: "Accutane",
                    clinicImage: "Accutane"),
                StaffMember(
                    name: "Eczema",
                    clinicImage: "Eczema"),
                StaffMember(
                    name: "Supramin Oint",
                    clinicImage: "Supramin Oint")]),
        //Psychiatry
        Clinic(name: "Psychiatry", clinicName: "Psychiatry",
               staff : [
                StaffMember(
                    name: "auvelity",
                    clinicImage: "auvelity"),
                StaffMember(
                    name: "prescription",
                    clinicImage: "prescription"),
                StaffMember(
                    name: "Antipsychotic",
                    clinicImage: "Antipsychotic")]),
        
        //lapratpry
//        Clinic(name: "lapratpry", clinicName: "lapratpry",
//               staff : [
//                StaffMember(
//                    name: "lapratpry222",
//                    clinicImage: "lapratpry222"),
//                StaffMember(
//                    name: "lapratpry111",
//                    clinicImage: "lapratpry111"),
//                StaffMember(
//                    name: "lapratpry44",
//                    clinicImage: "lapratpry44")]),
//        //Diabetes
//        Clinic(name: "Diabetes", clinicName: "Diabetes",
//               staff : [
//                StaffMember(
//                    name: "Diabetes11",
//                    clinicImage: "Diabetes11"),
//                StaffMember(
//                    name: "Diabetes222",
//                    clinicImage: "Diabetes22"),
//                StaffMember(
//                    name: "Diabetes44",
//                    clinicImage: "Diabetes44")]),
        
    ]
    var body: some View {
        NavigationView(){
            ZStack{
                
                Image("background")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .edgesIgnoringSafeArea(.all)

                VStack{
                    
                    Spacer()
                        .padding()
                    Text("welcome again!")
                        .font(.system(size: 40))
                        .fontWeight(.heavy)
                        .bold()
                    Spacer()
                    
                    Divider().background(.white).padding(.trailing,128)
                        .padding()
                    
                    HStack{
                        
                        Text("Choose The Hospital Clinic :  ")
                            .font(.largeTitle)
                            .fontWeight(.thin)
                            .bold()
                            .font(.system(size: 32))
                        
                        Divider().background(.white).padding(.trailing)
                        //Text("\(Image(systemName: "clock.arrow.circlepath")) 3 days")// for the last visted
                        
                        Image(systemName: HomeBotton ? "plus.circle" :"minus.circle")
                            .resizable()
                            .frame(width: 25, height: 25, alignment:.bottom)
                            .foregroundColor(HomeBotton == true ? .gray: .pink)
                            .onTapGesture {
                                withAnimation(.spring()){
                                    HomeBotton.toggle()
                                }
                            }
                    }
                    
                    VStack{
                        Spacer()
                        if HomeBotton == false {
                            
                            ForEach(clinics){ clinic in
                                NavigationLink(destination: ClinicDetail(clinic: clinic)) {
                                    Text(clinic.name)
                                        .listRowSeparatorTint(.gray, edges:.bottom)
                                        .font(.system(size: 25))
                                        .foregroundColor(.pink)
                                        .padding()
                                        .frame(width: 300, height: 50)
                                        .cornerRadius(10)
                                }
                            }
                            
                        }
                        
                        
                        
                        
                    }
                    
                }
                
                    .foregroundColor(.black) // becouse we want it black for the whole text inside the VStack
                    .padding(.horizontal,12)
                    .padding(.bottom,2)
                
            }
            .navigationTitle("clinics")
                .font(.system(size: 11))
            .accentColor(.white)
        }
        
    }
}

struct ClinicDetail: View {
    let clinic: Clinic
    var body: some View {
        ZStack{
            
            Color.white.edgesIgnoringSafeArea(.all)
            Image("back-1")
                .resizable()
                .ignoresSafeArea(.all)
                .scaledToFill()
               
           
               
            
           
              
        VStack{
//            Image(clinic.name)
//                .resizable()
//                .frame(width: 180, height: 240)
//                .padding(4)
//                .background(.white)
//                .clipShape(RoundedRectangle(cornerRadius:20,style:.circular))
//                .clipShape(Circle())
//                .padding()
            Text(clinic.name).font(.system(size: 22))
                    .padding(10)
                    .background(Color.green)
                    .foregroundColor(Color.white)
                    .cornerRadius(6)
//                .italic()
//                .bold()
//                .background(.white)
//                .foregroundColor(.black)
//                .padding()
            Spacer()
            ScrollView(.vertical) {
                VStack{
                            ForEach(clinic.staff){StaffMember in
                                VStack{
                                    
                                    Image(StaffMember.clinicImage)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 120, height: 150, alignment: .center)
                                        .border(Color.black, width: 2)
                                        .clipped()
//                                        .resizable()
//                     .frame(width: 100, height: 120, alignment:.bottomLeading)
//                                        .clipShape()
                                    Text(StaffMember.name)
//                                        .bold()
                                        .italic()                      .foregroundColor(.black)
                        }
                    }
                }
            }
            .ignoresSafeArea()
//            HStack{
//
//                Divider()
//                        Text("Test ")
//                            .font(.largeTitle)
//                            .foregroundColor(.red)
//                            .padding()
//
//                ForEach(Actors) {actor in
//                    VStack{
//                        Text("actor\(movie.actor)")
//                    }
//
//                }
//
//                            .padding()
//
//
//                    }
            }
            
        
        .padding()
   
        }

       
    }
    }

    
