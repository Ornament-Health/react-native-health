# hasSymptom

Check whether HealthKit holds a sample of a symptom type that [saveSymptom](saveSymptom.md) wrote with the given `syncIdentifier`.

The app needs no read permission for this: once a type was asked for, HealthKit returns the app its own samples. A type that was never asked for cannot hold the app's samples, so it is read as having none instead of failing the call.

Example input options:

```javascript
let options = {
  type: 'headache',
  syncIdentifier: 'a3c1e7f2-4b6d-4e19-8c0a-5d2f9b7e1c34',
}
```

Call the method:

```javascript
AppleHealthKit.hasSymptom(options, (err: string, result: boolean) => {
  if (err) {
    console.log('Error looking up the symptom in HealthKit: ', err)
    return
  }
  console.log(result)
})
```

Example output:

```json
true
```
