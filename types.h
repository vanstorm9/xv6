typedef unsigned int   uint;
typedef unsigned short ushort;
typedef unsigned char  uchar;
typedef uint pde_t;



#define SIGSEGV 2
#define PROT_READ 0
#define PROT_WRITE 1


typedef struct
{
	uint addr;
	uint type;
}siginfo_t;

