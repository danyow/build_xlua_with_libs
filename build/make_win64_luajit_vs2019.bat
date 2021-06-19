call "D:\Microsoft\Visual Studio\Common7\Tools\VsDevCmd.bat" -arch=amd64

echo Swtich to x64 build env
cd %~dp0\luajit-2.1.0b3\src
call msvcbuild_mt.bat static
cd ..\..

mkdir build_lj64_2019 & pushd build_lj64_2019
cmake -DUSING_LUAJIT=ON -DPBC=ON -G "Visual Studio 16 2019" ..
popd
cmake --build build_lj64_2019 --config Release
md plugin_luajit\Plugins\x86_64
copy /Y build_lj64_2019\Release\xlua.dll plugin_luajit\Plugins\x86_64\xlua.dll
pause