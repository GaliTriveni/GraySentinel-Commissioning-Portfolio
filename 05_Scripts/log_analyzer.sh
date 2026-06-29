**Date:** 2026-06-27  
**Analyst:** Triveni 

---

## Objective
Configure and test Linux auditing with **auditd**, centralize logs with **rsyslog**, and set up file integrity monitoring with **AIDE**.  
Document rules, outputs, and challenges faced.

---

## Findings
- **Auditd Rules Configured:**  
  - `/etc/passwd`, `/etc/shadow`, `/etc/sudoers` monitored for changes.  
  - `/etc/ssh/sshd_config` monitored for SSH configuration changes.  
  - `/etc/crontab` and `/etc/cron.d/` monitored for scheduled task changes.  
  - Privilege escalation detection via `execve` syscall for SUID binaries.  

- **Audit Log Analysis:**  
  - Detected modification of `/etc/passwd` triggered by `useradd`.  
  - Recorded syscall details, process IDs, and user IDs.  
  - Confirmed success status of the change.  

- **Centralized Logging (rsyslog):**  
  - Logs forwarded to `/var/log/remote/%HOSTNAME%.log`.  
  - Verified remote log entries from Windows host.  

- **AIDE Setup:**  
  - Faced repeated syntax errors in configuration file.  
  - Database creation failed, blocking initialization.  
  - Task incomplete due to persistent setup issues.  

---

## Evidence
  Screenshots uploaded and referenced:

  *Shows auditctl rules monitoring passwd, shadow, sudoers, sshd_config, and cron files.*  
  *Evidence of `/etc/passwd` modification detected via ausearch.*  
  *Shows centralized logging with remote log entries.*  

---

## Conclusion
Linux auditing provided visibility into critical file changes and centralized logging confirmed remote log forwarding.  
However, AIDE setup failed due to configuration errors, highlighting the importance of syntax validation and baseline initialization.

### Recommendations
- Refine auditd rules to cover additional sensitive files.  
- Secure rsyslog transport with TLS.  
- Revisit AIDE configuration to ensure proper database creation.  
- Implement log rotation for retention and compliance.  



