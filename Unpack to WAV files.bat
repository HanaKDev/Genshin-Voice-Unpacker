@echo off
cd /d %~dp0
chcp 936
set num=%random%%random%
cls

".\Tools\Wwise-Unpacker\quickbms.exe" ".\Tools\Wwise-Unpacker\wavescan.bms" ".\Game Files" ".\Tools\Wwise-Unpacker\Decoding"

FOR %%b IN (".\Game Files\*.BNK") DO (".\Tools\Wwise-Unpacker\bnkextr.exe" "%%b" & MOVE *.wav ".\Tools\Wwise-Unpacker\Decoding")

mkdir "Output-WAV_%num%"

FOR %%c IN (.\Tools\Wwise-Unpacker\Decoding\*.WAV) DO (".\Tools\vgmstream\vgmstream-cli.exe" "%%c" & MOVE "%%c.wav" ".\Output-WAV_%num%")

echo.
echo.Removing temporary files located in the "Decoding" directory...
FOR %%d IN (.\Tools\Wwise-Unpacker\Decoding\*.WAV) DO (DEL /F /Q "%%d")

echo.
echo.-------------------------------------------------------------
echo.Unpack finished! Files should be in the 'Output-WAV_%random%' folder  ;-)

"%windir%\explorer.exe" /e,"Output-WAV_%num%"

echo.
echo.-------------------------------------------------------------
echo.
echo.  Edited and improved by PisLuanyao
echo.    [https://Github.com/PisLuanyao]      ---- Oct 8, 2023
echo.
echo.  The URL of the upstream project is:
echo.   -- https://gitee.com/shenmo7192/genshin-voice-unpacker
echo.  The URL of the source repository is:
echo.   -- https://github.com/vgmstream/vgmstream
echo.   -- https://github.com/Vextil/Wwise-Unpacker
echo.
echo.-------------------------------------------------------------
pause > nul
exit