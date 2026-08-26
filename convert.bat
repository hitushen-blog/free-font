@echo off
setlocal enabledelayedexpansion

echo 开始转换所有 ttf 文件为 woff2...

for /r assets\font %%f in (*.ttf) do (
    echo 正在转换: %%f
    woff2_compress "%%f"
    if exist "%%~dpnf.woff2" (
        del "%%f"
        echo  转换成功，已删除原文件
    ) else (
        echo  转换失败，保留原文件
    )
)

echo 全部转换完成！
pause