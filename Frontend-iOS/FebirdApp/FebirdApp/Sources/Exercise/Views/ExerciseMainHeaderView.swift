//
//  ExerciseMainHeaderView.swift
//  FebirdApp
//
//  Created by doyeonjeong on 7/18/24.
//

import SwiftUI

struct ExerciseMainHeaderView: View {
    var body: some View {
        HStack(alignment: .center, spacing: 0) {
            HStack(alignment: .center, spacing: 16) {
                Image("profile06")
                    .resizable()
                    .frame(width: 80, height: 80)
                
                VStack(alignment: .leading, spacing: 4) {
                    // Label/xs
                    Text("juLY 16, 2024")
                      .font(
                        Font.custom("Work Sans", size: 10)
                          .weight(.bold)
                      )
                      .kerning(1)
                      .multilineTextAlignment(.center)
                      .foregroundColor(.white)
                    
                    HStack {
                        Text("꽥꽥이님이 접속하다니\n이거 완전 럭키비키잖앙 🍀")
                            .font(
                                Font.custom("IBM Plex Sans KR", size: 16)
                                    .weight(.bold)
                            )
                            .foregroundColor(.white)
                            .frame(height: 50)
                        
                        Rectangle()
                          .foregroundColor(.clear)
                          .frame(width: 50, height: 50)
                          .background(
                            ZStack {
                                Image("peoLogo")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 50, height: 50)
                                    .clipped()
                                
                                Image("NotificationPopup8")
                                    .resizable()
                                    .frame(width: 12, height: 12)
                                    .offset(x: 14, y: -10)
                            }
                          )
                    }
                    
                    HStack(alignment: .center, spacing: 8) {
                        HStack(alignment: .center, spacing: 4) {
                            Image("SolidFire")
                            
                            // Label
                            Text("피오유치원")
                              .font(Font.custom("IBM Plex Sans KR", size: 12))
                              .multilineTextAlignment(.center)
                              .foregroundColor(.white)
                        }
                        .padding(0)
                        
                        Image("SandowCore")
                        
                        HStack(alignment: .center, spacing: 4) {
                            // Text sm/Medium
                            Text("🌱")
                              .font(
                                Font.custom("Work Sans", size: 14)
                                  .weight(.medium)
                              )
                              .multilineTextAlignment(.center)
                              .foregroundColor(.white)
                            
                            // Label
                            Text("새싹반")
                              .font(Font.custom("IBM Plex Sans KR", size: 12))
                              .multilineTextAlignment(.center)
                              .foregroundColor(.white)
                        }
                        Image("SandowCore")
                        
                        HStack(alignment: .center, spacing: 4) {
                            // Text sm/Medium
                            Text("💪🏻")
                                .font(
                                    Font.custom("Work Sans", size: 14)
                                        .weight(.medium)
                                )
                                .multilineTextAlignment(.center)
                                .foregroundColor(.white)
                            
                            // Label
                            Text("2일차")
                                .font(Font.custom("IBM Plex Sans KR", size: 12))
                                .multilineTextAlignment(.center)
                                .foregroundColor(.white)
                        }
                    }
                }
            }
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 34)
        .frame(alignment: .center)
        .background(.gray100)
        .clipShape(
            RoundedCorners(
                topLeft: 0,
                topRight: 0,
                bottomLeft: 34,
                bottomRight: 34
            )
        )
    }
}

#Preview {
    ExerciseMainHeaderView()
}
