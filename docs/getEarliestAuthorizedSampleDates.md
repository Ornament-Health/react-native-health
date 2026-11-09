# getEarliestAuthorizedSampleDates

Since iOS 27 the HealthKit permission sheet asks how much history to share: "Past 30 Days and Future Data" or "All Recorded Data and Future Data". With the 30-day choice HealthKit keeps, per data type, the date of the earliest sample the app can read: the moment access was granted minus 30 days. The date does not move afterwards, so the readable history grows from it.

The method reports those dates for the read permissions passed in. It wraps `-[HKHealthStore getEarliestAuthorizedSampleDateForTypes:completion:]`.

Result, from index.d.ts:

```typescript
export interface HealthEarliestAuthorizedSampleDates {
  supported: boolean
  dates: Partial<Record<HealthPermission, string>>
}
```

- `supported` is `false` before iOS 27: there is no choice there, every app reads the whole history.
- `dates` lists only the permissions with limited history. A type shared with its whole history and a type the user did not share are both left out, so an empty object means "whole history or nothing shared".
- Permissions without samples (`ActivitySummary`, characteristics such as `DateOfBirth`) are never listed.
- The period is chosen on every permission sheet and kept per type. Types requested later can carry a different date or none.

Example:

```typescript
const permissions = {
  permissions: {
    read: [
      AppleHealthKit.Constants.Permissions.StepCount,
      AppleHealthKit.Constants.Permissions.HeartRate,
    ],
    write: [],
  },
} as HealthKitPermissions

AppleHealthKit.getEarliestAuthorizedSampleDates(permissions, (err, results) => {
  if (err) {
    return
  }
  console.log(results)
})
```

Example output, access granted on 8 October 2026 with "Past 30 Days":

```json
{
  "supported": true,
  "dates": {
    "StepCount": "2026-09-08T11:21:11.835+0200",
    "HeartRate": "2026-09-08T11:21:11.835+0200"
  }
}
```
