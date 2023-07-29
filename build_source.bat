@echo off
echo BUILD NEKO VERSION
lime build neko -final
echo BUILD HASHLINK VERSION
lime build hl -final
echo BUILD FLASH VERSION
lime build flash -final
pause