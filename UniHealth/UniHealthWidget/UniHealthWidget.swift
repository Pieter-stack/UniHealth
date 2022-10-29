//
//  UniHealthWidget.swift
//  UniHealthWidget
//
//  Created by Pieter Venter on 2022/10/20.
//

import WidgetKit
import SwiftUI
import Intents
import HealthKit

struct Provider: IntentTimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), One: drand48(), Two: drand48(), Three: drand48(), Four: drand48(), configuration: ConfigurationIntent())
    }

    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), One: drand48(), Two: drand48(), Three: drand48(), Four: drand48(), configuration: ConfigurationIntent())
        completion(entry)
    }

    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []


        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 7 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry( date: entryDate ,One: drand48(), Two: drand48(), Three: drand48(), Four: drand48() , configuration: configuration)
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    var date: Date
    var One: Double
    var Two: Double
    var Three: Double
    var Four: Double
    let configuration: ConfigurationIntent
}

struct UniHealthWidgetEntryView : View {
    var entry: Provider.Entry
    var repository = HKRepository()
    

    
    var body: some View {
        ZStack{
         
            ContainerRelativeShape()
                .fill(Color("CustomDarkBlue"))
            VStack(spacing:15){
                HStack(spacing:15){
                    ZStack{
  
                        Circle()
                            .fill(Color.white)
                            .frame(width: 60)
                        Circle()
                            .trim(from: entry.One, to: 1.0)
                           .rotation(.degrees(-90))
                           .stroke(Color("CustomRed") ,style: StrokeStyle(lineWidth: 5, lineCap: .round, dash: [0], dashPhase: 0))
                           .frame(width: 52, height: 52)
                        Image(Activity.allActivities()[0].image)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 30)
                    }//ZStack
                    ZStack{
                        Circle()
                            .fill(Color.white)
                            .frame(width: 60)
                        Circle()
                            .trim(from: entry.Two, to: 1.0)
                           .rotation(.degrees(-90))
                           .stroke(Color("CustomRed") ,style: StrokeStyle(lineWidth: 5, lineCap: .round, dash: [0], dashPhase: 0))
                           .frame(width: 52, height: 52)
                        Image(Activity.allActivities()[1].image)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 30)
                    }//ZStack

                }//HStack
                HStack(spacing:15){
                    ZStack{
                        Circle()
                            .fill(Color.white)
                            .frame(width: 60)
                        Circle()
                            .trim(from: entry.Three, to: 1.0)
                           .rotation(.degrees(-90))
                           .stroke(Color("CustomRed") ,style: StrokeStyle(lineWidth: 5, lineCap: .round, dash: [0], dashPhase: 0))
                           .frame(width: 52, height: 52)
                        Image(Activity.allActivities()[2].image)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 30)
                    }//ZStack
                    ZStack{
                        Circle()
                            .fill(Color.white)
                            .frame(width: 60)
                        Circle()
                            .trim(from: entry.Four, to: 1.0)
                           .rotation(.degrees(-90))
                           .stroke(Color("CustomRed") ,style: StrokeStyle(lineWidth: 5, lineCap: .round, dash: [0], dashPhase: 0))
                           .frame(width: 52, height: 52)
                        Image(Activity.allActivities()[3].image)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 30)
                    }//ZStack

                }//HStack
            }//Vstack
        }
    }
}

@main
struct UniHealthWidget: Widget {
    let kind: String = "UniHealthWidget"

    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider()) { entry in
            UniHealthWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("UniHealth")
        .description("Track your health as a student")
        .supportedFamilies([.systemSmall])
    }
}

struct UniHealthWidget_Previews: PreviewProvider {
    static var previews: some View {
        UniHealthWidgetEntryView(entry: SimpleEntry(date: Date(), One: drand48(), Two: drand48(), Three: drand48(), Four: drand48(), configuration: ConfigurationIntent()))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
            
    }
}
