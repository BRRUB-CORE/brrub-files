@echo off
cls

echo Montando o arquivo "Bootloader"...
nasm.exe -f bin boot/bootloader.asm -o ../bin/bootloader.bin

echo Montando o arquivo "Kernel"...
nasm.exe -f bin kernel/kernel.asm -o ../bin/kernel.bin

echo.
echo Compilacao finalizada com sucesso!
pause