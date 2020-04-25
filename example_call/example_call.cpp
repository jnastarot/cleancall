#include <Windows.h>
#include <iostream>

#include <cleancall.h>

using namespace std;

int main() {
    
    HANDLE EventHandle;

    // syscall idx 0x48 in win10 - NtCreateEvent

    NTSTATUS stat = cleancall::call(0x48, 5, &EventHandle, EVENT_ALL_ACCESS, 0, 0, 0);

    cout << "Used sysgate : " << cleancall::get_gate_type() << endl
            << " NtCreateEvent result: " << std::hex << stat
            << "  handle : " << std::hex << EventHandle << endl;

    return 0;
}