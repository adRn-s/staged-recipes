:: check licenses
cargo-bundle-licenses --format yaml --output THIRDPARTY.yml

:: build
cargo install --locked  --features lite --root "%LIBRARY_PREFIX%" --path . || goto :error

:: strip debug symbols
strip "%LIBRARY_PREFIX%\bin\qsvlite.exe" || goto :error

:: remove extra build file
del /F /Q "%LIBRARY_PREFIX%\.crates.toml"

goto :EOF

:error
echo Failed with error #%errorlevel%.
exit 1
