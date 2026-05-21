// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Smart Healthcare Monitoring - Blockchain Ledger
// Week 4 Milestone 1

contract HealthcareDataLedger {

    struct HealthRecord {
        string  patientId;
        uint256 heartRate;
        string  bloodPressure;
        uint256 oxygenLevel;
        string  bodyTemp;
        uint256 timestamp;
    }

    HealthRecord[] private records;

    // Store a new patient health record on-chain
    function storeData(
        string  memory patientId,
        uint256        heartRate,
        string  memory bloodPressure,
        uint256        oxygenLevel,
        string  memory bodyTemp
    ) public {
        records.push(HealthRecord(
            patientId,
            heartRate,
            bloodPressure,
            oxygenLevel,
            bodyTemp,
            block.timestamp
        ));
    }

    // Get total number of stored records
    function getTotalRecords() public view returns (uint256) {
        return records.length;
    }

    // Retrieve a record by index
    function getRecord(uint256 index) public view returns (
        string  memory patientId,
        uint256        heartRate,
        string  memory bloodPressure,
        uint256        oxygenLevel,
        string  memory bodyTemp,
        uint256        timestamp
    ) {
        require(index < records.length, "Index out of bounds");
        HealthRecord memory r = records[index];
        return (
            r.patientId,
            r.heartRate,
            r.bloodPressure,
            r.oxygenLevel,
            r.bodyTemp,
            r.timestamp
        );
    }
}
