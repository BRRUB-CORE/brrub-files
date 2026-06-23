@ECHO OFF
cls
echo Montando o arquivo "Bootloader"
nasm -f bin boot/bootloader.asm -o ../bin/bootloader.bin

echo Montando o arquivo "Kernel"
nasm -f bin kernel/kernel.asm -o ../bin/kernel.bin

echo.
echo Criando imagem de disquete de 1.44MB para o VirtualBox...
powershell -NoProfile -Command "$boot = [System.IO.File]::ReadAllBytes('..\bin\bootloader.bin'); $kern = [System.IO.File]::ReadAllBytes('..\bin\kernel.bin'); $pad = New-Object byte[] (1474560 - $boot.Length - $kern.Length); [System.IO.File]::WriteAllBytes('..\build\brrubOS.img', ($boot + $kern + $pad))"

echo Sucesso! Imagem gerada em build/brrubOS.img
pause