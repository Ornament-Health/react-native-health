# getAnchoredSymptoms

Read symptom samples with an `HKAnchoredObjectQuery` per type: the first call returns everything from `startDate`, later calls with the returned anchors return only the samples added and the UUIDs deleted since.

Types are HealthKit symptom identifiers without the `HKCategoryTypeIdentifier` prefix, in lower camel case:

`abdominalCramps`, `acne`, `appetiteChanges`, `bladderIncontinence`, `bloating`, `breastPain`, `chestTightnessOrPain`, `chills`, `constipation`, `coughing`, `diarrhea`, `dizziness`, `drySkin`, `fainting`, `fatigue`, `fever`, `generalizedBodyAche`, `hairLoss`, `headache`, `heartburn`, `hotFlashes`, `lossOfSmell`, `lossOfTaste`, `lowerBackPain`, `memoryLapse`, `moodChanges`, `nausea`, `nightSweats`, `pelvicPain`, `rapidPoundingOrFlutteringHeartbeat`, `runnyNose`, `shortnessOfBreath`, `sinusCongestion`, `skippedHeartbeat`, `sleepChanges`, `soreThroat`, `vaginalDryness`, `vomiting`, `wheezing`.

- The result is keyed by type. Each type has its own `anchor`; store it and pass it back in `anchors` to continue from there. An anchor is opaque: keep it as is.
- `samples` holds new and changed samples with the raw category `value` (see [saveSymptom](saveSymptom.md) for the values), the source and the sample metadata. A sample replaced through its sync identifier comes back as a new sample, and its old UUID is in `deletedIds`.
- `deletedIds` lists the UUIDs of samples deleted in HealthKit since the anchor. The first call, without an anchor, returns none.
- A type that fails, for example an unknown name, comes back as `{ "error": "..." }` without failing the other types. Without read permission HealthKit returns no samples rather than an error.
- `startDate` is required: samples that start before it are not returned.

Request the read permissions first with `initHealthKit` (for example `Headache` in `permissions.read`).

Example input options:

```javascript
let options = {
  types: ['headache', 'appetiteChanges'],
  anchors: { headache: 'YnBsaXN0MDDUAQIDBAUG...' }, // from the previous call; optional
  startDate: new Date(2026, 9, 28).toISOString(),
}
```

Call the method:

```javascript
AppleHealthKit.getAnchoredSymptoms(options, (err: string, results: AnchoredSymptomsResults) => {
  if (err) {
    console.log('Error reading symptoms from HealthKit: ', err)
    return
  }
  console.log(results)
})
```

Example output:

```json
{
  "headache": {
    "anchor": "YnBsaXN0MDDUAQIDBAUG...",
    "samples": [
      {
        "id": "D1E5A3C2-7F44-4B19-8A0D-6C2E91B3F5A7",
        "value": 4,
        "startDate": "2026-11-27T09:00:00.000+0100",
        "endDate": "2026-11-27T10:30:00.000+0100",
        "sourceName": "Health",
        "sourceId": "com.apple.Health",
        "wasUserEntered": true,
        "metadata": { "HKWasUserEntered": 1 }
      }
    ],
    "deletedIds": ["5A2C9E14-8B3F-4D61-A7E0-1F9C3B5D7E28"]
  },
  "appetiteChanges": {
    "anchor": "YnBsaXN0MDDUAQIDBAUG...",
    "samples": [],
    "deletedIds": []
  }
}
```
