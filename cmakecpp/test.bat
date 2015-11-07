
@echo off

msbuild $<R@t<#projname>.sln /m /clp:verbosity=minimal
if "%errorlevel%" == "0" test\Debug\test.exe
