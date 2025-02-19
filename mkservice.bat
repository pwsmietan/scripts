@echo off

if not "%1"=="" goto BOJ
echo #1. Copy files to the target directory
echo mkservice [src] [dst] [site] 


:BOJ
robocopy %1\bin %2\bin
robocopy %1 %2 *.svc *.asax web.config

echo #2. Set up the website
rem if the website AdTatuMT already exists, delete it
c:\windows\system32\inetsrv\appcmd.exe delete site %3

rem if the AppPool AdTatuMT already exists, delete it 
c:\windows\system32\inetsrv\appcmd.exe delete apppool %3_pool

rem Create a website, called %3, pointing to the physical location %2
c:\windows\system32\inetsrv\appcmd.exe add site /name:%3 /bindings:http/*:8002: /physicalPath:"%2"                           

rem Create an AppPool, called %3_pool, setting to use .Net 4.0 and the NetworkService Identity.
c:\windows\system32\inetsrv\appcmd.exe add apppool /name:%3_pool /managedRuntimeVersion:v4.0 /processModel.identityType:NetworkService

rem Set the App %3 to use AppPool %3_pool
c:\windows\system32\inetsrv\appcmd.exe set app "%3/" /applicationPool:%3_pool
