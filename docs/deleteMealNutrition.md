# deleteMealNutrition

Delete the samples that [saveMealNutrition](saveMealNutrition.md) wrote for a meal. The samples are found by the meal's id in the `OrnamentMealUUID` metadata key, for each of the five types the app may write.

- `deleted` lists the types that had samples. A meal with no samples is not an error: both lists can be empty.
- A type without write permission is skipped and listed in `denied`; its sample, if any, stays in HealthKit.
- HealthKit has no versioned delete. Wait for the meal's earlier calls to finish, and never save an older version of the meal after deleting it, or the meal comes back.

Example input options:

```javascript
let options = {
  mealUUID: '6f1c2b0e-4f5a-4b8e-9a51-2d0c8e7b3f10',
}
```

Call the method:

```javascript
AppleHealthKit.deleteMealNutrition(options, (err: string, result: MealNutritionDeleteResult) => {
  if (err) {
    console.log('Error deleting the meal from HealthKit: ', err)
    return
  }
  console.log(result)
})
```

Example output:

```json
{
  "deleted": ["EnergyConsumed", "Protein", "FatTotal", "Carbohydrates"],
  "denied": []
}
```
