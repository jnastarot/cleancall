Cleancall
===

Library for using direct system calls
It automatically detect type of gate for call system call (`WOW64` \ `Int2E` \ `Sysenter` \ `Syscall` )

```
--------------------------------------------------------------------------------
Name....: clean call
Author..: JNA
e.mail..: jnastarot@yandex.ru
--------------------------------------------------------------------------------
```

Supported Windows
---

|Tested|Status|
|---|---|
|Windows 10 x64| OK |
|Windows 7 x86| OK |

Example Use
----
(https://github.com/jnastarot/cleancall/tree/master/example_call/example_call.cpp)<br>

```
#include <cleancall.h>

...
NTSTATUS nt_status = cleancall::call(0x48, 5, &EventHandle, EVENT_ALL_ACCESS, 0, 0, 0);
...

```

