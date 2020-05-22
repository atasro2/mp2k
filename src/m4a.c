#include "gba/m4a_internal.h"

ALIGNED(4) u8 SoundMainRAM_Buffer[0xC00];
ALIGNED(4) u32 hq_buffer[0x2C0];

ALIGNED(4) struct SoundInfo gSoundInfo;

void *gMPlayJumpTable[36];
struct CgbChannel gCgbChans[4];
struct MusicPlayerInfo gMPlayInfo_BGM;
struct MusicPlayerInfo gMPlayInfo_SE1;
struct MusicPlayerInfo gMPlayInfo_SE2;
struct MusicPlayerInfo gMPlayInfo_SE3;
u8 gMPlayMemAccArea[0x10];