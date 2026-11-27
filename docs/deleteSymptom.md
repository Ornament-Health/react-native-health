# deleteSymptom

Delete the samples of a symptom type that [saveSymptom](saveSymptom.md) wrote with the given `syncIdentifier`. HealthKit only deletes samples the app saved itself.

- `count` is the number of deleted samples. A symptom with no sample is not an error: `count` is 0.
- Without write permission for the type nothing is deleted and the result is `{ "status": "denied" }`.
- HealthKit has no versioned delete. Wait for the symptom's earlier calls to finish, and never save an older version of it after deleting it, or the symptom comes back.

Example input options:

```javascript
let options = {
  type: 'headache',
  syncIdentifier: 'a3c1e7f2-4b6d-4e19-8c0a-5d2f9b7e1c34',
}
```

Call the method:

```javascript
AppleHealthKit.deleteSymptom(options, (err: string, result: SymptomDeleteResult) => {
  if (err) {
    console.log('Error deleting the symptom from HealthKit: ', err)
    return
  }
  console.log(result)
})
```

Example output:

```json
{
  "status": "deleted",
  "count": 1
}
```
