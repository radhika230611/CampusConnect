//
//  TransportDataModel.swift
//  CampusConnect
//
//  Created by PIET 11 on 04/08/26.
//

import SwiftUI

let locations = ["Civil Lines", "Campus", "Shamli", "City Center", "Railway Station", "Samalkha", "Panipat"]

struct TransportSchedule : Identifiable, Hashable{
    let id = UUID()
    let toLocation: String
    let fromLocation: String
    let time: String
    let status : String
}



let TransportData: [TransportSchedule] = [
    TransportSchedule(toLocation: "Campus", fromLocation: "Civil Lines", time: "07:15 AM", status: "On Time"),
    TransportSchedule(toLocation: "Campus", fromLocation: "Panipat", time: "07:30 AM", status: "On Time"),
    TransportSchedule(toLocation: "Campus", fromLocation: "Samalkha", time: "07:45 AM", status: "Delayed"),
    TransportSchedule(toLocation: "Campus", fromLocation: "Shamli", time: "08:00 AM", status: "On Time"),
    TransportSchedule(toLocation: "Campus", fromLocation: "Railway Station", time: "08:15 AM", status: "On Time"),
    TransportSchedule(toLocation: "Civil Lines", fromLocation: "Campus", time: "01:30 PM", status: "On Time"),
    TransportSchedule(toLocation: "Railway Station", fromLocation: "Campus", time: "04:30 PM", status: "On Time"),
    TransportSchedule(toLocation: "Panipat", fromLocation: "Campus", time: "05:00 PM", status: "Cancelled")
]
