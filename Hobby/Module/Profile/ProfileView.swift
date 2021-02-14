//
//  ProfileView.swift
//  CapStoneApps
//
//  Created by Kelvin HT on 11/27/20.
//  Copyright © 2020 Kelvin HT. All rights reserved.
//

import SwiftUI
import Common

struct ProfileView: View {

    @ObservedObject var profilePresenter: ProfilePresenter

    var body: some View {
        ScrollView {
            VStack(alignment: .center) {
                VStack {
                    Image("background_profile")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    Image("photos_profile")
                        .resizable()
                        .frame(width: 150.0, height: 150.0)
                        .offset(y: -50)
                        .padding(.bottom, -50)

                    Text(self.profilePresenter.profile.name)
                        .font(.custom("Roboto-Bold", size: 30))
                        .frame(minWidth: 0, maxWidth: .infinity)
                    Text(self.profilePresenter.profile.job)
                        .font(.custom("Roboto-Medium", size: 25))
                        .frame(minWidth: 0, maxWidth: .infinity)
                    Text(self.profilePresenter.profile.company)
                        .font(.custom("Roboto-Medium", size: 20))
                        .frame(minWidth: 0, maxWidth: .infinity)

                    VStack {
                        Text("ABOUT ME")
                            .padding(.leading, 50.0)
                            .padding(.trailing, 50.0)
                            .padding(.top, 10.0)
                            .padding(.bottom, 30.0)
                            .font(.custom("Roboto-Regular", size: 20))
                            .background(Color(red: 251.0/255, green: 162.0/255, blue: 134.0/255, opacity: 1.0))
                            .cornerRadius(20.0)

                        VStack {
                            Text(ConstantVal.ProfileUser.aboutMe)
                                .font(.custom("Roboto-Regular", size: 15))
                                .lineLimit(50)
                                .padding(.all, 16.0)
                                .border(Color(red: 251.0/255, green: 135.0/255, blue: 0.0/255, opacity: 1.0), width: 1)
                        }
                        .background(Color.white)
                        .cornerRadius(20.0)
                        .offset(y: -20.0)
                    }
                    .padding(.top, 16.0)

                    Text("Your Favorite")
                        .font(.title)
                        .fontWeight(.semibold)
                    VStack {
                        HStack {
                            Image(ConstantVal.TabBarImage.movieTabBar)
                            Text("MOVIE")
                                .bold()
                        }
                    }.cornerRadius(10.0)
                    .padding(EdgeInsets(top: 10, leading: 150, bottom: 10, trailing: 150))
                    .background(Color(red: 251.0/255, green: 162.0/255, blue: 134.0/255, opacity: 1.0))
                    .onTapGesture {
                        print("You click Movie Sports")
                    }

                    VStack {
                        HStack {
                            Image(ConstantVal.TabBarImage.gameTabBar)
                            Text("GAME")
                                .bold()
                        }
                    }.cornerRadius(10.0)
                    .padding(EdgeInsets(top: 10, leading: 154, bottom: 10, trailing: 154))
                    .background(Color(red: 251.0/255, green: 162.0/255, blue: 134.0/255, opacity: 1.0))
                    .onTapGesture {
                        print("You click Game")
                    }

                    VStack {
                        HStack {
                            Image(ConstantVal.TabBarImage.sportTabBar)
                            Text("SPORTS")
                                .bold()
                        }
                    }.cornerRadius(10.0)
                    .padding(EdgeInsets(top: 10, leading: 145, bottom: 10, trailing: 145))
                    .background(Color(red: 251.0/255, green: 162.0/255, blue: 134.0/255, opacity: 1.0))
                    .onTapGesture {
                        print("You click Sports")
                    }
                }
            }.onAppear {
                self.profilePresenter.getProfile()
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
        }
    }
}
