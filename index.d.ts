declare module 'react-native-health' {
  export interface HealthKitPermissions {
    permissions: {
      read: HealthPermission[]
      write: HealthPermission[]
    }
  }

  export interface Constants {
    Activities: Record<HealthActivity, HealthActivity>
    Observers: Record<HealthObserver, HealthObserver>
    Permissions: Record<HealthPermission, HealthPermission>
    Units: Record<HealthUnit, HealthUnit>
  }

  export interface HKErrorResponse {
    message?: string
  }

  export interface AppleHealthKit {
    initHealthKit(
      permissions: HealthKitPermissions,
      callback: (error: string, result: HealthValue) => void,
    ): void

    isAvailable(callback: (error: Object, results: boolean) => void): void

    getBiologicalSex(
      options: HealthUnitOptions,
      callback: (err: string, results: HealthValue) => void,
    ): void

    getBloodType(
      options: HealthUnitOptions,
      callback: (err: string, results: HealthValue) => void,
    ): void

    getDateOfBirth(
      options: any,
      callback: (err: string, results: HealthDateOfBirth) => void,
    ): void

    getLatestWeight(
      options: HealthUnitOptions,
      callback: (err: string, results: HealthValue) => void,
    ): void

    getWeightSamples(
      options: HealthInputOptions,
      callback: (err: string, results: Array<HealthValue>) => void,
    ): void

    saveWeight(
      options: HealthValueOptions,
      callback: (error: string, result: HealthValue) => void,
    ): void

    getLatestHeight(
      options: HealthUnitOptions,
      callback: (err: string, results: HealthValue) => void,
    ): void

    getHeightSamples(
      options: HealthInputOptions,
      callback: (err: string, results: Array<HealthValue>) => void,
    ): void

    saveHeight(
      options: HealthValueOptions,
      callback: (error: string, result: HealthValue) => void,
    ): void

    getLatestWaistCircumference(
      options: HealthUnitOptions,
      callback: (err: string, results: HealthValue) => void,
    ): void

    getWaistCircumferenceSamples(
      options: HealthInputOptions,
      callback: (err: string, results: Array<HealthValue>) => void,
    ): void

    saveWaistCircumference(
      options: HealthValueOptions,
      callback: (error: string, result: HealthValue) => void,
    ): void

    getLatestPeakFlow(
      options: HealthUnitOptions,
      callback: (err: string, results: HealthValue) => void,
    ): void

    getPeakFlowSamples(
      options: HealthInputOptions,
      callback: (err: string, results: Array<HealthValue>) => void,
    ): void

    savePeakFlow(
      options: HealthValueOptions,
      callback: (error: string, result: HealthValue) => void,
    ): void

    saveLeanBodyMass(
      options: HealthValueOptions,
      callback: (error: string, result: HealthValue) => void,
    ): void

    getLatestBmi(
      options: HealthUnitOptions,
      callback: (err: string, results: HealthValue) => void,
    ): void

    getBmiSamples(
      options: HealthInputOptions,
      callback: (err: string, results: Array<HealthValue>) => void,
    ): void

    saveBmi(
      options: HealthValueOptions,
      callback: (error: string, result: HealthValue) => void,
    ): void

    getLatestBodyFatPercentage(
      options: HealthUnitOptions,
      callback: (err: string, results: HealthValue) => void,
    ): void

    getBodyFatPercentageSamples(
      options: HealthInputOptions,
      callback: (err: string, results: Array<HealthValue>) => void,
    ): void

    getLatestLeanBodyMass(
      options: HealthUnitOptions,
      callback: (err: string, results: HealthValue) => void,
    ): void

    getLeanBodyMassSamples(
      options: HealthInputOptions,
      callback: (err: string, results: Array<HealthValue>) => void,
    ): void

    getStepCount(
      options: HealthInputOptions,
      callback: (err: string, results: HealthValue) => void,
    ): void

    getSamples(
      options: HealthInputOptions,
      callback: (err: string, results: Array<HealthValue>) => void,
    ): void

    getAnchoredWorkouts(
      options: HealthInputOptions,
      callback: (err: HKErrorResponse, results: AnchoredQueryResults) => void,
    ): void

    getDailyStepCountSamples(
      options: HealthInputOptions,
      callback: (err: string, results: Array<HealthValue>) => void,
    ): void

    saveSteps(
      options: HealthValueOptions,
      callback: (error: string, result: HealthValue) => void,
    ): void

    saveWalkingRunningDistance(
      options: HealthValueOptions,
      callback: (error: string, result: HealthValue) => void,
    ): void

    getDistanceWalkingRunning(
      options: HealthInputOptions,
      callback: (err: string, results: HealthValue) => void,
    ): void

    getDailyDistanceWalkingRunningSamples(
      options: HealthInputOptions,
      callback: (err: string, results: Array<HealthValue>) => void,
    ): void

    getDistanceCycling(
      options: HealthInputOptions,
      callback: (err: string, results: HealthValue) => void,
    ): void

    getDailyDistanceCyclingSamples(
      options: HealthInputOptions,
      callback: (err: string, results: Array<HealthValue>) => void,
    ): void

    getFlightsClimbed(
      options: HealthInputOptions,
      callback: (err: string, results: HealthValue) => void,
    ): void

    getDailyFlightsClimbedSamples(
      options: HealthInputOptions,
      callback: (err: string, results: Array<HealthValue>) => void,
    ): void

    getEnergyConsumedSamples(
      options: HealthInputOptions,
      callback: (err: string, results: Array<HealthValue>) => void,
    ): void

    getProteinSamples(
      options: HealthInputOptions,
      callback: (err: string, results: Array<HealthValue>) => void,
    ): void

    getFiberSamples(
      options: HealthInputOptions,
      callback: (err: string, results: Array<HealthValue>) => void,
    ): void

    getTotalFatSamples(
      options: HealthInputOptions,
      callback: (err: string, results: Array<HealthValue>) => void,
    ): void

    saveFood(
      options: HealthInputOptions,
      callback: (error: string, result: HealthValue) => void,
    ): void

    saveWater(
      options: HealthValueOptions,
      callback: (error: string, result: HealthValue) => void,
    ): void

    getWater(
      options: HealthInputOptions,
      callback: (err: string, results: HealthValue) => void,
    ): void

    saveHeartRateSample(
      options: HealthValueOptions,
      callback: (error: string, result: HealthValue) => void,
    ): void

    getWaterSamples(
      options: HealthInputOptions,
      callback: (err: string, results: Array<HealthValue>) => void,
    ): void

    getHeartRateSamples(
      options: HealthInputOptions,
      callback: (err: string, results: Array<HealthValue>) => void,
    ): void

    getRestingHeartRate(
      options: HealthInputOptions,
      callback: (err: string, results: HealthValue) => void,
    ): void

    getWalkingHeartRateAverage(
      options: HealthInputOptions,
      callback: (err: string, results: HealthValue[]) => void,
    ): void

    getActiveEnergyBurned(
      options: HealthInputOptions,
      callback: (err: string, results: Array<HealthValue>) => void,
    ): void

    getBasalEnergyBurned(
      options: HealthInputOptions,
      callback: (err: string, results: Array<HealthValue>) => void,
    ): void

    getAppleExerciseTime(
      options: HealthInputOptions,
      callback: (err: string, results: Array<HealthValue>) => void,
    ): void

    getAppleStandTime(
      options: HealthInputOptions,
      callback: (err: string, results: Array<HealthValue>) => void,
    ): void

    getVo2MaxSamples(
      options: HealthInputOptions,
      callback: (err: string, results: Array<HealthValue>) => void,
    ): void

    getBodyTemperatureSamples(
      options: HealthInputOptions,
      callback: (err: string, results: Array<HealthValue>) => void,
    ): void

    getBloodPressureSamples(
      options: HealthInputOptions,
      callback: (err: string, results: Array<BloodPressureSampleValue>) => void,
    ): void

    getRespiratoryRateSamples(
      options: HealthInputOptions,
      callback: (err: string, results: Array<HealthValue>) => void,
    ): void

    getHeartRateVariabilitySamples(
      options: HealthInputOptions,
      callback: (err: string, results: Array<HealthValue>) => void,
    ): void

    getHeartbeatSeriesSamples(
      options: HealthInputOptions,
      callback: (err: string, results: HeartbeatSeriesSampleValue[]) => void,
    ): void

    getRestingHeartRateSamples(
      options: HealthInputOptions,
      callback: (err: string, results: Array<HealthValue>) => void,
    ): void

    getBloodGlucoseSamples(
      options: HealthInputOptions,
      callback: (err: string, results: Array<HealthValue>) => void,
    ): void

    getCarbohydratesSamples(
      options: HealthInputOptions,
      callback: (err: string, results: Array<HealthValue>) => void,
    ): void

    saveBloodGlucoseSample(
      options: HealthValueOptions,
      callback: (error: string, result: HealthValue) => void,
    ): void

    saveCarbohydratesSample(
      options: HealthValueOptions,
      callback: (error: string, result: HealthValue) => void,
    ): void

    deleteBloodGlucoseSample(
      id: string,
      callback: (error: string, result: HealthValue) => void,
    ): void

    deleteCarbohydratesSample(
      id: string,
      callback: (error: string, result: HealthValue) => void,
    ): void

    getSleepSamples(
      options: HealthInputOptions,
      callback: (err: string, results: Array<SleepValue>) => void,
    ): void

    getInfo(
      options: HealthUnitOptions,
      callback: (err: string, results: HealthValue) => void,
    ): void

    getMindfulSession(
      options: HealthInputOptions,
      callback: (err: string, results: HealthValue) => void,
    ): void

    saveMindfulSession(
      options: HealthValueOptions,
      callback: (error: string, result: HealthValue) => void,
    ): void

    getWorkout(
      options: HealthInputOptions,
      callback: (err: string, results: HealthValue) => void,
    ): void

    getWorkoutRouteSamples(
      options: { id: string },
      callback: (err: string, results: WorkoutRouteQueryResults) => void,
    ): void

    saveWorkout(
      options: HealthActivityOptions,
      callback: (error: string, result: HealthValue) => void,
    ): void

    getAuthStatus(
      permissions: HealthKitPermissions,
      callback: (err: string, results: HealthStatusResult) => void,
    ): void

    getLatestBloodAlcoholContent(
      options: HealthInputOptions,
      callback: (err: string, results: HealthValue) => void,
    ): void

    getBloodAlcoholContentSamples(
      options: HealthInputOptions,
      callback: (err: string, results: Array<HealthValue>) => void,
    ): void

    saveBloodAlcoholContent(
      options: HealthValueOptions,
      callback: (err: string, results: HealthValue) => void,
    ): void

    getDistanceSwimming(
      options: HealthInputOptions,
      callback: (err: string, results: HealthValue) => void,
    ): void

    getDailyDistanceSwimmingSamples(
      options: HealthInputOptions,
      callback: (err: string, results: Array<HealthValue>) => void,
    ): void

    getOxygenSaturationSamples(
      options: HealthInputOptions,
      callback: (err: string, results: Array<HealthValue>) => void,
    ): void

    getElectrocardiogramSamples(
      options: HealthInputOptions,
      callback: (err: string, results: ElectrocardiogramSampleValue[]) => void,
    ): void

    saveBodyFatPercentage(
      options: HealthValueOptions,
      callback: (err: string, results: HealthValue) => void,
    ): void

    saveBodyTemperature(
      options: HealthValueOptions,
      callback: (err: string, results: HealthValue) => void,
    ): void

    getEnvironmentalAudioExposure(
      options: HealthInputOptions,
      callback: (err: string, results: HealthValue[]) => void,
    ): void

    getHeadphoneAudioExposure(
      options: HealthInputOptions,
      callback: (err: string, results: HealthValue[]) => void,
    ): void

    getClinicalRecords(
      options: HealthClinicalRecordOptions,
      callback: (err: string, results: Array<HealthClinicalRecord>) => void,
    ): void

    setObserver(options: HealthObserverOptions): void

    getActivitySummary(
      options: HealthInputOptions,
      callback: (err: string, results: Array<HealthActivitySummary>) => void,
    ): void

    getInsulinDeliverySamples(
      options: HealthInputOptions,
      callback: (err: string, results: Array<HealthValue>) => void,
    ): void

    saveInsulinDeliverySample(
      options: HealthValueOptions,
      callback: (err: string, results: HealthValue) => void,
    ): void

    deleteInsulinDeliverySample(
      id: string,
      callback: (error: string, result: HealthValue) => void,
    ): void

    getStatisticBodyMass(
      options: HealthStatisticsCommonInputOptions,
      callback: (err: string, results: Array<HealthValue>) => void,
    ): void

    getStatisticBloodPressureSystolic(
      options: HealthStatisticsCommonInputOptions,
      callback: (err: string, results: Array<HealthValue>) => void,
    ): void

    getStatisticBloodPressureDiastolic(
      options: HealthStatisticsCommonInputOptions,
      callback: (err: string, results: Array<HealthValue>) => void,
    ): void

    getStatisticBloodGlucose(
      options: HealthStatisticsCommonInputOptions,
      callback: (err: string, results: Array<HealthValue>) => void,
    ): void

    getStatisticBodyMassIndex(
      options: HealthStatisticsCommonInputOptions,
      callback: (err: string, results: Array<HealthValue>) => void,
    ): void

    getStatisticHeight(
      options: HealthStatisticsCommonInputOptions,
      callback: (err: string, results: Array<HealthValue>) => void,
    ): void

    getStatisticStepCount(
      options: HealthStatisticsCommonInputOptions,
      callback: (err: string, results: Array<HealthValue>) => void,
    ): void

    getStatisticHeartRate(
      options: HealthStatisticsCommonInputOptions,
      callback: (err: string, results: Array<HealthValue>) => void,
    ): void

    getStatisticBodyTemperature(
      options: HealthStatisticsCommonInputOptions,
      callback: (err: string, results: Array<HealthValue>) => void,
    ): void

    getStatisticOxygenSaturation(
      options: HealthStatisticsCommonInputOptions,
      callback: (err: string, results: Array<HealthValue>) => void,
    ): void

    getStatisticRestingHeartRate(
      options: HealthStatisticsCommonInputOptions,
      callback: (err: string, results: Array<HealthValue>) => void,
    ): void

    // Dietary

    // Macronutrients
    getStatisticDietaryEnergyConsumed(
      options: HealthStatisticsCommonInputOptions,
      callback: (err: string, results: Array<HealthValue>) => void,
    ): void

    getStatisticDietaryCarbohydrates(
      options: HealthStatisticsCommonInputOptions,
      callback: (err: string, results: Array<HealthValue>) => void,
    ): void

    getStatisticDietaryFiber(
      options: HealthStatisticsCommonInputOptions,
      callback: (err: string, results: Array<HealthValue>) => void,
    ): void

    getStatisticDietarySugar(
      options: HealthStatisticsCommonInputOptions,
      callback: (err: string, results: Array<HealthValue>) => void,
    ): void

    getStatisticDietaryTotalFat(
      options: HealthStatisticsCommonInputOptions,
      callback: (err: string, results: Array<HealthValue>) => void,
    ): void

    getStatisticDietaryFatMonounsaturated(
      options: HealthStatisticsCommonInputOptions,
      callback: (err: string, results: Array<HealthValue>) => void,
    ): void

    getStatisticDietaryFatPolyunsaturated(
      options: HealthStatisticsCommonInputOptions,
      callback: (err: string, results: Array<HealthValue>) => void,
    ): void

    getStatisticDietaryFatSaturated(
      options: HealthStatisticsCommonInputOptions,
      callback: (err: string, results: Array<HealthValue>) => void,
    ): void

    getStatisticDietaryCholesterol(
      options: HealthStatisticsCommonInputOptions,
      callback: (err: string, results: Array<HealthValue>) => void,
    ): void

    getStatisticDietaryProtein(
      options: HealthStatisticsCommonInputOptions,
      callback: (err: string, results: Array<HealthValue>) => void,
    ): void

    // Vitamins

    getStatisticDietaryVitaminA(
      options: HealthStatisticsCommonInputOptions,
      callback: (err: string, results: Array<HealthValue>) => void,
    ): void

    getStatisticDietaryThiamin(
      options: HealthStatisticsCommonInputOptions,
      callback: (err: string, results: Array<HealthValue>) => void,
    ): void

    getStatisticDietaryRiboflavin(
      options: HealthStatisticsCommonInputOptions,
      callback: (err: string, results: Array<HealthValue>) => void,
    ): void

    getStatisticDietaryNiacin(
      options: HealthStatisticsCommonInputOptions,
      callback: (err: string, results: Array<HealthValue>) => void,
    ): void

    getStatisticDietaryPantothenicAcid(
      options: HealthStatisticsCommonInputOptions,
      callback: (err: string, results: Array<HealthValue>) => void,
    ): void

    getStatisticDietaryVitaminB6(
      options: HealthStatisticsCommonInputOptions,
      callback: (err: string, results: Array<HealthValue>) => void,
    ): void

    getStatisticDietaryBiotin(
      options: HealthStatisticsCommonInputOptions,
      callback: (err: string, results: Array<HealthValue>) => void,
    ): void

    getStatisticDietaryVitaminB12(
      options: HealthStatisticsCommonInputOptions,
      callback: (err: string, results: Array<HealthValue>) => void,
    ): void

    getStatisticDietaryVitaminC(
      options: HealthStatisticsCommonInputOptions,
      callback: (err: string, results: Array<HealthValue>) => void,
    ): void

    getStatisticDietaryVitaminD(
      options: HealthStatisticsCommonInputOptions,
      callback: (err: string, results: Array<HealthValue>) => void,
    ): void

    getStatisticDietaryVitaminE(
      options: HealthStatisticsCommonInputOptions,
      callback: (err: string, results: Array<HealthValue>) => void,
    ): void

    getStatisticDietaryVitaminK(
      options: HealthStatisticsCommonInputOptions,
      callback: (err: string, results: Array<HealthValue>) => void,
    ): void

    getStatisticDietaryFolate(
      options: HealthStatisticsCommonInputOptions,
      callback: (err: string, results: Array<HealthValue>) => void,
    ): void

    // Minerals

    getStatisticDietaryCalcium(
      options: HealthStatisticsCommonInputOptions,
      callback: (err: string, results: Array<HealthValue>) => void,
    ): void

    getStatisticDietaryChloride(
      options: HealthStatisticsCommonInputOptions,
      callback: (err: string, results: Array<HealthValue>) => void,
    ): void

    getStatisticDietaryIron(
      options: HealthStatisticsCommonInputOptions,
      callback: (err: string, results: Array<HealthValue>) => void,
    ): void

    getStatisticDietaryMagnesium(
      options: HealthStatisticsCommonInputOptions,
      callback: (err: string, results: Array<HealthValue>) => void,
    ): void

    getStatisticDietaryPhosphorus(
      options: HealthStatisticsCommonInputOptions,
      callback: (err: string, results: Array<HealthValue>) => void,
    ): void

    getStatisticDietaryPotassium(
      options: HealthStatisticsCommonInputOptions,
      callback: (err: string, results: Array<HealthValue>) => void,
    ): void

    getStatisticDietarySodium(
      options: HealthStatisticsCommonInputOptions,
      callback: (err: string, results: Array<HealthValue>) => void,
    ): void

    getStatisticDietaryZinc(
      options: HealthStatisticsCommonInputOptions,
      callback: (err: string, results: Array<HealthValue>) => void,
    ): void

    // Hydration

    getStatisticDietaryWater(
      options: HealthStatisticsCommonInputOptions,
      callback: (err: string, results: Array<HealthValue>) => void,
    ): void

    // Caffeination

    getStatisticDietaryCaffeine(
      options: HealthStatisticsCommonInputOptions,
      callback: (err: string, results: Array<HealthValue>) => void,
    ): void

    // Ultratrace Minerals

    getStatisticDietaryChromium(
      options: HealthStatisticsCumulativeInputOptions,
      callback: (err: string, results: Array<HealthValue>) => void,
    ): void

    getStatisticDietaryCopper(
      options: HealthStatisticsCumulativeInputOptions,
      callback: (err: string, results: Array<HealthValue>) => void,
    ): void

    getStatisticDietaryIodine(
      options: HealthStatisticsCumulativeInputOptions,
      callback: (err: string, results: Array<HealthValue>) => void,
    ): void

    getStatisticDietaryManganese(
      options: HealthStatisticsCumulativeInputOptions,
      callback: (err: string, results: Array<HealthValue>) => void,
    ): void

    getStatisticDietaryMolybdenum(
      options: HealthStatisticsCumulativeInputOptions,
      callback: (err: string, results: Array<HealthValue>) => void,
    ): void

    getStatisticDietarySelenium(
      options: HealthStatisticsCommonInputOptions,
      callback: (err: string, results: Array<HealthValue>) => void,
    ): void

    getStatisticInsulinDelivery(
      options: HealthStatisticsCommonInputOptions,
      callback: (err: string, results: Array<HealthValue>) => void,
    ): void

    // Activity

    getStatisticDistanceWheelchair(
      options: HealthStatisticsCumulativeInputOptions,
      callback: (err: string, results: Array<HealthValue>) => void,
    ): void

    getStatisticAppleExerciseTime(
      options: HealthStatisticsCumulativeInputOptions,
      callback: (err: string, results: Array<HealthValue>) => void,
    ): void

    // Body Measurments

    getStatisticAppleSleepingWristTemperature(
      options: HealthStatisticsCommonInputOptions,
      callback: (err: string, results: Array<HealthValue>) => void,
    ): void

    // Vital Signs

    getStatisticHeartRateRecoveryOneMinute(
      options: HealthStatisticsCommonInputOptions,
      callback: (err: string, results: Array<HealthValue>) => void,
    ): void

    getStatisticAtrialFibrillationBurden(
      options: HealthStatisticsCommonInputOptions,
      callback: (err: string, results: Array<HealthValue>) => void,
    ): void

    // Lab And Test Results

    getStatisticNumberOfTimesFallen(
      options: HealthStatisticsCumulativeInputOptions,
      callback: (err: string, results: Array<HealthValue>) => void,
    ): void

    getStatisticPeakExpiratoryFlowRate(
      options: HealthStatisticsCommonInputOptions,
      callback: (err: string, results: Array<HealthValue>) => void,
    ): void

    getStatisticPeripheralPerfusionIndex(
      options: HealthStatisticsCommonInputOptions,
      callback: (err: string, results: Array<HealthValue>) => void,
    ): void

    // UV Exposure

    getStatisticUvExposure(
      options: HealthStatisticsCommonInputOptions,
      callback: (err: string, results: Array<HealthValue>) => void,
    ): void

    getMedianStatistic(
      options: HealthMedianStatisticsInputOptions,
      callback: (
        err: string,
        results: Array<HealthStatisticsMedianValue>,
      ) => void,
    ): void

    Constants: Constants
  }

  /* Inputs and Payloads */

  export interface HealthDateOfBirth {
    value: string
    age: number
  }
  interface BaseValue {
    id?: string
    startDate: string
    endDate: string
    metadata?: RecordMetadata
  }

  export interface LocationValue {
    latitude: number
    longitude: number
    altitude: number
    timestamp: string
    speed: number
    speedAccuracy: number
  }

  export interface RecordMetadata {
    HKBloodGlucoseMealTime?: BloodGlucoseMealTime
    HKInsulinDeliveryReason?: InsulinDeliveryReason
    HKWasUserEntered?: boolean
    [key: string]: string | number | boolean
  }

  export interface HealthValue extends BaseValue {
    value: number
  }

  export interface HealthStatisticsMedianValue {
    parameterName: string
    firstEntry: string
    medianSeconds: number
    lastEntry: string
    medianDays: number
    entryCount: number
  }

  export interface SleepValue extends BaseValue {
    value: 'INBED' | 'ASLEEP' | 'CORE' | 'DEEP' | 'REM' | 'AWAKE' | 'UNKNOWN'
    sourceName: string
    sourceId: string
  }

  export interface BloodPressureSampleValue extends BaseValue {
    bloodPressureSystolicValue: number
    bloodPressureDiastolicValue: number
  }

  export interface HeartbeatSeriesSampleValue extends BaseValue {
    heartbeatSeries: {
      timeSinceSeriesStart: number
      precededByGap: boolean
    }[]
  }

  export interface HealthUnitOptions {
    unit?: HealthUnit
  }

  export interface HealthInputOptions extends HealthUnitOptions {
    startDate?: string
    endDate?: string
    limit?: number
    ascending?: boolean
    type?: HealthObserver
    date?: string
    includeManuallyAdded?: boolean
    period?: number
    anchor?: string
  }

  export interface HKWorkoutRouteSampleType {
    device: string
    id: string
    metadata: any
    sourceName: string
    sourceId: string
    start: string
    end: string
    locations: LocationValue[]
  }

  export enum EventType {
    Pause = 'pause',
    Resume = 'resume',
    MotionPaused = 'motion paused',
    MotionResumed = 'motion resumed',
    PausedOrResumeRequest = 'pause or resume request',
    Lap = 'lap',
    Segment = 'segment',
    Marker = 'marker',
  }

  export type HKWorkoutEventType = {
    endDate: string
    startDate: string
    eventTypeInt: number
    eventType: EventType
  }

  enum GenericAggregatorsType {
    MIN = 0,
    MAX = 1,
    FIRST = 4,
    LAST = 5,
  }

  enum AverageAggregatorsType {
    AVERAGE = 2,
    DAILY_AVERAGE = 6,
  }

  enum CumulativeAggregatorsType {
    CUMULATIVE_SUM = 3,
  }

  export type HealthStatisticsCommonAggregatorType =
    | GenericAggregatorsType
    | AverageAggregatorsType
    | CumulativeAggregatorsType

  export type HealthStatisticsStepsAggregatorType =
    | GenericAggregatorsType
    | CumulativeAggregatorsType

  export enum HealthStatisticsIntervalType {
    MONTH = 0,
    DAY = 1,
  }

  export interface HealthStatisticsCommonInputOptions
    extends HealthUnitOptions {
    aggregator: HealthStatisticsCommonAggregatorType
    interval?: HealthStatisticsIntervalType
    startDate?: string
    endDate?: string
    source?: string
  }

  export interface HealthStatisticsStepsInputOptions extends HealthUnitOptions {
    aggregator: HealthStatisticsStepsAggregatorType
    interval?: HealthStatisticsIntervalType
    startDate?: string
    endDate?: string
  }

  export interface HealthStatisticsCumulativeInputOptions
    extends HealthUnitOptions {
    aggregator: CumulativeAggregatorsType
    interval?: HealthStatisticsIntervalType
    startDate: string
    endDate: string
  }

  export type StatisticKey =
    | 'stepCount'
    | 'distanceWalkingRunning'
    | 'basalEnergyBurned'
    | 'activeEnergyBurned'
    | 'heartRate'
    | 'height'
    | 'bodyMassIndex'
    | 'basalBodyTemperature'
    | 'restingHeartRate'
    | 'oxygenSaturation'
    | 'bodyTemperature'
    | 'bloodPressureDiastolic'
    | 'bloodPressureSystolic'
    | 'bloodGlucose'
    | 'runningGroundContactTime'
    | 'runningPower'
    | 'runningSpeed'
    | 'runningStrideLength'
    | 'runningVerticalOscillation'
    | 'distanceCycling'
    | 'pushCount'
    | 'distanceWheelchair'
    | 'swimmingStrokeCount'
    | 'distanceSwimming'
    | 'distanceDownhillSnowSports'
    | 'flightsClimbed'
    | 'nikeFuel'
    | 'appleExerciseTime'
    | 'appleMoveTime'
    | 'appleStandTime'
    | 'vo2Max'
    | 'bodyMass'
    | 'leanBodyMass'
    | 'bodyFatPercentage'
    | 'waistCircumference'
    | 'appleSleepingWristTemperature'
    | 'environmentalAudioExposure'
    | 'headphoneAudioExposure'
    | 'walkingHeartRateAverage'
    | 'heartRateVariabilitySDNN'
    | 'heartRateRecoveryOneMinute'
    | 'atrialFibrillationBurden'
    | 'respiratoryRate'
    | 'electrodermalActivity'
    | 'forcedExpiratoryVolume1'
    | 'forcedVitalCapacity'
    | 'inhalerUsage'
    | 'insulinDelivery'
    | 'numberOfTimesFallen'
    | 'peakExpiratoryFlowRate'
    | 'peripheralPerfusionIndex'
    | 'dietaryBiotin'
    | 'dietaryCaffeine'
    | 'dietaryCalcium'
    | 'dietaryCarbohydrates'
    | 'dietaryChloride'
    | 'dietaryCholesterol'
    | 'dietaryChromium'
    | 'dietaryCopper'
    | 'dietaryEnergyConsumed'
    | 'dietaryFatMonounsaturated'
    | 'dietaryFatPolyunsaturated'
    | 'dietaryFatSaturated'
    | 'dietaryFatTotal'
    | 'dietaryFiber'
    | 'dietaryFolate'
    | 'dietaryIodine'
    | 'dietaryIron'
    | 'dietaryMagnesium'
    | 'dietaryManganese'
    | 'dietaryMolybdenum'
    | 'dietaryNiacin'
    | 'dietaryPantothenicAcid'
    | 'dietaryPhosphorus'
    | 'dietaryPotassium'
    | 'dietaryProtein'
    | 'dietaryRiboflavin'
    | 'dietarySelenium'
    | 'dietarySodium'
    | 'dietarySugar'
    | 'dietaryThiamin'
    | 'dietaryVitaminA'
    | 'dietaryVitaminB12'
    | 'dietaryVitaminB6'
    | 'dietaryVitaminC'
    | 'dietaryVitaminD'
    | 'dietaryVitaminE'
    | 'dietaryVitaminK'
    | 'dietaryWater'
    | 'dietaryZinc'
    | 'bloodAlcoholContent'
    | 'numberOfAlcoholicBeverages'
    | 'appleWalkingSteadiness'
    | 'sixMinuteWalkTestDistance'
    | 'walkingSpeed'
    | 'walkingStepLength'
    | 'walkingAsymmetryPercentage'
    | 'walkingDoubleSupportPercentage'
    | 'stairAscentSpeed'
    | 'stairDescentSpeed'
    | 'uvExposure'
    | 'underwaterDepth'
    | 'waterTemperature'
    | 'abdominalCramps'
    | 'bloating'
    | 'constipation'
    | 'diarrhea'
    | 'heartburn'
    | 'nausea'
    | 'vomiting'
    | 'appetiteChanges'
    | 'chills'
    | 'dizziness'
    | 'fainting'
    | 'fatigue'
    | 'fever'
    | 'generalizedBodyAche'
    | 'hotFlashes'
    | 'chestTightnessOrPain'
    | 'coughing'
    | 'rapidPoundingOrFlutteringHeartbeat'
    | 'shortnessOfBreath'
    | 'skippedHeartbeat'
    | 'wheezing'
    | 'lowerBackPain'
    | 'headache'
    | 'memoryLapse'
    | 'moodChanges'
    | 'lossOfSmell'
    | 'lossOfTaste'
    | 'runnyNose'
    | 'soreThroat'
    | 'sinusCongestion'
    | 'breastPain'
    | 'pelvicPain'
    | 'vaginalDryness'
    | 'acne'
    | 'drySkin'
    | 'hairLoss'
    | 'nightSweats'
    | 'sleepChanges'
    | 'bladderIncontinence'
    | 'menstrualFlow'
    | 'intermenstrualBleeding'
    | 'infrequentMenstrualCycles'
    | 'irregularMenstrualCycles'
    | 'persistentIntermenstrualBleeding'
    | 'prolongedMenstrualPeriods'
    | 'cervicalMucusQuality'
    | 'ovulationTestResult'
    | 'progesteroneTestResult'
    | 'sexualActivity'
    | 'contraceptive'
    | 'pregnancy'
    | 'pregnancyTestResult'
    | 'lactation'

  export interface HealthMedianStatisticsInputOptions {
    types: StatisticKey[] | readonly StatisticKey[]
  }

  export interface HKWorkoutQueriedSampleType {
    activityId: number
    activityName: string
    calories: number
    device: string
    id: string
    tracked: boolean
    metadata: any
    sourceName: string
    sourceId: string
    distance: number
    start: string
    end: string
  }

  export interface ElectrocardiogramSampleValue extends BaseValue {
    classification: ElectrocardiogramClassification
    averageHeartRate: number
    samplingFrequency: number
    device: string
    algorithmVersion: number
    voltageMeasurements: number[][]
  }

  export interface HealthValueOptions extends HealthUnitOptions {
    value: number
    startDate?: string
    endDate?: string
    metadata?: RecordMetadata
  }

  export interface HealthActivityOptions
    extends Omit<Omit<HealthValueOptions, 'unit'>, 'value'> {
    type: HealthActivity
  }

  export interface HealthObserverOptions {
    type: HealthObserver
  }

  export interface HealthActivitySummary {
    activeEnergyBurned: number
    activeEnergyBurnedGoal: number
    appleExerciseTime: number
    appleExerciseTimeGoal: number
    appleStandHours: number
    appleStandHoursGoal: number
  }

  export interface HealthClinicalRecordOptions {
    startDate: string
    endDate?: string
    limit?: number
    ascending?: boolean
    type: ClinicalRecordType
  }

  export enum ClinicalRecordType {
    AllergyRecord = 'AllergyRecord',
    ConditionRecord = 'ConditionRecord',
    CoverageRecord = 'CoverageRecord',
    ImmunizationRecord = 'ImmunizationRecord',
    LabResultRecord = 'LabResultRecord',
    MedicationRecord = 'MedicationRecord',
    ProcedureRecord = 'ProcedureRecord',
    VitalSignRecord = 'VitalSignRecord',
  }

  export interface HealthClinicalRecord extends BaseValue {
    sourceName: string
    sourceId: string
    displayName: string
    fhirData: any
  }

  /* Health Constants */

  export enum HealthActivity {
    AmericanFootball = 'AmericanFootball',
    Archery = 'Archery',
    AustralianFootball = 'AustralianFootball',
    Badminton = 'Badminton',
    Baseball = 'Baseball',
    Basketball = 'Basketball',
    Bowling = 'Bowling',
    Boxing = 'Boxing',
    CardioDance = 'CardioDance',
    Climbing = 'Climbing',
    Cooldown = 'Cooldown',
    Cricket = 'Cricket',
    CrossTraining = 'CrossTraining',
    Curling = 'Curling',
    Cycling = 'Cycling',
    Dance = 'Dance',
    DiscSports = 'DiscSports',
    Elliptical = 'Elliptical',
    EquestrianSports = 'EquestrianSports',
    Fencing = 'Fencing',
    FitnessGaming = 'FitnessGaming',
    Fishing = 'Fishing',
    FunctionalStrengthTraining = 'FunctionalStrengthTraining',
    Golf = 'Golf',
    Gymnastics = 'Gymnastics',
    Handball = 'Handball',
    Hiking = 'Hiking',
    Hockey = 'Hockey',
    Hunting = 'Hunting',
    Lacrosse = 'Lacrosse',
    MartialArts = 'MartialArts',
    MindAndBody = 'MindAndBody',
    PaddleSports = 'PaddleSports',
    Play = 'Play',
    Pickleball = 'Pickleball',
    PreparationAndRecovery = 'PreparationAndRecovery',
    Racquetball = 'Racquetball',
    Rowing = 'Rowing',
    Rugby = 'Rugby',
    Running = 'Running',
    Sailing = 'Sailing',
    SkatingSports = 'SkatingSports',
    SnowSports = 'SnowSports',
    Soccer = 'Soccer',
    SocialDance = 'SocialDance',
    Softball = 'Softball',
    Squash = 'Squash',
    StairClimbing = 'StairClimbing',
    SurfingSports = 'SurfingSports',
    Swimming = 'Swimming',
    TableTennis = 'TableTennis',
    Tennis = 'Tennis',
    TrackAndField = 'TrackAndField',
    TraditionalStrengthTraining = 'TraditionalStrengthTraining',
    Volleyball = 'Volleyball',
    Walking = 'Walking',
    WaterFitness = 'WaterFitness',
    WaterPolo = 'WaterPolo',
    WaterSports = 'WaterSports',
    Wrestling = 'Wrestling',
    Yoga = 'Yoga',
    Barre = 'Barre',
    CoreTraining = 'CoreTraining',
    CrossCountrySkiing = 'CrossCountrySkiing',
    DownhillSkiing = 'DownhillSkiing',
    Flexibility = 'Flexibility',
    HighIntensityIntervalTraining = 'HighIntensityIntervalTraining',
    JumpRope = 'JumpRope',
    Kickboxing = 'Kickboxing',
    Pilates = 'Pilates',
    Snowboarding = 'Snowboarding',
    Stairs = 'Stairs',
    StepTraining = 'StepTraining',
    WheelchairWalkPace = 'WheelchairWalkPace',
    WheelchairRunPace = 'WheelchairRunPace',
    TaiChi = 'TaiChi',
    MixedCardio = 'MixedCardio',
    HandCycling = 'HandCycling',
  }

  export enum HealthPermission {
    ActiveEnergyBurned = 'ActiveEnergyBurned',
    ActivitySummary = 'ActivitySummary',
    AllergyRecord = 'AllergyRecord',
    AppleExerciseTime = 'AppleExerciseTime',
    AppleMoveTime = 'AppleMoveTime',
    AppleSleepingWristTemperature = 'AppleSleepingWristTemperature',
    AppleStandHour = 'AppleStandHour',
    AppleStandTime = 'AppleStandTime',
    AppleWalkingSteadiness = 'AppleWalkingSteadiness',
    AppleWalkingSteadinessEvent = 'AppleWalkingSteadinessEvent',
    AtrialFibrillationBurden = 'AtrialFibrillationBurden',
    BasalBodyTemperature = 'BasalBodyTemperature',
    BasalEnergyBurned = 'BasalEnergyBurned',
    BiologicalSex = 'BiologicalSex',
    BloodType = 'BloodType',
    BloodAlcoholContent = 'BloodAlcoholContent',
    BloodGlucose = 'BloodGlucose',
    BloodPressureDiastolic = 'BloodPressureDiastolic',
    BloodPressureSystolic = 'BloodPressureSystolic',
    BodyFatPercentage = 'BodyFatPercentage',
    BodyMass = 'BodyMass',
    BodyMassIndex = 'BodyMassIndex',
    BodyTemperature = 'BodyTemperature',
    DateOfBirth = 'DateOfBirth',
    Biotin = 'Biotin',
    Caffeine = 'Caffeine',
    Calcium = 'Calcium',
    Carbohydrates = 'Carbohydrates',
    CervicalMucusQuality = 'CervicalMucusQuality',
    Chloride = 'Chloride',
    Cholesterol = 'Cholesterol',
    Chromium = 'Chromium',
    Contraceptive = 'Contraceptive',
    ConditionRecord = 'ConditionRecord',
    Copper = 'Copper',
    CoverageRecord = 'CoverageRecord',
    DistanceWheelchair = 'DistanceWheelchair',
    ElectrodermalActivity = 'ElectrodermalActivity',
    EnergyConsumed = 'EnergyConsumed',
    EnvironmentalAudioExposure = 'EnvironmentalAudioExposure',
    FatMonounsaturated = 'FatMonounsaturated',
    FatPolyunsaturated = 'FatPolyunsaturated',
    FatSaturated = 'FatSaturated',
    FatTotal = 'FatTotal',
    Fiber = 'Fiber',
    Folate = 'Folate',
    ForcedExpiratoryVolume1 = 'ForcedExpiratoryVolume1',
    ForcedVitalCapacity = 'ForcedVitalCapacity',
    HeadphoneAudioExposure = 'HeadphoneAudioExposure',
    HeartRateRecoveryOneMinute = 'HeartRateRecoveryOneMinute',
    ImmunizationRecord = 'ImmunizationRecord',
    InhalerUsage = 'InhalerUsage',
    InsulinDelivery = 'InsulinDelivery',
    IntermenstrualBleeding = 'IntermenstrualBleeding',
    Iodine = 'Iodine',
    Iron = 'Iron',
    LabResultRecord = 'LabResultRecord',
    Lactation = 'Lactation',
    LowCardioFitnessEvent = 'LowCardioFitnessEvent',
    Magnesium = 'Magnesium',
    Manganese = 'Manganese',
    MedicationRecord = 'MedicationRecord',
    MenstrualFlow = 'MenstrualFlow',
    Molybdenum = 'Molybdenum',
    Niacin = 'Niacin',
    NumberOfAlcoholicBeverages = 'NumberOfAlcoholicBeverages',
    NumberOfTimesFallen = 'NumberOfTimesFallen',
    OvulationTestResult = 'OvulationTestResult',
    OxygenSaturation = 'OxygenSaturation',
    PantothenicAcid = 'PantothenicAcid',
    PeakExpiratoryFlowRate = 'PeakExpiratoryFlowRate',
    PeripheralPerfusionIndex = 'PeripheralPerfusionIndex',
    Phosphorus = 'Phosphorus',
    Potassium = 'Potassium',
    Pregnancy = 'Pregnancy',
    PregnancyTestResult = 'PregnancyTestResult',
    ProcedureRecord = 'ProcedureRecord',
    ProgesteroneTestResult = 'ProgesteroneTestResult',
    Protein = 'Protein',
    Riboflavin = 'Riboflavin',
    Selenium = 'Selenium',
    SexualActivity = 'SexualActivity',
    SixMinuteWalkTestDistance = 'SixMinuteWalkTestDistance',
    Sodium = 'Sodium',
    Sugar = 'Sugar',
    Thiamin = 'Thiamin',
    VitalSignRecord = 'VitalSignRecord',
    VitaminA = 'VitaminA',
    VitaminB12 = 'VitaminB12',
    VitaminB6 = 'VitaminB6',
    VitaminC = 'VitaminC',
    VitaminD = 'VitaminD',
    VitaminE = 'VitaminE',
    VitaminK = 'VitaminK',
    Zinc = 'Zinc',
    Water = 'Water',
    DistanceCycling = 'DistanceCycling',
    DistanceSwimming = 'DistanceSwimming',
    DistanceWalkingRunning = 'DistanceWalkingRunning',
    Electrocardiogram = 'Electrocardiogram',
    FlightsClimbed = 'FlightsClimbed',
    HeartbeatSeries = 'HeartbeatSeries',
    HeartRate = 'HeartRate',
    RestingHeartRate = 'RestingHeartRate',
    HeartRateVariability = 'HeartRateVariability',
    Height = 'Height',
    HighHeartRateEvent = 'HighHeartRateEvent',
    IrregularHeartRhythmEvent = 'IrregularHeartRhythmEvent',
    LeanBodyMass = 'LeanBodyMass',
    LowHeartRateEvent = 'LowHeartRateEvent',
    MindfulSession = 'MindfulSession',
    NikeFuel = 'NikeFuel',
    PeakFlow = 'PeakFlow',
    RespiratoryRate = 'RespiratoryRate',
    SleepAnalysis = 'SleepAnalysis',
    StepCount = 'StepCount',
    Steps = 'Steps',
    UvExposure = 'UvExposure',
    Vo2Max = 'Vo2Max',
    WaistCircumference = 'WaistCircumference',
    WalkingHeartRateAverage = 'WalkingHeartRateAverage',
    Weight = 'Weight',
    Workout = 'Workout',
    WorkoutRoute = 'WorkoutRoute',
    RunningSpeed = 'RunningSpeed',
    RunningPower = 'RunningPower',
    RunningStrideLength = 'RunningStrideLength',
    RunningVerticalOscillation = 'RunningVerticalOscillation',
    RunningGroundContactTime = 'RunningGroundContactTime',

    // Symptoms
    AbdominalCramps = 'AbdominalCramps',
    Bloating = 'Bloating',
    Constipation = 'Constipation',
    Diarrhea = 'Diarrhea',
    Heartburn = 'Heartburn',
    Nausea = 'Nausea',
    Vomiting = 'Vomiting',
    AppetiteChanges = 'AppetiteChanges',
    Chills = 'Chills',
    Dizziness = 'Dizziness',
    Fainting = 'Fainting',
    Fatigue = 'Fatigue',
    Fever = 'Fever',
    GeneralizedBodyAche = 'GeneralizedBodyAche',
    HotFlashes = 'HotFlashes',
    ChestTightnessOrPain = 'ChestTightnessOrPain',
    Coughing = 'Coughing',
    RapidPoundingOrFlutteringHeartbeat = 'RapidPoundingOrFlutteringHeartbeat',
    ShortnessOfBreath = 'ShortnessOfBreath',
    SkippedHeartbeat = 'SkippedHeartbeat',
    Wheezing = 'Wheezing',
    LowerBackPain = 'LowerBackPain',
    Headache = 'Headache',
    MemoryLapse = 'MemoryLapse',
    MoodChanges = 'MoodChanges',
    LossOfSmell = 'LossOfSmell',
    LossOfTaste = 'LossOfTaste',
    RunnyNose = 'RunnyNose',
    SoreThroat = 'SoreThroat',
    SinusCongestion = 'SinusCongestion',
    BreastPain = 'BreastPain',
    PelvicPain = 'PelvicPain',
    VaginalDryness = 'VaginalDryness',
    Acne = 'Acne',
    DrySkin = 'DrySkin',
    HairLoss = 'HairLoss',
    NightSweats = 'NightSweats',
    SleepChanges = 'SleepChanges',
    BladderIncontinence = 'BladderIncontinence',

    InfrequentMenstrualCycles = 'InfrequentMenstrualCycles',
    IrregularMenstrualCycles = 'IrregularMenstrualCycles',
    PersistentIntermenstrualBleeding = 'PersistentIntermenstrualBleeding',
    ProlongedMenstrualPeriods = 'ProlongedMenstrualPeriods',
  }

  export enum HealthUnit {
    bpm = 'bpm',
    calorie = 'calorie',
    celsius = 'celsius',
    count = 'count',
    day = 'day',
    fahrenheit = 'fahrenheit',
    foot = 'foot',
    gram = 'gram',
    hour = 'hour',
    inch = 'inch',
    joule = 'joule',
    kilocalorie = 'kilocalorie',
    meter = 'meter',
    mgPerdL = 'mgPerdL',
    mile = 'mile',
    minute = 'minute',
    mmhg = 'mmhg',
    literPerMinute = 'literPerMinute',
    mmolPerL = 'mmolPerL',
    percent = 'percent',
    pound = 'pound',
    second = 'second',
  }

  export enum HealthStatusCode {
    NotDetermined = 0,
    SharingDenied = 1,
    SharingAuthorized = 2,
  }

  export interface HealthStatusResult {
    permissions: {
      read: HealthStatusCode[]
      write: HealthStatusCode[]
    }
  }

  export interface AnchoredQueryResults {
    anchor: string
    data: Array<HKWorkoutQueriedSampleType>
  }

  export interface WorkoutRouteQueryResults {
    anchor: string
    data: HKWorkoutRouteSampleType
  }

  export enum HealthObserver {
    AllergyRecord = 'AllergyRecord',
    ConditionRecord = 'ConditionRecord',
    CoverageRecord = 'CoverageRecord',
    Cycling = 'Cycling',
    HeartRate = 'HeartRate',
    ImmunizationRecord = 'ImmunizationRecord',
    LabResultRecord = 'LabResultRecord',
    MedicationRecord = 'MedicationRecord',
    ProcedureRecord = 'ProcedureRecord',
    RestingHeartRate = 'RestingHeartRate',
    Running = 'Running',
    StairClimbing = 'StairClimbing',
    VitalSignRecord = 'VitalSignRecord',
    Walking = 'Walking',
    Workout = 'Workout',
  }

  export enum ElectrocardiogramClassification {
    NotSet = 'NotSet',
    SinusRhythm = 'SinusRhythm',
    AtrialFibrillation = 'AtrialFibrillation',
    InconclusiveLowHeartRate = 'InconclusiveLowHeartRate',
    InconclusiveHighHeartRate = 'InconclusiveHighHeartRate',
    InconclusivePoorReading = 'InconclusivePoorReading',
    InconclusiveOther = 'InconclusiveOther',
    Unrecognized = 'Unrecognized',
  }

  export enum BloodGlucoseMealTime {
    Preprandial = 1,
    Postprandial = 2,
  }

  export enum InsulinDeliveryReason {
    Basal = 1,
    Bolus = 2,
  }

  const appleHealthKit: AppleHealthKit

  export default appleHealthKit
}
