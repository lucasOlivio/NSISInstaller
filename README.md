# Afterbuild packaging

## About

Project 3 for "Configuration and deployment" class. MSBuild project that implements items, properties, tasks, and targets.

## Requirements

- Visual studio 2022

## Project Questions

### Properties, Items, and Tasks

All custom properties, items, and tasks for the project are located in the `Application.vcxproj` file within the `Application` folder. These definitions are found after the `<!-- CUSTOM MSBUILD TAGS PROJECT 3 -->` comment. Here's a summary:

#### Properties

    - **DeploymentPath**: Specifies the path for deployment, set to `"..\bin\"`.
    - **AssetsDeploymentPath**: Specifies the deployment path for assets, set to `"..\bin\assets\"`.
    - **ConfigsDeploymentPath**: Specifies the deployment path for configuration files, set to `"..\bin\configs\"`.
    - **DeployZip**: Specifies the name of the deployment ZIP file, set to `"project3.zip"`.

#### Items

    - **DLLFiles**: Includes all `*.dll` files.
    - **ExecFiles**: Includes all `*.exe` files from the `..\$(Platform)\$(Configuration)\` directory.
    - **ConfigFiles**: Includes all `*.json` files from the `configs` directory.
    - **AssetsFiles**: Includes all files from the `assets` directory and its subdirectories.

#### Tasks

    - **AfterBuild**: Executes before the `CleanAfterBuild` target, conditioned to run only in the `Release` configuration. Performs tasks such as removing older builds, copying dependency files to the deployment folder, and creating a ZIP archive of the deployment.
    - **CleanAfterBuild**: Removes unnecessary folders after the build, dependent on the `AfterBuild` target.

### Dependencies and Conditions

#### DependsOnTargets

    - The `CleanAfterBuild` target depends on the successful execution of the `AfterBuild` target. This ensures that cleanup occurs only after the deployment has been created.

#### Conditional Target

    - The `AfterBuild` target includes a condition to execute only when the build configuration is set to `Release`. This helps in customizing actions based on the chosen configuration.

## How to run

1. Unzip all libs from the .zip file in the "extern/lib/" folder
2. Open the solution in VS
3. Build the Startup project and run the executable inside the bin folder or inside the Application/project3.zip

## How to play

- Press P to start playing
- A/W/S/D to mode
- Mouse to control the camera
