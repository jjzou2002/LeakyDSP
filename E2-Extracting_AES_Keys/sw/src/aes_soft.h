

#ifndef _AES_SOFT_H_
#define _AES_SOFT_H_

extern unsigned char s_box[256];
extern unsigned char mul2[256];
extern unsigned char mul3[256];
extern unsigned char rcon[256];


void KeyExpansionCore (unsigned char* in, unsigned char i);
void KeyExpansion(unsigned char* inputKey, unsigned char* expandedKeys); 
void SubBytes(unsigned char* state);
void ShiftRows(unsigned char* state);
void MixColumns(unsigned char* state);
void AddRoundKey(unsigned char* state, unsigned char* roundKey);
void AES_Encrypt(unsigned char* message, unsigned char* key);
#endif
