# getStatisticWeight

Get the statistic of `type` from weight separated by `interval`.

### Request
|name|type|default|required|
|---|---|---|---|
|unit|string|`pound`||
|startDate|string|`nil`||
|endDate|string|init today date||
|interval|enum StatisticInterval (Int)|`month`||
|aggregator|enum AggregatorType (Int)|`nil`|*|

// TODO: Не знаю можно ли сделать enum в js что бы просто использовать более понятные значения

```swift
enum StatisticInterval: Int {
    case month = 0
    case day = 1
}
```

```swift
enum AggregatorType: Int {
    case min = 0
    case max = 1
    case average = 2
    case first = 3
    case last = 4
}
```

### Response

Example input options:

```javascript
let options = {
    unit: 'pound',
    aggregator: 2
}
```

Call the method:

```javascript
AppleHealthKit.getStatisticBodyMass(options, (err: string, results: Array<Dictionary>) => {
  if (err) {
    console.log('error getting latest weight: ', err)
    return
  }
  console.log(results)
})
```

Example output:

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
