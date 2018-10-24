@echo off

set sdate=%date:~0,4%%date:~5,2%%date:~8,2%
set sdate=%sdate: =0%

set stime=%time:~0,2%%time:~3,2%%time:~6,2%
set stime=%stime: =0%

set FILE_NAME=dicdic_ora_env
set CURDIR=%~dp0
set LOGFILE=%CURDIR%\_%sdate%%stime%.log

echo 環境を構築します。
pause

echo -------------------------------------------
echo 環境構築を開始しました
echo ■■■■■■■■■■■ >> %LOGFILE% 2>&1
echo dicdic実験環境構築ログ >> %LOGFILE% 2>&1
echo %date% %time% >> %LOGFILE% 2>&1
echo ■■■■■■■■■■■ >> %LOGFILE% 2>&1

sqlplus /nolog @%CURDIR%\01_SchemaCreate.txt >>%LOGFILE%
echo スキーマ、ロール、テーブルを作成しました。
sqlplus /nolog @%CURDIR%\02_Data_TM.txt >>%LOGFILE% 2>&1
echo 6つのマスターテーブルにデータを挿入しました。
sqlplus /nolog @%CURDIR%\02_Data_TT.txt >>%LOGFILE% 2>&1 
echo テーブルにデータを挿入しました。
echo Oracleへ登録された件数をカウントしています。
sqlplus /nolog @%CURDIR%\03_count.txt >>%LOGFILE% 2>&1 
echo -------------------------------------------

echo 完了しました。詳細はログファイルを参照してください。
pause
