@echo off
if not exist BIN mkdir BIN
del BIN\*.*

if not exist DIST mkdir DIST
del DIST\*.*

echo.
echo [ Building DATPACK.EXE ]
echo.
TPC /B /EBIN TOOLS\DATPACK.PAS
echo.
echo [ Building ZZT.DAT ]
echo.
cd DOC
..\BIN\DATPACK.EXE /C ..\BIN\ZZT.DAT *.*
cd ..

echo.
echo [ Building ZZT.EXE ]
echo.
TPC /B /EBIN /GD /ISRC /USRC SRC\ZZT.PAS
echo.
echo [ Compressing ZZT.EXE ]
echo.
cd BIN
..\TOOLS\LZEXE.EXE ZZT.EXE
cd ..

echo.
echo [ Creating DIST/ ]
echo.

copy BIN\ZZT.EXE DIST\ZZT.EXE
copy BIN\ZZT.DAT DIST\ZZT.DAT
copy RES\ZZT.CFG DIST\ZZT.CFG
copy RES\DEMO.ZZT DIST\DEMO.ZZT
copy LICENSE.TXT DIST\LICENSE.TXT

