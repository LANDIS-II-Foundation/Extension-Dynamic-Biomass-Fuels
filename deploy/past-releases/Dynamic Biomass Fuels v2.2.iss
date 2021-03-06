#define PackageName      "Dynamic Biomass Fuels"
#define PackageNameLong  "Dynamic Biomass Fuels"
#define Version          "2.2.3"
#define ReleaseType      "official"
#define ReleaseNumber    "2"
#define CoreVersion      "6.0"
#define CoreReleaseAbbr  ""


#define ExtDir "C:\Program Files\LANDIS-II\v6\bin\extensions"
#define AppDir "C:\Program Files\LANDIS-II\v6\"
#define LandisPlugInDir "C:\Program Files\LANDIS-II\plug-ins"

#include "package (Setup section) v6.0.iss"




[Files]
; This .dll IS the extension (ie, the extension's assembly)
; NB: Do not put a version number in the file name of this .dll
Source: ..\..\src\bin\debug\Landis.Extension.BiomassFuels.dll; DestDir: {#ExtDir}; Flags: replacesameversion


; Requisite auxiliary libraries
; NB. These libraries are used by other extensions and thus are never uninstalled.
Source: ..\..\src\bin\debug\Landis.Library.BiomassCohorts-v2.dll; DestDir: {#ExtDir}; Flags: replacesameversion uninsneveruninstall
Source: ..\..\src\bin\debug\Landis.Library.AgeOnlyCohorts.dll; DestDir: {#ExtDir}; Flags: replacesameversion uninsneveruninstall
Source: ..\..\src\bin\debug\Landis.Library.Biomass-v1.dll; DestDir: {#ExtDir}; Flags: replacesameversion uninsneveruninstall
Source: ..\..\src\bin\debug\Landis.Library.Cohorts.dll; DestDir: {#ExtDir}; Flags: replacesameversion uninsneveruninstall



; Complete example for testing the extension
Source: ..\examples\*.txt; DestDir: {#AppDir}\examples\Dynamic Biomass Fuels; Flags: replacesameversion
Source: ..\examples\*.gis; DestDir: {#AppDir}\examples\Dynamic Biomass Fuels; Flags: replacesameversion
Source: ..\examples\*.bat; DestDir: {#AppDir}\examples\Dynamic Biomass Fuels; Flags: replacesameversion
Source: ..\examples\*.csv; DestDir: {#AppDir}\examples\Dynamic Biomass Fuels; Flags: replacesameversion


; LANDIS-II identifies the extension with the info in this .txt file
; NB. New releases must modify the name of this file and the info in it
#define InfoTxt "Dynamic Biomass Fuels 2.2.txt"
Source: {#InfoTxt}; DestDir: {#LandisPlugInDir}


[Run]
;; Run plug-in admin tool to add entries for each plug-in
#define PlugInAdminTool  CoreBinDir + "\Landis.PlugIns.Admin.exe"
Filename: {#PlugInAdminTool}; Parameters: "remove ""Dynamic Biomass Fuel System"" "; WorkingDir: {#LandisPlugInDir}
Filename: {#PlugInAdminTool}; Parameters: "add ""{#InfoTxt}"" "; WorkingDir: {#LandisPlugInDir}



[Code]
#include "package (Code section) v3.iss"


//-----------------------------------------------------------------------------

function InitializeSetup_FirstPhase(): Boolean;
begin
  Result := True
end;
