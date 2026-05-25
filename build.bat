@echo off
setlocal

call "%~dp0clean.bat"

xelatex -interaction=nonstopmode -halt-on-error main.tex || exit /b 1
biber main || exit /b 1
xelatex -interaction=nonstopmode -halt-on-error main.tex || exit /b 1
xelatex -interaction=nonstopmode -halt-on-error main.tex || exit /b 1

endlocal
