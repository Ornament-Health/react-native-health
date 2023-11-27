# Methods list

Query statistic (aggregated) biomarkers.

|Value|Methods|
|---|---|
|bodyMass (вес)|getStatisticBodyMass|
|bloodPressureSystolic (систолическое давление)|getStatisticBloodPressureSystolic|
|bloodPressureDiastolic (диастолическое давление)|getStatisticBloodPressureDiastolic|
|bloodGlucose (глюкоза в крови)|getStatisticBloodGlucose|
|bodyMassIndex (индекс массы тела)|getStatisticBodyMassIndex|
|height (рост)|getStatisticHeight|
|stepCount (количество шагов)|getStatisticStepCount|
|heartRate (пульс)|getStatisticHeartRate|
|bodyTemperature (температура тела)|getStatisticBodyTemperature|
|oxygenSaturation (насыщение кислородом)|getStatisticOxygenSaturation|
|restingHeartRate (пульс в покое)|getStatisticRestingHeartRate|
|Dietary| |
|Macronutrients| |
|EnergyConsumed|getStatisticDietaryEnergyConsumed|
|Carbohydrates|geStatisticDietaryCarbohydrates|
|Fiber|getStatisticDietaryFiber|
|Sugar|getStatisticDietarySugar|
|TotalFat|getStatisticDietaryTotalFat|
|FatMonounsaturated|getStatisticDietaryFatMonounsaturated|
|FatPolyunsaturated|getStatisticDietaryFatPolyunsaturated|
|FatSaturated|getStatisticDietaryFatSaturated|
|Cholesterol|getStatisticDietaryCholesterol|
|Protein|getStatisticDietaryProtein|
|Vitamins| |
|VitaminA|getStatisticDietaryVitaminA|
|Thiamin|getStatisticDietaryThiamin|
|Riboflavin|getStatisticDietaryRiboflavin|
|Niacin|getStatisticDietaryNiacin|
|PantothenicAcid|getStatisticDietaryPantothenicAcid|
|VitaminB6|getStatisticDietaryVitaminB6|
|Biotin|getStatisticDietaryBiotin|
|VitaminB12|getStatisticDietaryVitaminB12|
|VitaminC|getStatisticDietaryVitaminC|
|VitaminD|getStatisticDietaryVitaminD|
|VitaminE|getStatisticDietaryVitaminE|
|VitaminK|getStatisticDietaryVitaminK|
|Folate|getStatisticDietaryFolate|
|Minerals| |
|Calcium|getStatisticDietaryCalcium|
|Chloride|getStatisticDietaryChloride|
|Iron|getStatisticDietaryIron|
|Magnesium|getStatisticDietaryMagnesium|
|Phosphorus|getStatisticDietaryPhosphorus|
|Potassium|getStatisticDietaryPotassium|
|Sodium|getStatisticDietarySodium|
|Zinc|getStatisticDietaryZinc|
|Hydration| |
|Water|getStatisticDietaryWater|
|Caffeination| |
|Caffeine|getStatisticDietaryCaffeine|
|Ultratrace Minerals| |
|Chromium|getStatisticDietaryChromium|
|Copper|getStatisticDietaryCopper|
|Iodine|getStatisticDietaryIodine|
|Manganese|getStatisticDietaryManganese|
|Molybdenum|getStatisticDietaryMolybdenum|
|Selenium|getStatisticDietarySelenium|
|Lab and Test Results||
|insulinDelivery (подача инсулина)|getStatisticInsulinDelivery|



## Example call

```typescript
let options = {
  aggregator: HealthStatisticsCommonAggregatorType.AVERAGE,
  interval: HealthStatisticsIntervalType.DAY, // optional; default HealthStatisticsIntervalType.MONTH
  unit: 'pound', // optional;
  startDate: new Date(2021, 0, 0).toISOString(), // optional
  endDate: new Date().toISOString(), // optional; default now
}
```
For dietary and insulinDelivery:
```typescript
let options: HealthStatisticsDietaryInputOptions = {
        aggregator: HealthStatisticsDietaryAggregatorType.CUMULATIVE_SUM,
        interval: HealthStatisticsIntervalType.DAY, // optional; default HealthStatisticsIntervalType.MONTH
        unit: 'calorie', // optional
        startDate: new Date(2021, 0, 0).toISOString(),
        endDate: new Date().toISOString(),
      }
```

Method call example:

```typescript
AppleHealthKit.getStatisticBodyMass(
  options,
  (err: Object, results: Array<HealthValue>) => {
    if (err) {
      return
    }
    console.log(results)
  },
)
```


## Request payload

|name|type|required|
|---|---|---|
|aggregator|HealthStatisticsCommonAggregatorType or HealthStatisticsStepsAggregatorType or HealthStatisticsDietaryAggregatorType|✓|
|interval|HealthStatisticsIntervalType||
|unit|string||
|startDate|string|✓|
|endDate|string|✓|

```typescript
enum GenericAggregatorsType {
  MIN = 0,
  MAX = 1,
  FIRST = 4,
  LAST = 5,
}

enum AverageAggregatorsType {
  AVERAGE = 2,
}

enum CumulativeAggregatorsType {
  CUMULATIVE_SUM = 3,
}

export type HealthStatisticsCommonAggregatorType = GenericAggregatorsType | AverageAggregatorsType;

export type HealthStatisticsStepsAggregatorType = GenericAggregatorsType | CumulativeAggregatorsType;

export type HealthStatisticsDietaryAggregatorType = CumulativeAggregatorsType
```

## Response

```json
[
  {
    "value": 160,
    "startDate": "2016-07-09T00:00:00.000-0400",
    "endDate": "2016-07-10T00:00:00.000-0400"
  },
  {
    "value": 161,
    "startDate": "2016-07-08T00:00:00.000-0400",
    "endDate": "2016-07-09T00:00:00.000-0400"
  },
  {
    "value": 165,
    "startDate": "2016-07-07T00:00:00.000-0400",
    "endDate": "2016-07-08T00:00:00.000-0400"
  }
]
```
