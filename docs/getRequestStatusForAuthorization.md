# getRequestStatusForAuthorization

Check whether `initHealthKit` with the same permissions would show the access sheet, that is, whether some type in them has never been asked for. Wraps [`getRequestStatusForAuthorization(toShare:read:completion:)`](<https://developer.apple.com/documentation/healthkit/hkhealthstore/getrequeststatusforauthorization(toshare:read:completion:)>) (iOS 12+).

`getAuthStatus` cannot answer this for read access: HealthKit hides read grants. A type the app only reads stays "not determined" until it is asked for, and every query for it fails with `HKErrorAuthorizationNotDetermined` (code 5). That happens when a type joins the app's permission list after the user has connected, because the earlier access sheet did not include it.

The status is a `HealthAuthorizationRequestStatus`. From index.d.ts:

```typescript
export enum HealthAuthorizationRequestStatus {
  Unknown = 0,
  ShouldRequest = 1,
  Unnecessary = 2,
}
```

Example:

```typescript
AppleHealthKit.getRequestStatusForAuthorization(permissions, (err, status) => {
  if (err) return

  if (status === 1) {
    // Shows the sheet with only the types the user has not answered yet.
    AppleHealthKit.initHealthKit(permissions, () => {})
  }
})
```
