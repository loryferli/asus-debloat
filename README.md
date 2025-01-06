## Clone the repository
```bash
git clone https://github.com/loryferli/asus-debloat
```

## Stop and delete services
In Task Scheduler, create a task that runs at startup with admin priviledges. In the Actions section, put the following parameters
- Action: Start a program
- Program: C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe
- Arguments: -ExecutionPolicy Bypass -WindowStyle Hidden -File "path\to\asus_services.ps1"

## Delete Asus folders
In C:\Windows\System32\DriverStore\FileRepository, look for folders named asussci2.inf_amd64_{UID}. Each contains multiple folders. For all subfolders except Asus Optimisation, enter the folder, open an elevated powershell windows in the location and run delete_folder.ps1
**WARNING:** make sure the working directory is the folder you want to delete, this step could cause unwanted loss of files if not
