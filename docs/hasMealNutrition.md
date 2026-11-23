# hasMealNutrition

Check whether HealthKit holds any sample that [saveMealNutrition](saveMealNutrition.md) wrote for a meal, found by the meal's id in the `OrnamentMealUUID` metadata key.

The app needs no read permission for this: once a type was asked for, HealthKit returns the app its own samples. A type that was never asked for cannot hold the app's samples, so it is read as having none instead of failing the call.

Example input options:

```javascript
let options = {
  mealUUID: '6f1c2b0e-4f5a-4b8e-9a51-2d0c8e7b3f10',
}
```

Call the method:

```javascript
AppleHealthKit.hasMealNutrition(options, (err: string, result: boolean) => {
  if (err) {
    console.log('Error looking up the meal in HealthKit: ', err)
    return
  }
  console.log(result)
})
```

Example output:

```json
true
```
