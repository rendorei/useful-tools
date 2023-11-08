
# How to configure Windows Terminal
#### 1. Clone the repository
#### 2. Put 'Windows Terminal/settings.json' file in the Windows Terminal folder
#### 3. Replace paths in the ```settings.json```
#### 4. Enjoy =)



#### Q&A

1) Q: How to generate GUID's for terminal profiles?
   A: ```[guid]::NewGuid().ToString() | Set-Clipboard```

2) Q: Where to find Windows Terminal settings folder?
   A: Usually it's under ```C:\Users\<username>\AppData\Local\Packages\Microsoft.WindowsTerminal_<some numbers>\LocalState\settings.json```