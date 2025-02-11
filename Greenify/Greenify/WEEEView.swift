//
//  WEEEView.swift
//  Greenify
//
//  Created by san022 on 11/02/25.
//

import SwiftUI

struct WEEEView: View {
    @State private var what = 0
    var body: some View {
        NavigationStack{
            VStack {
                Picker("Choose what do you need", selection: $what) {
                    Text("Group 1").tag(0)
                    Text("Group 2").tag(1)
                    Text("Group 3").tag(2)
                    Text("Group 4").tag(3)
                    Text("Group 5").tag(4)
                }
                .pickerStyle(.segmented)
                if what == 0 {
                    Text("What can be thrown in WEEE group 1 waste?")
                        .font(.title)
                        .padding(.top, 20)
                    Text("Refrigerators, freezers, appliances that automatically distribute cold products, air conditioners, dehumidifiers, heat pumps, oil radiators, other equipment for temperature exchange with fluids other than water, dryers with heat pump")
                        .font(.body)
                        .padding(.top, 20)
                }
                if what == 1 {
                    Text("What can be thrown in WEEE group 2 waste?")
                        .font(.title)
                        .padding(.top, 20)
                    Text("Washing machines, dishwashers, cooking appliances")
                        .font(.body)
                        .padding(.top, 20)
                }
                if what == 2 {
                    Text("What can be thrown in WEEE group 3 waste?")
                        .font(.title)
                        .padding(.top, 20)
                    Text("Televisions, screens, monitors, LCD Digital Frames, laptops, notebooks")
                        .font(.body)
                        .padding(.top, 20)
                }
                if what == 3 {
                    Text("What can be thrown in WEEE group 4 waste?")
                        .font(.title)
                        .padding(.top, 20)
                    Text("Lighting apparatus, apparatus for reproducing sound or images, musical apparatus, hi-fi apparatus, large printers, large copiers, large coin-operated machines, large medical devices, large monitoring and control instruments, large apparatus that automatically dispense products and money, large household appliances used to heat rooms, beds and seating furniture as well as other large equipment, mainframes, electronic diaries, radio sets, apparatus for opening or sealing containers or packages, hair dryers, vacuum cleaners, scales, electric kettles, calculators, hoods, mobile phones, electric knives, fax machines, irons, microwave ovens, fryers, blenders, electric and electronic toys, electric or electronic typewriters, sewing machines, knitting machines, electric coffee grinders. satellite navigators (GPS), watches, photovoltaic panels, small equipment with integrated photovoltaic panels, electric shavers, PCs, heat regulators, smoke detectors, routers, electronic cigarettes, electric toothbrushes, printers, telephones, telexes, thermostats, toasters, mechanical brooms, alarm clocks and watches, electric fans, video cameras, video recorders, other products and equipment for collecting, storing, processing, presenting or communicating information by electronic means, telephone answering machines and equipment for transmitting sound, images or other information by telecommunication, all other small equipment, including computer and telecommunications equipment, electric stoves, electric hot plates, electric heating appliances, cleaning equipment, massage and other body care appliances, sports equipment, computers for cycling, scuba diving, running, rowing, etc.")
                        .font(.body)
                        .padding(.top, 20)
                }
                if what == 4 {
                    Text("What can be thrown in WEEE group 5 waste?")
                        .font(.title)
                        .padding(.top, 20)
                    Text("Fluorescent lamps, compact fluorescent lamps, fluorescent tubes, LEDs, high-intensity discharge lamps, including high-pressure sodium lamps and metal-algorithm lamps, low-pressure sodium lamps.")
                        .font(.body)
                        .padding(.top, 20)
                }
            }.padding()
                .navigationTitle("Paper")
            Spacer()
        }
    }
}

#Preview {
    WEEEView()
}
