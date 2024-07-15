//
//  WorkoutStore.swift
//  WorkoutKitSample
//
//  Created by 김혜수 on 7/15/24.
//

import HealthKit
import WorkoutKit

struct WorkoutStore {
    static func createCyclingCustomWorkout() -> CustomWorkout {
        let warmupStep = WorkoutStep()
        let block1 = cyclingBlockOne()
        let block2 = cyclingBlockTwo()
        let cooldownStep = WorkoutStep(goal: .time(5, .minutes))
        return CustomWorkout(activity: .cycling, displayName: "my workout", warmup: warmupStep, blocks: [block1, block2], cooldown: cooldownStep)
    }

    static func cyclingBlockOne() -> IntervalBlock {
        var workStep1 = IntervalStep(.work)
        workStep1.step.goal = .distance(2, .miles)
        workStep1.step.alert = .speed(10, unit: .milesPerHour, metric: .current)

        var recoveryStep1 = IntervalStep(.recovery)
        recoveryStep1.step.goal = .distance(0.5, .miles)
        recoveryStep1.step.alert = .heartRate(zone: 1)

        return IntervalBlock(steps: [workStep1, recoveryStep1], iterations: 4)
    }

    static func cyclingBlockTwo() -> IntervalBlock {
        var workStep2 = IntervalStep(.work)
        workStep2.step.goal = .time(2, .minutes)
        workStep2.step.alert = .power(250...275, unit: .watts)

        var recoveryStep2 = IntervalStep(.recovery)
        recoveryStep2.step.goal = .time(30, .seconds)
        recoveryStep2.step.alert = .heartRate(zone: 1)

        return IntervalBlock(steps: [workStep2, recoveryStep2], iterations: 2)
    }
}
