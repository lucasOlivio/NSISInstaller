# define installer name
OutFile "hello_installer.exe"

RequestExecutionLevel admin ; request admin permision to manage registry

# set desktop/Hello as install directory
InstallDir "$DESKTOP\Hello"

Var /GLOBAL Registry
Var /GLOBAL RegistryName
Var /GLOBAL RegistryValue

# default section start
Section

StrCpy $Registry "SOFTWARE\Wow6432Node\Configuration2023\Project4" ; Registry
StrCpy $RegistryName "StudentNumber" ; Registry name
StrCpy $RegistryValue "1151179" ; Registry value

call CheckInstallation

RMDir $INSTDIR
CreateDirectory $INSTDIR
 
# define output path
SetOutPath $INSTDIR
 
# specify file to go in output path
File hello.txt
File hello.exe
 
# define uninstaller name
WriteUninstaller $INSTDIR\uninstaller.exe

SetRegView 64

# Write the student number to the registry
WriteRegStr HKLM "$Registry" '$RegistryName' '$RegistryValue'

#-------
# default section end
SectionEnd
 
# create a section to define what the uninstaller does.
# the section will always be named "Uninstall"
Section "Uninstall"

StrCpy $Registry "SOFTWARE\Wow6432Node\Configuration2023\Project4" ; Registry
StrCpy $RegistryName "StudentNumber" ; Registry name
StrCpy $RegistryValue "1151179" ; Registry value
 
# Always delete uninstaller first
Delete $INSTDIR\uninstaller.exe
 
# now delete installed files
Delete $INSTDIR\hello.txt
Delete $INSTDIR\hello.exe
 
# Delete the directory
RMDir $INSTDIR

SetRegView 64

# Remove registry entry
DeleteRegValue HKLM "$Registry" "$RegistryName"
DeleteRegKey HKLM "$Registry"
DeleteRegKey HKLM "SOFTWARE\Wow6432Node\Configuration2023" ; To remve all folders created

SectionEnd

# Check if the program is already installed
Function CheckInstallation
  SetRegView 64
  ; Read registry for student number
  ReadRegStr $4 HKLM "$Registry" '$RegistryName'

  ; If student number don't exists then never installed
  StrCmp $4 "" Continue

  ; Ask user if should overwrite or cancel
  MessageBox MB_ICONQUESTION|MB_YESNO "Hello program is already installed. Would you like to overwrite the existing installation?" \
  IDYES Continue IDNO Cancel

Continue:
  Return

Cancel:
  MessageBox MB_ICONEXCLAMATION|MB_OK "Installation canceled."
  Abort
FunctionEnd