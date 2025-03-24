import React, {useState, useEffect} from 'react';
import {
  SafeAreaView,
  StyleSheet,
  ScrollView,
  View,
  Text,
  StatusBar,
  Button,
} from 'react-native';

import {Colors} from 'react-native/Libraries/NewAppScreen';
import AppleHealthKit, {
  HealthValue,
  HealthKitPermissions,
} from 'react-native-health';

import {NativeEventEmitter, NativeModules} from 'react-native';

/* Permission options */
const permissions = {
  permissions: {
    read: [
      AppleHealthKit.Constants.Permissions.HeartRate,
      AppleHealthKit.Constants.Permissions.Fiber,
    ],
    write: [AppleHealthKit.Constants.Permissions.Steps],
  },
} as HealthKitPermissions;

AppleHealthKit.initHealthKit(permissions, (error: string) => {
  /* Called after we receive a response from the system */

  if (error) {
    console.log('[ERROR] Cannot grant permissions!');
  }

  /* Can now read or write to HealthKit */

  const options = {
    startDate: new Date(2020, 1, 1).toISOString(),
  };

  AppleHealthKit.getHeartRateSamples(
    options,
    (callbackError: string, results: HealthValue[]) => {
      /* Samples are now collected from HealthKit */
    },
  );
});

export default function App() {
  const [authStatus, setAuthStatus] = useState<any>({});
  const [data, setData] = useState<any>({});

  useEffect(() => {
    new NativeEventEmitter(NativeModules.AppleHealthKit).addListener(
      'healthKit:HeartRate:new',
      async () => {
        console.log('--> observer triggered');
      },
    );
  });

  const handlePressGetAuthStatus = () => {
    AppleHealthKit.getAuthStatus(permissions, (err, result) => {
      if (err) {
        console.error(err);
      }
      setAuthStatus(result);
    });
  };

  const getData = () => {
    AppleHealthKit.getStatisticDietaryFiber(
      {
        aggregator: 3,
        interval: 0,
        startDate: new Date(2020, 1, 1).toISOString(),
        endDate: new Date().toISOString(),
      },
      (err, result) => {
        if (err) {
          console.error(err);
        }
        setData(result);
      },
    );
  };

  return (
    <>
      <StatusBar barStyle="dark-content" />
      <SafeAreaView>
        <ScrollView
          contentInsetAdjustmentBehavior="automatic"
          style={styles.scrollView}>
          <View style={styles.body}>
            <View style={styles.sectionContainer}>
              <Text style={styles.sectionTitle}>
                React Native Health Example
              </Text>
              <Button
                title="Press me to get Auth Status"
                onPress={handlePressGetAuthStatus}
              />
              <Text style={styles.sectionDescription}>
                {JSON.stringify(authStatus, null, 2)}
              </Text>
              <Button title="Get data" onPress={getData} />
              <Text style={styles.sectionDescription}>
                {JSON.stringify(data, null, 2)}
              </Text>
            </View>
          </View>
        </ScrollView>
      </SafeAreaView>
    </>
  );
}

const styles = StyleSheet.create({
  scrollView: {
    backgroundColor: Colors.lighter,
  },
  engine: {
    position: 'absolute',
    right: 0,
  },
  body: {
    backgroundColor: Colors.white,
  },
  sectionContainer: {
    marginTop: 32,
    paddingHorizontal: 24,
  },
  sectionTitle: {
    fontSize: 24,
    fontWeight: '600',
    color: Colors.black,
  },
  sectionDescription: {
    marginTop: 8,
    fontSize: 18,
    fontWeight: '400',
    color: Colors.dark,
  },
  highlight: {
    fontWeight: '700',
  },
  footer: {
    color: Colors.dark,
    fontSize: 12,
    fontWeight: '600',
    padding: 4,
    paddingRight: 12,
    textAlign: 'right',
  },
});
