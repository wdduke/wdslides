@echo off
setlocal

for %%E in (
  aux
  bbl
  bcf
  blg
  fdb_latexmk
  fls
  log
  nav
  out
  run.xml
  snm
  synctex.gz
  toc
  vrb
  xdv
) do (
  del /q "*.%%E" 2>nul
)

del /q "*-blx.bib" 2>nul
for /d %%D in (_minted-*) do rmdir /s /q "%%D" 2>nul
if exist "build" rmdir /s /q "build" 2>nul

endlocal
