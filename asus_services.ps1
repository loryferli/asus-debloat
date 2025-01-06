# Stop and delete ASUS-related services
$services = @(
    "AsusAppService",
    "ASUSSoftwareManager",
    "ASUSSystemDiagnosis",
    "ASUSSwitch",
    "ASUSOptimization",
    "ArmouryCrateControlInterface",
    "ASUSLinkNear",
    "ASUSLinkNearExt",
    "ASUSLinkRemote",
    "ASUSSystemAnalysis",
    "asus",
    "asusm",
    "AsusROGLSLService"
)

foreach ($service in $services) {
    # Stop the service
    if (Get-Service -Name $service -ErrorAction SilentlyContinue) {
        Write-Output "Stopping service: $service"
        Stop-Service -Name $service -Force
    }

    # Delete the service
    Write-Output "Deleting service: $service"
    sc.exe delete $service | Out-Null
}
