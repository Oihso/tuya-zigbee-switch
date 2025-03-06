[![GitHub stars](https://img.shields.io/github/stars/romasku/tuya-zigbee-switch.svg)](https://github.com/romasku/tuya-zigbee-switch/stargazers)
[![GitHub issues](https://img.shields.io/github/issues/romasku/tuya-zigbee-switch.svg)](https://github.com/romasku/tuya-zigbee-switch/issues)
[![StandWithUkraine](https://raw.githubusercontent.com/vshymanskyy/StandWithUkraine/main/badges/StandWithUkraine.svg)](https://github.com/vshymanskyy/StandWithUkraine/blob/main/docs/README.md)

# Custom firmware for Tuya switch

A custom firmware for Tuya telink based switch module. Code is based on pvvx's [ZigbeeTLc](https://github.com/pvvx/ZigbeeTLc) firmware, huge thanks!

## Supported devices

Note that rebranded versions may have different internals and may not work. "Zigbee Manufacturer" is the most reliable identifier of the device.

| Z2M device name | Vendor name | Zigbee Manufacturer | Type | Status | Issue |
| --- | --- | --- | --- | --- | --- |
| [TS0012_switch_module](https://www.zigbee2mqtt.io/devices/TS0012_switch_module.html) | GIRIER TS0012, OXT  | _TZ3000_jl7qyupf | router / end_device | Supported |    -  | 
| [WHD02](https://www.zigbee2mqtt.io/devices/WHD02.html) | No-name 1 gang switch  | _TZ3000_skueekg3 | router | Supported |    -  | 
| [TS0002_basic](https://www.zigbee2mqtt.io/devices/TS0002_basic.html) | OXT TS0001, probably other rebrands  | _TZ3000_01gpyda5 | router | Supported |   [link](https://github.com/romasku/tuya-zigbee-switch/issues/6)  | 
| [TS0011_switch_module](https://www.zigbee2mqtt.io/devices/TS0011_switch_module.html) | GIRIER TS0011, OXT TS0011  | _TZ3000_ji4araar | router / end_device | Supported |   [link](https://github.com/romasku/tuya-zigbee-switch/issues/4)  | 
| [TS0001_switch_module](https://www.zigbee2mqtt.io/devices/TS0001_switch_module.html) | OXT TS0001, probably other rebrands  | _TZ3000_tqlv4ug4 | router | Supported |   [link](https://github.com/romasku/tuya-zigbee-switch/issues/6)  | 
| [TS0002_basic](https://www.zigbee2mqtt.io/devices/TS0002_basic.html) | No name TS0002  | _TZ3000_zmy4lslw | router | Supported, but manufacturer name needs confirmation |   [link](https://github.com/romasku/tuya-zigbee-switch/issues/6)  | 
| [TS0001_switch_module](https://www.zigbee2mqtt.io/devices/TS0001_switch_module.html) | Avatto TS0001  | _TZ3000_4rbqgcuv | router | Supported |   [link](https://github.com/romasku/tuya-zigbee-switch/issues/9)  | 
| [TS0002_limited](https://www.zigbee2mqtt.io/devices/TS0002_limited.html) | Avatto TS0002  | _TZ3000_mtnpt6ws | router | Supported |   [link](https://github.com/romasku/tuya-zigbee-switch/issues/9)  | 
| [TS0004_switch_module_2](https://www.zigbee2mqtt.io/devices/TS0004_switch_module_2.html) | Avatto TS0004  | _TZ3000_5ajpkyq6 | router | Supported |   [link](https://github.com/romasku/tuya-zigbee-switch/issues/9)  | 
| [TS0012](https://www.zigbee2mqtt.io/devices/TS0012.html) | Moes TS0012 (2 gang switch)  | _TZ3000_18ejxno0 | router / end_device | In progress |   [link](https://github.com/romasku/tuya-zigbee-switch/issues/14)  | 
| [TS0012_switch_module](https://www.zigbee2mqtt.io/devices/TS0012_switch_module.html) | Avatto TS0012  | _TZ3000_ljhbw1c9 | router / end_device | Supported |   [link](https://github.com/romasku/tuya-zigbee-switch/issues/16)  | 
| [WHD02](https://www.zigbee2mqtt.io/devices/WHD02.html) | Aubess WHD02  | _TZ3000_46t1rvdu | router / end_device | Supported |   [link](https://github.com/romasku/tuya-zigbee-switch/issues/18)  | 

If you device is not supported, but it is some Tuya switch module, please check [the porting guide](./docs/porting_to_new_device.md).

## Why?

The main driver for this project was the following factory firmware bug: if one button is pressed, the device ignores clicks to other buttons for ~0.5 seconds. The most frustrating consequence is that pressing both buttons at the same time turns only one relay on.

## Features

- Detached mode, e.g. switch doesn't trigger relay but only generates events via Zigbee
- Long press for momentary switches with configurable duration
- Router/EndDevice modes for no-neutral devices
- Super fast reaction time (compared to the factory firmware)
- 5 quick presses to reset the device
- Power-on behavior 
- Switch modes ON_OFF/OFF_ON/TOGGLE allowing to synchonize switch position with relay state

## Building

Only on linux:

```
make install
make
```

## Flashing device

Firmware can be [flashed via OTA](./docs/ota_flash.md). If you still use zigbee2mqtt 1.x, use [this guide](./docs/ota_flash_z2m_v1.md)

To switch between End Device and Router follow [this guide](./docs/change_device_type.md)

To flash via wire, follow [this guide](./docs/flashing_via_wire.md)

## Changelog

### v1.0.8

- Add support for indicator leds
- Add way to force momentary mode as default via config

### v1.0.7

- Add SUSPEND-based sleep to EndDevice firmware to decrease power usage ~10x

### v1.0.6

- Add way to change device pinout on the fly, to allow easier porting of firmware 

### v1.0.5

- Keep status LED on when device is connected
- Add separate firmwares for End Device/Router
- Improve device boot time significantly by removing unnecessary logs 

### v1.0.4

- Fix bug that caused report to be sent every second

### v1.0.3

- Add support of statup behaviour: ON, OFF, TOGGLE, PREVIOUS
- Add support of button actions: 'released', 'press', 'long_press'. This is only useful for momentary (doorbell-like) switches.

### v1.0.2

- Add way to reset the device by pressing any switch button 5 times in a row 
- Fix support for ON_OFF, OFF_ON actions


## Acknowledgements

- https://github.com/pvvx/ZigbeeTLc (firmware for telink based ATC) as this was base for this project
- https://github.com/doctor64/tuyaZigbee (firmware for some other Tuya Zigbee devices) for some helpful examples
- https://medium.com/@omaslyuchenko for **Hello Zigbee World** series, that contain very usefull reference on how to implement own Zigbee device 
