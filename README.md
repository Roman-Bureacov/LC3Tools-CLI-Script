*Note: intended for Windows machines*

# Purpose

This is intended to simplify the use of the command line tools that the LC3Tools provides. This makes use of the current version of [LC3Tools](https://github.com/chiragsakhuja/lc3tools?tab=readme-ov-file), **version 2.0.2**.

This project contains the pre-compiled executables *for Windows machines* so that you don't need to compile them for yourself. If you are cautious and want to compile them for yourself, see the tutorial [here](https://github.com/chiragsakhuja/lc3tools?tab=readme-ov-file#quick-start).

# How to Install ???

Simply either clone this repository, or go to `Code` -> `Download Zip`.

# How to USE ???

Open the directory `shell` in the terminal (either `cd` to it or right-click and `Open in Terminal`) and simply invoke:

```PowerShell
.\main.ps1
```

The working space is organized for your benefit under the folder `working`. Here there are two subdirectories, `bin` and `asm`.

`bin` is responsible for hosting your binary files.

`asm` is respondible for hosting your assembly files.

The PowerShell script will call upon these subdirectories for the appropriate files.

To assemble, simple run the script and provide the input as requested. Note that the file extension may be omitted (e.g. both `aesequop.bin bin` and `aesequop bin` are both valid). Also note that the inputs `fooBar asm` and `foobar` are both valid, in that *the script assumes asm if the file type (second argument) is omitted*.

Upon successful assembly, the script will open a new window with the simulator that has the assembled code loaded into it for you to enjoy.

# Script doesn't run ???

Windows offers a security feature for PowerShell scripts. To work around this, set the [execution policy](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.security/set-executionpolicy?view=powershell-7.5) as described below.

## Provide one-time running policy (Recommended)

Let Windows allow PowerShell scripts once, in the current running terminal.

```PowerShell
Set-ExecutionPolicy Unrestricted Process
```

## Provide `unrestricted` running policy

Let Windows allow all PowerShell scripts to run after confirmation.

```PowerShell
Set-ExecutionPolicy Unrestricted CurrentUser
```

# I'm not on Windows ??? Hello ?????

If you are not on a Windows machine, it still *might* be possible to use this script. Simply follow the instructions to compile the files with CMake [here](https://github.com/chiragsakhuja/lc3tools?tab=readme-ov-file#quick-start) and replace the existing files in `core`.