# MsvcCompilerIssueSampleRepo

## Overview

This project demonstrates an issue with the MSVC compiler regarding unused functions in NASM files.
Despite using optimization flags, the MSVC linker does not remove unused functions from NASM source files, resulting in larger binary sizes.
This README file outlines the build steps and includes sample code to illustrate the problem.

## Prerequisites

Before you begin, ensure you have the following installed:

- **Visual Studio 2022** (with C++ development tools)
- **NASM** (Netwide Assembler)
- **NMAKE** (comes with Visual Studio)

## Build Steps

**Clone the Repository**

   If you haven't already, clone the repository to your local machine:
   ```bash
   git clone <repository-url>
   cd <repository-name>
   ```

**Create the Build Directory**
  ```bash
  mkdir Build
  ```

**Run the Build Command**
  ```bash
  nmake
  ```

**Verify the Issue**

   - **4.1 Check the MAP File**  
     To confirm that the MSVC compiler is not removing the unused functions from the NASM files, you can analyze the generated `main.map` file. Look for the presence of any unused functions, such as `SampleUnUsedFunctionTwo` or `SampleUnUsedFunctionThree`, in the binary.
     ![image](https://github.com/user-attachments/assets/d48953c1-a89c-4e6d-98f2-7dd46e0e0041)


   - **4.2 Use `Dumpbin`**  
     Check the `main.exe` using `Dumpbin`; there will be unused functions present.
     ```bash
     dumpbin Build\main.exe \DISASM
     ```
     ![image](https://github.com/user-attachments/assets/e305ec1a-2243-4501-ac7b-79746566f999)


**Clean Up (Optional)**
If you want to remove all compiled files and the executable after testing, you can run the clean target:
```bash
nmake clean
```
