//
//  TankViewModel.swift
//  Tank
//
//  Created by Pit Krantz on 21/01/2022.
//

import Foundation
import CoreBluetooth



class TankViewModel : NSObject, ObservableObject, Identifiable{
    
    var id = UUID()
    // MARK: - Interface
    @Published var output = "Disconnected"  // current text to display in the output field
    @Published var connected = false  // true when BLE connection is active

    @Published var lightStatus: Bool = false
    // MARK: - Calculations
    private var values:[UInt8] = [0x7F, 0x7F, 0x00, 0x00]  // motor values left [0] and right [1] and horn [2] and knightRider [3]
    
    
    func getValueL(_ value: Int){
       values[0] = UInt8(value)
    }
    
    func getValueR(_ value: Int){
        values[1] = UInt8(value)
    }
    
    func hornInput(_ value: Int){
        values[2] = UInt8(value)
    }
    
    func lightInput(_ value: Int){
        values[3] = UInt8(value)
    }
    
    //func leftvalue(_ value: Int) {
    //    motorvalues[0] = UInt8(value)
    //    output = "\(motorvalues[0]) ? //\(motorvalues[1]) = ?"
    //}
    //
    //func right(_ value: Int) {
    //    motorvalues[1] = UInt8(value)
    //    output = "\(motorvalues[0]) ? //\(motorvalues[1]) = ?"
    //}
    
    func send() {
        guard let peripheral = connectedPeripheral,
              let inputChar = inputChar else {
            output = "Connection error"
            return
        }
   
        peripheral.writeValue(Data(values), for: inputChar, type: .withoutResponse)
    }

    // MARK: - BLE
    private var centralQueue: DispatchQueue?

    private let serviceUUID = CBUUID(string: "157E0550-1355-4D56-A677-2CE1E55E05B1")

    private let inputCharUUID = CBUUID(string: "E0E23CC5-6675-4901-AB96-94AC4FE31361")
    private var inputChar: CBCharacteristic?
    private let outputCharUUID = CBUUID(string: "44BB23E7-F4D5-4734-A885-7D82A0E851D6")
    private var outputChar: CBCharacteristic?
    
    // service and peripheral objects
    private var centralManager: CBCentralManager?
    private var connectedPeripheral: CBPeripheral?

    func connectTank() {
        output = "Connecting..."
        centralQueue = DispatchQueue(label: "test.discovery")
        centralManager = CBCentralManager(delegate: self, queue: centralQueue)
    }
    
    func disconnectTank() {
        guard let manager = centralManager,
              let peripheral = connectedPeripheral else { return }
        
        manager.cancelPeripheralConnection(peripheral)
    }
}

extension TankViewModel: CBCentralManagerDelegate {
    
    // This method monitors the Bluetooth radios state
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        print("Central Manager state changed: \(central.state)")
        if central.state == .poweredOn {
            central.scanForPeripherals(withServices: [serviceUUID], options: nil)
        }
    }

    // Called for each peripheral found that advertises the serviceUUID
    // This test program assumes only one peripheral will be powered up
    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
        print("Discovered \(peripheral.name ?? "UNKNOWN")")
        central.stopScan()
        
        connectedPeripheral = peripheral
        central.connect(peripheral, options: nil)
    }

    // After BLE connection to peripheral, enumerate its services
    func centralManager(_ central: CBCentralManager, didConnect peripheral: CBPeripheral) {
        print("Connected to \(peripheral.name ?? "UNKNOWN")")
        peripheral.delegate = self
        peripheral.discoverServices(nil)
    }
    
    // After BLE connection, cleanup
    func centralManager(_ central: CBCentralManager, didDisconnectPeripheral peripheral: CBPeripheral, error: Error?) {
        print("Disconnected from \(peripheral.name ?? "UNKNOWN")")
        
        centralManager = nil
        
        DispatchQueue.main.async {
            self.connected = false
            self.output = "Disconnected"
        }
    }
}

extension TankViewModel: CBPeripheralDelegate {
    func peripheral(_ peripheral: CBPeripheral, didDiscoverServices error: Error?) {
        print("Discovered services for \(peripheral.name ?? "UNKNOWN")")
        
        guard let services = peripheral.services else {
            return
        }
        
        for service in services {
            peripheral.discoverCharacteristics(nil, for: service)
        }
    }
    
    func peripheral(_ peripheral: CBPeripheral, didDiscoverCharacteristicsFor service: CBService, error: Error?) {
        print("Discovered characteristics for \(peripheral.name ?? "UNKNOWN")")
        
        guard let characteristics = service.characteristics else {
            return
        }
        
        for ch in characteristics {
            switch ch.uuid {
                case inputCharUUID:
                    inputChar = ch
                case outputCharUUID:
                    outputChar = ch
                    // subscribe to notification events for the output characteristic
                    peripheral.setNotifyValue(true, for: ch)
                default:
                    break
            }
        }
        
        DispatchQueue.main.async {
            self.connected = true
            self.output = "Connected."
        }
    }
    
    func peripheral(_ peripheral: CBPeripheral, didUpdateNotificationStateFor characteristic: CBCharacteristic, error: Error?) {
        print("Notification state changed to \(characteristic.isNotifying)")
    }
    
    func peripheral(_ peripheral: CBPeripheral, didUpdateValueFor characteristic: CBCharacteristic, error: Error?) {
        print("Characteristic updated: \(characteristic.uuid)")
        if characteristic.uuid == outputCharUUID, let data = characteristic.value {
            let bytes:[UInt8] = data.map {$0}
            
            if (bytes.first != nil){
                DispatchQueue.main.async {
                    
                    // Clear inputs
                    self.values[0] = 0x7F
                    self.values[1] = 0x7F
                    self.values[2] = 0x00
                    
                }
            }
        }
    }
}


