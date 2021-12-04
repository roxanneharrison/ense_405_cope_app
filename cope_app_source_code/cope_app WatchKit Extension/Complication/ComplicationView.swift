//
//  ComplicationView.swift
//  cope_app WatchKit Extension
//
//  Created by Roxanne Harrison on 2021-10-25.
//

import SwiftUI
import ClockKit

struct ComplicationView: View {
    var body: some View {
        Image(uiImage: UIImage(named: "Cope_Icon44x44")!)
    }
}

struct ComplicationView_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            ComplicationView()
            CLKComplicationTemplateGraphicCircularView(
                ComplicationView()
            ).previewContext()
        }
        
    }
}
