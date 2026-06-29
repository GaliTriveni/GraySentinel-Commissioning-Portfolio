# Hunting Report – Multi‑Stage Attack

**Date:** 2026-06-29  
**Hunter:** Triveni  

---

## Objective
Hunt for multi‑stage attacks using Sysmon logs and timeline analysis.  
Correlate process trees, detect download cradles, and reconstruct the full attack chain.

---

## Attack Simulation Summary
- **Stage 1:** Download cradle executed via PowerShell.  
- **Stage 2:** Payload (`payload.ps1`) downloaded from `http://192.168.56.101:8080`.  
- **Stage 3:** Secondary executable (`hello.exe`) retrieved and executed.  
- **Stage 4:** Credential theft tool (`mimikatz.exe`) launched.  

---

## Hunting Methodology
- **Data Sources:** Sysmon (Event IDs 1 – Process Create, 3 – Network Connection, 11 – File Create).  
- **Time Range:** One‑hour window during attack simulation.  
- **Hypothesis:** Adversary executed a multi‑stage chain involving download cradle, payload execution, and credential theft.  

---

## IOCs Identified
- **Process Tree:** `explorer.exe → cmd.exe → powershell.exe → mimikatz.exe`.  
- **IP Address:** 192.168.56.102.  
- **URL:** `http://192.168.56.101:8080/payload.ps1`.  
- **Files:**  
  - `hello.ps1` (PowerShell script).  
  - `hello.exe` (downloaded executable).  
  - `mimikatz.exe` (credential theft tool).  
- **Hashes:** Recorded in Sysmon logs for `hello.exe` and `mimikatz.exe`.  

---

## Evidence
Screenshots uploaded and referenced:

<img width="807" height="741" alt="Attack Simulation" src="https://github.com/user-attachments/assets/0470f663-3602-4b19-bf96-512813917fcf" />

  *Shows PowerShell cradle executing payload download.*

  <img width="807" height="522" alt="Sysmon Event" src="https://github.com/user-attachments/assets/cc558fa6-e480-4b02-88ea-d3d3c5e18ff8" />

  <img width="802" height="486" alt="Sysmon event2" src="https://github.com/user-attachments/assets/75c28870-4092-4b2b-bc6f-0e5ab245b5ef" />

  *Evidence of Sysmon Event ID 1 and 11 capturing PowerShell and file creation events.*

  <img width="755" height="635" alt="Attack chain" src="https://github.com/user-attachments/assets/15de24e2-d379-4df9-8063-f4e2fd4b7b3e" />

  *Displays parent‑child relationships confirming attack chain.*



---

## Detection Recommendations
- Create rules to detect PowerShell making outbound network connections.  
- Flag uncommon parent‑child relationships (e.g., `cmd.exe → powershell.exe`).  
- Alert on processes executed from `%TEMP%` directories.  
- Correlate Sysmon Event IDs 1, 3, and 11 for multi‑stage detection.  

---

## Lessons Learned
- Hunting revealed the **full chain** that individual alerts would miss.  
- **Process ancestry** is critical for understanding attack flow.  
- **Timeline correlation** provides context across multiple stages.  

