//
//  YaWeatherEntity.swift
//  ya-weather
//
//  Created by Nurbolat Yerdikul on 19.04.2021.
//

import Foundation

// MARK: - YaWeather
struct YaWeatherEntity: Codable {
    let now: Int
    let nowDt: String
    let info: Info
    let geoObject: GeoObject
    let yesterday: Yesterday
    let fact: Fact
    let forecasts: [Forecast]

    enum CodingKeys: String, CodingKey {
        case now
        case nowDt = "now_dt"
        case info
        case geoObject = "geo_object"
        case yesterday, fact, forecasts
    }
}

// MARK: - Fact
struct Fact: Codable {
    let obsTime, uptime, temp, feelsLike: Int
    let icon: Icon
    let condition: FactCondition
    let cloudness: Double
    let precType, precProb, precStrength: Int
    let isThunder: Bool
    let windSpeed: Double
    let windDir: WindDir
    let pressureMm, pressurePa, humidity: Int
    let daytime: Daytime
    let polar: Bool
    let season, source: String
    let soilMoisture: Double
    let soilTemp, uvIndex: Int
    let windGust: Double
    let accumPrec: [String: Double]?

    enum CodingKeys: String, CodingKey {
        case obsTime = "obs_time"
        case uptime, temp
        case feelsLike = "feels_like"
        case icon, condition, cloudness
        case precType = "prec_type"
        case precProb = "prec_prob"
        case precStrength = "prec_strength"
        case isThunder = "is_thunder"
        case windSpeed = "wind_speed"
        case windDir = "wind_dir"
        case pressureMm = "pressure_mm"
        case pressurePa = "pressure_pa"
        case humidity, daytime, polar, season, source
        case soilMoisture = "soil_moisture"
        case soilTemp = "soil_temp"
        case uvIndex = "uv_index"
        case windGust = "wind_gust"
        case accumPrec = "accum_prec"
    }
}

enum FactCondition: String, Codable {
    case clear = "clear"
    case cloudy = "cloudy"
    case lightRain = "light-rain"
    case lightSnow = "light-snow"
    case overcast = "overcast"
    case partlyCloudy = "partly-cloudy"
    case rain = "rain"
    case snow = "snow"
    case wetSnow = "wet-snow"
}

enum Daytime: String, Codable {
    case d = "d"
    case n = "n"
}

enum Icon: String, Codable {
    case bknD = "bkn_d"
    case bknN = "bkn_n"
    case bknRaD = "bkn_-ra_d"
    case bknRaN = "bkn_-ra_n"
    case iconOvcRa = "ovc_ra"
    case iconOvcSn = "ovc_+sn"
    case ovc = "ovc"
    case ovcRa = "ovc_-ra"
    case ovcRaSn = "ovc_ra_sn"
    case ovcSn = "ovc_-sn"
    case purpleOvcSn = "ovc_sn"
    case skcD = "skc_d"
    case skcN = "skc_n"
}

enum WindDir: String, Codable {
    case e = "e"
    case n = "n"
    case ne = "ne"
    case nw = "nw"
    case s = "s"
    case se = "se"
    case sw = "sw"
    case w = "w"
}

// MARK: - Forecast
struct Forecast: Codable {
    let date: String
    let dateTs, week: Int
    let sunrise, sunset, riseBegin, setEnd: String
    let moonCode: Int
    let moonText: MoonText
    let parts: Parts
    let hours: [Hour]
    let biomet: Biomet?

    enum CodingKeys: String, CodingKey {
        case date
        case dateTs = "date_ts"
        case week, sunrise, sunset
        case riseBegin = "rise_begin"
        case setEnd = "set_end"
        case moonCode = "moon_code"
        case moonText = "moon_text"
        case parts, hours, biomet
    }
}

// MARK: - Biomet
struct Biomet: Codable {
    let index: Int
    let condition: BiometCondition
}

enum BiometCondition: String, Codable {
    case magneticField0 = "magnetic-field_0"
    case magneticField1 = "magnetic-field_1"
}

// MARK: - Hour
struct Hour: Codable {
    let hour: String?
    let hourTs, temp: Int?
    let feelsLike: Int
    let icon: Icon
    let condition: FactCondition
    let cloudness: Double
    let precType: Int
    let precStrength: Double
    let isThunder: Bool?
    let windDir: WindDir
    let windSpeed, windGust: Double
    let pressureMm, pressurePa, humidity: Int
    let uvIndex: Int?
    let soilTemp: Int
    let soilMoisture, precMm: Double
    let precPeriod, precProb: Int
    let source: String?
    let tempMin, tempAvg, tempMax: Int?
    let daytime: Daytime?
    let polar: Bool?

    enum CodingKeys: String, CodingKey {
        case hour
        case hourTs = "hour_ts"
        case temp
        case feelsLike = "feels_like"
        case icon, condition, cloudness
        case precType = "prec_type"
        case precStrength = "prec_strength"
        case isThunder = "is_thunder"
        case windDir = "wind_dir"
        case windSpeed = "wind_speed"
        case windGust = "wind_gust"
        case pressureMm = "pressure_mm"
        case pressurePa = "pressure_pa"
        case humidity
        case uvIndex = "uv_index"
        case soilTemp = "soil_temp"
        case soilMoisture = "soil_moisture"
        case precMm = "prec_mm"
        case precPeriod = "prec_period"
        case precProb = "prec_prob"
        case source = "_source"
        case tempMin = "temp_min"
        case tempAvg = "temp_avg"
        case tempMax = "temp_max"
        case daytime, polar
    }
}

enum MoonText: String, Codable {
    case moonCode11 = "moon-code-11"
    case moonCode12 = "moon-code-12"
    case moonCode13 = "moon-code-13"
    case moonCode14 = "moon-code-14"
    case moonCode15 = "moon-code-15"
}

// MARK: - Parts
struct Parts: Codable {
    let dayShort, night, day, evening: Hour
    let morning, nightShort: Hour

    enum CodingKeys: String, CodingKey {
        case dayShort = "day_short"
        case night, day, evening, morning
        case nightShort = "night_short"
    }
}

// MARK: - GeoObject
struct GeoObject: Codable {
    let district: Country?
    let locality, province, country: Country
}

// MARK: - Country
struct Country: Codable {
    let id: Int
    let name: String
}

// MARK: - Info
struct Info: Codable {
    let n: Bool
    let geoid: Int
    let url: String
    let lat, lon: Double
    let tzinfo: Tzinfo
    let defPressureMm, defPressurePa: Int
    let slug: String
    let zoom: Int
    let nr, ns, nsr, p: Bool
    let f, h: Bool

    enum CodingKeys: String, CodingKey {
        case n, geoid, url, lat, lon, tzinfo
        case defPressureMm = "def_pressure_mm"
        case defPressurePa = "def_pressure_pa"
        case slug, zoom, nr, ns, nsr, p, f
        case h = "_h"
    }
}

// MARK: - Tzinfo
struct Tzinfo: Codable {
    let name, abbr: String
    let dst: Bool
    let offset: Int
}

// MARK: - Yesterday
struct Yesterday: Codable {
    let temp: Int
}
