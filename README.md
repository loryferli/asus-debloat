## Clone the repository
```bash
git clone https://github.com/loryferli/asus-debloat
```

## Stop and delete services
In Task Scheduler, create a task that runs at startup with admin priviledges. In the Actions section, put the following parameters
- Action: Start a program
- Program: C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe
- Arguments: -ExecutionPolicy Bypass -WindowStyle Hidden -File "path\to\asus_services.ps1"
