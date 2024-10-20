# Variables
NASM = C:\nasm\nasm

CC = "C:\Program Files\Microsoft Visual Studio\2022\Professional\VC\Tools\MSVC\14.40.33807\bin\Hostx64\x64\cl.exe"
CC_FLAGS = /nologo /c /WX /GS- /W4 /Gs32768 /D UNICODE /O1b2s /GL /Gy /EHs-c- /GR- /GF /Z7 /Gw /volatileMetadata- -D DISABLE_NEW_DEPRECATED_INTERFACES /Od /Oy-

NASM_FLAGS = -ISrc\ -Ox -f win64 -g
OBJ_FILES = $(OUTPUT_DIR)\Sample1.obj $(OUTPUT_DIR)\Sample2.obj
C_OBJ_FILES = $(OUTPUT_DIR)\main.obj $(OUTPUT_DIR)\SampleLibOne.obj $(OUTPUT_DIR)\SampleLibTwo.obj
C_FILES = main.c Src\Library\SampleLibOne.c Src\LibraryTwo\SampleLibTwo.c
INCLUDE_DIR = -ISrc

DLINK_FLAGS = /NOLOGO /NODEFAULTLIB /IGNORE:4001 /IGNORE:4281 /OPT:REF /OPT:ICF=10 /MAP /ALIGN:32 /SECTION:.xdata,D /SECTION:.pdata,D /Machine:X64 /LTCG /DLL /SAFESEH:NO /BASE:0 /DRIVER /DEBUG /ALIGN:4096 /DLL /ALIGN:4096 /FILEALIGN:4096 /SUBSYSTEM:CONSOLE /BASE:0x10000 /ENTRY:main
DLINK = "C:\Program Files\Microsoft Visual Studio\2022\Professional\VC\Tools\MSVC\14.40.33807\bin\Hostx86\x64\link.exe"

OUTPUT_DIR = Build
MD = mkdir
RD = rmdir /s /q

# Default target
all: $(OUTPUT_DIR) $(OUTPUT_DIR)\main.exe

# Ensure output directory exists
$(OUTPUT_DIR):
	@if not exist $(OUTPUT_DIR) $(MD) $(OUTPUT_DIR)

# Build object files from NASM
$(OUTPUT_DIR)\Sample1.obj: Src\Library\X64\Sample1.nasm $(OUTPUT_DIR)
	$(NASM) $(NASM_FLAGS) -o $(OUTPUT_DIR)\Sample1.obj Src\Library\X64\Sample1.nasm

$(OUTPUT_DIR)\Sample2.obj: Src\Library\X64\Sample2.nasm $(OUTPUT_DIR)
	$(NASM) $(NASM_FLAGS) -o $(OUTPUT_DIR)\Sample2.obj Src\Library\X64\Sample2.nasm

# Build object files from C source
$(OUTPUT_DIR)\main.obj: main.c $(OUTPUT_DIR)
	$(CC) $(CC_FLAGS) $(INCLUDE_DIR) main.c /Fo$(OUTPUT_DIR)\main.obj

$(OUTPUT_DIR)\SampleLibOne.obj: Src\Library\SampleLibOne.c $(OUTPUT_DIR)
	$(CC) $(CC_FLAGS) $(INCLUDE_DIR) Src\Library\SampleLibOne.c /Fo$(OUTPUT_DIR)\SampleLibOne.obj

$(OUTPUT_DIR)\SampleLibTwo.obj: Src\LibraryTwo\SampleLibTwo.c $(OUTPUT_DIR)
	$(CC) $(CC_FLAGS) $(INCLUDE_DIR) Src\LibraryTwo\SampleLibTwo.c /Fo$(OUTPUT_DIR)\SampleLibTwo.obj


# Link the executable
$(OUTPUT_DIR)\main.exe: $(OBJ_FILES) $(C_OBJ_FILES)
	$(DLINK) $(C_OBJ_FILES) $(OBJ_FILES) $(DLINK_FLAGS) /OUT:$(OUTPUT_DIR)\main.exe

# Clean up
clean:
	if exist $(OUTPUT_DIR) $(RD) $(OUTPUT_DIR)

