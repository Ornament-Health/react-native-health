# saveSymptom

Save one symptom to HealthKit as an `HKCategorySample`.

`type` is a HealthKit symptom identifier without the `HKCategoryTypeIdentifier` prefix, in lower camel case: `headache`, `appetiteChanges`, `rapidPoundingOrFlutteringHeartbeat` and the other symptom types listed in [getAnchoredSymptoms](getAnchoredSymptoms.md).

`value` is the raw category value, as HealthKit defines it for the type:

| Types | Values |
|---|---|
| Most symptoms (`HKCategoryValueSeverity`) | 0 unspecified (present), 1 not present, 2 mild, 3 moderate, 4 severe |
| `appetiteChanges` (`HKCategoryValueAppetiteChanges`) | 0 unspecified, 1 no change, 2 decreased, 3 increased |
| `moodChanges`, `sleepChanges` (`HKCategoryValuePresence`) | 0 present, 1 not present |

The sample carries `HKMetadataKeySyncIdentifier` `syncIdentifier` and `HKMetadataKeySyncVersion` `version`. A later save with the same `syncIdentifier` and an equal or higher `version` replaces the sample: HealthKit deletes the old one, so [getAnchoredSymptoms](getAnchoredSymptoms.md) reports its UUID in `deletedIds` and returns the new sample. A save with a lower version is dropped by HealthKit without an error: the result still says `saved`, with the id of a sample HealthKit did not keep.

- `metadata` adds string and number values to the sample. Keys starting with `HK` are HealthKit's own and are left out; the sync keys are always the ones above.
- Without write permission for the type nothing is saved and the result is `{ "status": "denied" }`.
- Invalid input fails the call before anything is written: an unknown `type`, an empty `syncIdentifier`, a `version` that is not a whole number from 0 to 2^53 - 1, a `value` outside the type's values in the table above, a missing date or an `endDate` before `startDate`.

Request the write permission first with `initHealthKit` (for example `Headache` in `permissions.write`).

Example input options:

```javascript
let options = {
  type: 'headache',
  syncIdentifier: 'a3c1e7f2-4b6d-4e19-8c0a-5d2f9b7e1c34', // the app's id of the entry
  version: Date.now(), // grows with every save of the entry
  value: 3, // moderate
  startDate: new Date(2026, 10, 27, 9, 0).toISOString(),
  endDate: new Date(2026, 10, 27, 10, 30).toISOString(),
  metadata: { Severity: 3 }, // optional
}
```

Call the method:

```javascript
AppleHealthKit.saveSymptom(options, (err: string, result: SymptomSaveResult) => {
  if (err) {
    console.log('Error saving the symptom to HealthKit: ', err)
    return
  }
  console.log(result)
})
```

Example output:

```json
{
  "status": "saved",
  "id": "D1E5A3C2-7F44-4B19-8A0D-6C2E91B3F5A7"
}
```

See also [deleteSymptom](deleteSymptom.md) and [hasSymptom](hasSymptom.md).
