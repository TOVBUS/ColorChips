//
//  WorkoutKitTestView.swift
//  WorkoutKitSample
//
//  Created by 김혜수 on 7/15/24.
//

import SwiftUI
@preconcurrency import WorkoutKit

struct WorkoutKitTestView: View {
    @State var authorizationState: WorkoutScheduler.AuthorizationState = .notDetermined
    @State var scheduledWorkouts: [ScheduledWorkoutPlan] = []

    let dateFormatter: RelativeDateTimeFormatter = {
        let formatter = RelativeDateTimeFormatter()
        formatter.unitsStyle = .full
        formatter.dateTimeStyle = .named
        return formatter
    }()

    var body: some View {
        NavigationStack {
            List {
                Section("Scheduled Workouts") {
                    ForEach(scheduledWorkouts, id: \.self) { scheduledWorkout in
                        if let scheduledDate = Calendar.autoupdatingCurrent.date(from: scheduledWorkout.date) {
                            VStack(alignment: .leading) {
                                HStack {
                                    VStack(alignment: .leading) {
                                        Text(scheduledWorkout.plan.workout.activity.displayName)

                                        let relativeDate = dateFormatter.localizedString(for: scheduledDate, relativeTo: .now)
                                        Text(relativeDate)
                                            .font(.footnote)
                                            .foregroundStyle(.gray)
                                    }
                                    if scheduledWorkout.complete {
                                        Spacer()
                                        Image(systemName: "checkmark.circle.fill")
                                            .foregroundColor(.green)
                                    }
                                }
                                .fontWeight(.bold)
                            }
                        }
                    }
                }

                Section {
                    Button("Request Authorization") {
                        Task {
                            authorizationState = await WorkoutScheduler.shared.requestAuthorization()
                            await update()
                        }
                    }
                    .disabled(authorizationState != .notDetermined)
                } footer: {
                    Text("Current authorization state: \(String(describing: authorizationState))")
                }
            }
            .navigationTitle("Sample Planner")
            .toolbar {
                ToolbarItem(placement: .automatic) {
                    Menu {
                        Menu {
                            scheduleMenuOptions(for: WorkoutPlan(.custom(WorkoutStore.createCyclingCustomWorkout())))
                        } label: {
                            HStack(alignment: .center) {
                                Image(systemName: "figure.outdoor.cycle")
                                Text("Schedule Cycling")
                            }
                        }
                    } label: {
                        Image(systemName: "calendar.badge.plus")
                    }
                    .disabled(authorizationState != .authorized)
                }
            }
        }
        .task {
            await update(force: true)
        }
        .refreshable {
            await update(force: true)
        }
    }

    private func schedule(workout: WorkoutPlan,
                          daysAhead: Int = 0,
                          hoursAhead: Int = 0) async {

        var daysAheadComponents = DateComponents()
        daysAheadComponents.day = daysAhead
        daysAheadComponents.hour = hoursAhead

        guard let nextDate = Calendar.autoupdatingCurrent.date(byAdding: daysAheadComponents, to: .now) else {
            return
        }

        let nextDateComponents = Calendar.autoupdatingCurrent.dateComponents(in: .autoupdatingCurrent, from: nextDate)
        await WorkoutScheduler.shared.schedule(workout, at: nextDateComponents)

        scheduledWorkouts.append(ScheduledWorkoutPlan(workout, date: nextDateComponents))
    }

    private func update(force: Bool = false) async {
        if force || authorizationState != .authorized {
            authorizationState = await WorkoutScheduler.shared.authorizationState
        }
        scheduledWorkouts = await WorkoutScheduler.shared.scheduledWorkouts
    }

    @ViewBuilder
    private func scheduleMenuOptions(for workout: WorkoutPlan) -> some View {
        Button {
            Task {
                await schedule(workout: workout, hoursAhead: 1)
            }
        } label: {
            Text("In one hour")
        }

        Button {
            Task {
                await schedule(workout: workout, daysAhead: 1)
            }
        } label: {
            Text("Tomorrow")
        }

        Button {
            Task {
                await schedule(workout: workout, daysAhead: 2)
            }
        } label: {
            Text("In 2 days")
        }

        Button {
            Task {
                await schedule(workout: workout, daysAhead: 3)
            }
        } label: {
            Text("In 3 days")
        }
    }
}

import HealthKit

extension HKWorkoutActivityType {
    var displayName: String {
        switch self {
        case .americanFootball:
            return "Football"
        case .archery:
            return "Archery"
        case .australianFootball:
            return "Football"
        case .badminton:
            return "Badminton"
        case .baseball:
            return "Baseball"
        case .basketball:
            return "Basketball"
        case .bowling:
            return "Bowling"
        case .boxing:
            return "Boxing"
        case .climbing:
            return "Climbing"
        case .cricket:
            return "Cricket"
        case .crossTraining:
            return "Cross-Training"
        case .curling:
            return "Curling"
        case .cycling:
            return "Outdoor Cycling"
        case .dance, .danceInspiredTraining:
            return "Dance"
        case .elliptical:
            return "Elliptical"
        case .equestrianSports:
            return "Equestrian Sports"
        case .fencing:
            return "Fencing"
        case .fishing:
            return "Fishing"
        case .functionalStrengthTraining:
            return "Functional Strength Training"
        case .golf:
            return "Golf"
        case .gymnastics:
            return "Gymnastics"
        case .handball:
            return "Handball"
        case .hiking:
            return "Hiking"
        case .hockey:
            return "Hockey"
        case .hunting:
            return "Hunting"
        case .lacrosse:
            return "Lacrosse"
        case .martialArts:
            return "Martial Arts"
        case .mindAndBody:
            return "Mind and Body"
        case .mixedMetabolicCardioTraining:
            return "Mixed Cardio"
        case .paddleSports:
            return "Paddle Sports"
        case .play:
            return "Play"
        case .preparationAndRecovery:
            return "Prep and Recovery"
        case .racquetball:
            return "Racquetball"
        case .rowing:
            return "Rowing"
        case .rugby:
            return "Rugby"
        case .running:
            return "Outdoor Running"
        case .sailing:
            return "Sailing"
        case .skatingSports:
            return "Skating"
        case .snowSports:
            return "Snow Sports"
        case .soccer:
            return "Soccer"
        case .softball:
            return "Softball"
        case .squash:
            return "Squash"
        case .stairClimbing:
            return "Stair Climbing"
        case .surfingSports:
            return "Surfing"
        case .swimming:
            return "Swimming"
        case .tableTennis:
            return "Table Tennis"
        case .tennis:
            return "Tennis"
        case .trackAndField:
            return "Track-and-Field"
        case .traditionalStrengthTraining:
            return "Traditional Strength Training"
        case .volleyball:
            return "Volleyball"
        case .walking:
            return "Outdoor Walking"
        case .waterFitness:
            return "Water Fitness"
        case .waterPolo:
            return "Water Polo"
        case .waterSports:
            return "Water Sports"
        case .wrestling:
            return "Wrestling"
        case .yoga:
            return "Yoga"
        case .barre:
            return "Barre"
        case .coreTraining:
            return "Core Training"
        case .crossCountrySkiing:
            return "Cross-Country Skiing"
        case .downhillSkiing:
            return "Downhill Skiing"
        case .flexibility:
            return "Flexibility"
        case .highIntensityIntervalTraining:
            return "High-Intensity Interval Training"
        case .jumpRope:
            return "Jump Rope"
        case .kickboxing:
            return "Kickboxing"
        case .pilates:
            return "Pilates"
        case .snowboarding:
            return "Snowboarding"
        case .stairs:
            return "Stairs"
        case .stepTraining:
            return "Step Training"
        case .wheelchairWalkPace:
            return "Wheelchair Roll"
        case .wheelchairRunPace:
            return "Wheelchair Roll"
        case .taiChi:
            return "TaiChi"
        case .mixedCardio:
            return "Mixed Cardio"
        case .handCycling:
            return "Hand Cycling"
        case .discSports:
            return "Disc Sports"
        case .fitnessGaming:
            return "Fitness Gaming"
        case .cardioDance:
            return "Cardio Dance"
        case .socialDance:
            return "Social Dance"
        case .pickleball:
            return "Pickleball"
        case .cooldown:
            return "Cooldown"
        case .swimBikeRun:
            return "Swim-Bike-Run"
        case .transition:
            return "Transition"
        case .underwaterDiving:
            return "Underwater Diving"
        case .other:
            return "Other"
        @unknown default:
            return "Other"
        }
    }
}

#Preview {
    WorkoutKitTestView()
}

