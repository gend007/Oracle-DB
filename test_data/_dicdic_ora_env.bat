@echo off

set sdate=%date:~0,4%%date:~5,2%%date:~8,2%
set sdate=%sdate: =0%

set stime=%time:~0,2%%time:~3,2%%time:~6,2%
set stime=%stime: =0%

set FILE_NAME=dicdic_ora_env
set CURDIR=%~dp0
set LOGFILE=%CURDIR%\_%sdate%%stime%.log

echo �����\�z���܂��B
pause

echo -------------------------------------------
echo ���\�z���J�n���܂���
echo ���������������������� >> %LOGFILE% 2>&1
echo dicdic�������\�z���O >> %LOGFILE% 2>&1
echo %date% %time% >> %LOGFILE% 2>&1
echo ���������������������� >> %LOGFILE% 2>&1

sqlplus /nolog @%CURDIR%\01_SchemaCreate.txt >>%LOGFILE%
echo �X�L�[�}�A���[���A�e�[�u�����쐬���܂����B
sqlplus /nolog @%CURDIR%\02_Data_TM.txt >>%LOGFILE% 2>&1
echo 6�̃}�X�^�[�e�[�u���Ƀf�[�^��}�����܂����B
sqlplus /nolog @%CURDIR%\02_Data_TT.txt >>%LOGFILE% 2>&1 
echo �e�[�u���Ƀf�[�^��}�����܂����B
echo Oracle�֓o�^���ꂽ�������J�E���g���Ă��܂��B
sqlplus /nolog @%CURDIR%\03_count.txt >>%LOGFILE% 2>&1 
echo -------------------------------------------

echo �������܂����B�ڍׂ̓��O�t�@�C�����Q�Ƃ��Ă��������B
pause
