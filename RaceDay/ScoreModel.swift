//
//  ScoreModel.swift
//  RaceDay
//
//  Created by John McNiffe on 02/02/2019.
//  Copyright © 2019 John McNiffe. All rights reserved.
//

import Foundation

class ScoreModel {
  
  // FIX: create initialiser that runs all required steps to give output of result tables
  // FIX:  Only want to do this once the race is complete....should be triggered by user changing status of race to COMPLETE.....results tab should be greyed out and not selectable until this point
  var runnerData = FinishersDataSource()
  
  var counterResults: [CompResult] = []
  var table: [ClubResult] = []
  var runnerResult = [Result]()

  init() {
    
    scoreClubs(runnerResults: runnerData.runnerResult)
  }
  
  func scoreClubs(runnerResults: [Result]) {
    for club in ClubName.allCases {
      let clubSelection = runnerResults.filter { $0.runner.club == club }
      for comp in Competition.allCases {
        
        let compSelection = clubSelection.filter(createFilter(for: comp))
        let compRequirements = getCompRequirements(for: comp)
        
        let maxCounterIndex = min(compSelection.count - 1, compRequirements.counters - 1)
        guard maxCounterIndex > 0 else { continue }
        
        var topFinishers = Array(compSelection[0...maxCounterIndex])
        let remainingFinishers = Array(compSelection[(maxCounterIndex + 1)...])
        
        let compRequirement = getCompRequirements(for: comp)
        
        
        // FIX: GET RID OF INOUT
        adjustFinishers(topFinishers: &topFinishers, remainingFinishers: remainingFinishers, for: compRequirement)
  
        // Output counters to results individual and club
        let finalFinishers = topFinishers
        for counter in topFinishers {
          counterResults.append(CompResult(comp: comp, runner: counter.runner, points: counter.points))
        }
        
        let clubScore = finalFinishers.reduce(0, { $0 + $1.points })
        table.append(ClubResult(club: club, comp: comp, points: clubScore))
      }
    }
  }
  
  
  func createFilter(for comp: Competition) -> (Result) -> Bool {
    switch comp {
    case .openMale: return { $0.runner.sex == .male }
    case .openFemale: return { $0.runner.sex == .female }
    case .vet: return { $0.runner.ageClass.competition() == .vet }
    case .supervet: return { $0.runner.ageClass.competition() == .supervet }
    }
  }
  
  
  func getCompRequirements(for comp: Competition) -> CompRequirement {
    switch comp {
    case .openMale: return CompRequirement(counters: 7, vets: 3, male: 7, female: 0)
    case .openFemale: return CompRequirement(counters: 4, vets: 1, male: 0, female: 4)
    case .vet: return CompRequirement(counters: 3, vets: 3, male: 2, female: 1)
    case .supervet: return CompRequirement(counters: 3, vets: 3, male: 2, female: 1)
    }
  }
  
  func getCounterFilter(for check: CounterCheck) -> (Result) -> Bool {
    switch check {
    case .vet: return { $0.runner.ageClass.competition() == .vet || $0.runner.ageClass.competition() == .supervet }
    case .female: return { $0.runner.sex == .female }
      //case .male: return { $0.runner.sex == .male }
    }
  }
  
  
  func getRemainderFilter(for check: CounterCheck) -> (Result) -> Bool {
    switch check {
    case .vet: return { $0.runner.ageClass.competition() != .vet && $0.runner.ageClass.competition() != .supervet }
    case .female: return { $0.runner.sex == .male }
      // case .male: return { $0.runner.sex == .female }
    }
  }
  
  func adjustFinishers(topFinishers: inout [Result], remainingFinishers: [Result], for compRequirements: CompRequirement) {
    
    
    for check in CounterCheck.allCases {
      
      let filter = getCounterFilter(for: check)
      let filterRemainder = getRemainderFilter(for: check)
      
      var topFinishers_selection = topFinishers.filter(filter)
      var remainingFinishers_selection = remainingFinishers.filter(filter)
      let requirementCount: Int = {
        switch check {
        case .vet: return compRequirements.vets
        case .female: return compRequirements.female
          // case .male: return compRequirements.male
        }
      }()
      
      
      while topFinishers_selection.count < requirementCount { // Queensbury race - Methley too many male vets on this code...need to eliminate one if count too high
        guard remainingFinishers_selection.count > 0 else { break }
        let runnerIndex = topFinishers.lastIndex(where: filterRemainder)
        if let runnerIndex = runnerIndex {
          if let replacement = remainingFinishers_selection.first {
            topFinishers[runnerIndex] = replacement
            remainingFinishers_selection.removeFirst()
          }
        }
        topFinishers_selection = topFinishers.filter(filter)
      }
      
    }
    
  }
  
  
  func getOverallResult() -> [ClubResult] {
    var overallResult = [ClubResult]()
    
    for club in ClubName.allCases {
      var overallScore = 0
    for result in table where result.club == club && ( result.comp == Competition.openMale || result.comp == Competition.openFemale ) {
        overallScore += result.points
      }
      overallResult.append(ClubResult(club: club, comp: Competition.openMale ,points: overallScore))
    }
    return overallResult
  }
  
  func getTeamResult(_ comp: TeamResult) -> [ClubResult] {
    
    switch comp {
    case .overall:
      let tableFiltered = getOverallResult()
      let sortedTable = tableFiltered.sorted { $0.points > $1.points }
      return sortedTable
    case .male:
      let tableFiltered = table.filter { $0.comp == Competition.openMale }
      let sortedTable = tableFiltered.sorted { $0.points > $1.points }
      return sortedTable
    case .female:
      let tableFiltered = table.filter { $0.comp == Competition.openFemale }
      let sortedTable = tableFiltered.sorted { $0.points > $1.points }
      return sortedTable
   case .vet:
    let tableFiltered = table.filter { $0.comp == Competition.vet }
    let sortedTable = tableFiltered.sorted { $0.points > $1.points }
    return sortedTable
   case .supervet:
    let tableFiltered = table.filter { $0.comp == Competition.supervet }
    let sortedTable = tableFiltered.sorted { $0.points > $1.points }
    return sortedTable
    }
  }
  
}
