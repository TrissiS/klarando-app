import AsyncStorage from '@react-native-async-storage/async-storage'

const API_BASE_URL_KEY = 'klarando.mobile.apiBaseUrl'
const APP_AUTH_TOKEN_KEY = 'klarando.mobile.appAuthToken'

export async function readStoredApiBaseUrl() {
  try {
    return await AsyncStorage.getItem(API_BASE_URL_KEY)
  } catch {
    return null
  }
}

export async function writeStoredApiBaseUrl(value: string) {
  try {
    await AsyncStorage.setItem(API_BASE_URL_KEY, value)
  } catch {
    // ignore storage write errors
  }
}

export async function readStoredAppAuthToken() {
  try {
    return await AsyncStorage.getItem(APP_AUTH_TOKEN_KEY)
  } catch {
    return null
  }
}

export async function writeStoredAppAuthToken(value: string) {
  try {
    await AsyncStorage.setItem(APP_AUTH_TOKEN_KEY, value)
  } catch {
    // ignore storage write errors
  }
}

export async function clearStoredAppAuthToken() {
  try {
    await AsyncStorage.removeItem(APP_AUTH_TOKEN_KEY)
  } catch {
    // ignore storage write errors
  }
}
