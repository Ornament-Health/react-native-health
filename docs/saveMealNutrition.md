# saveMealNutrition

Save a meal's energy and macros to HealthKit as up to five samples, one per type, in one `saveObjects` call.

| Type | Unit |
|---|---|
| `EnergyConsumed` | kcal |
| `Protein` | g |
| `FatTotal` | g |
| `Carbohydrates` | g |
| `Fiber` | g |

Every sample carries the meal's id under the `OrnamentMealUUID` metadata key, `HKMetadataKeySyncIdentifier` `<mealUUID>:<Type>` and `HKMetadataKeySyncVersion` `version`. A later save of the same meal therefore replaces its samples instead of adding new ones, as long as its `version` is equal or higher. A save with a lower version is dropped by HealthKit without an error, and `written` still lists its types.

- A type left out of `values`, or sent as `null`, keeps whatever the meal already has in HealthKit.
- A zero is saved as a 0 sample, so it replaces the previous value under the same version rule. It is not a delete: a HealthKit delete ignores the version, so a late call could remove a newer value.
- A type without write permission is skipped and listed in `denied`.
- Invalid input fails the whole call before anything is written: an empty `mealUUID`, a `version` that is not a whole number from 0 to 2^53 - 1, a missing `date`, or a value that is negative or not a finite number.

Request the write permissions first with `initHealthKit` (`EnergyConsumed`, `Protein`, `FatTotal`, `Carbohydrates`, `Fiber` in `permissions.write`).

Example input options:

```javascript
let options = {
  mealUUID: '6f1c2b0e-4f5a-4b8e-9a51-2d0c8e7b3f10',
  version: Date.now(), // grows with every save of the meal
  date: new Date(2026, 10, 23, 13, 0).toISOString(), // time the meal was eaten
  values: {
    EnergyConsumed: 520, // kcal
    Protein: 32, // g
    FatTotal: 18,
    Carbohydrates: 54,
    Fiber: 0, // saved as a 0 sample
  },
}
```

Call the method:

```javascript
AppleHealthKit.saveMealNutrition(options, (err: string, result: MealNutritionSaveResult) => {
  if (err) {
    console.log('Error saving the meal to HealthKit: ', err)
    return
  }
  console.log(result)
})
```

Example output:

```json
{
  "written": ["EnergyConsumed", "Protein", "FatTotal", "Carbohydrates", "Fiber"],
  "denied": []
}
```

See also [deleteMealNutrition](deleteMealNutrition.md) and [hasMealNutrition](hasMealNutrition.md).
