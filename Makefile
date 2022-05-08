SRCS = M4ROM.s
PROJ_NAME = M4ROM
AS:=sdasz80
CC:=sdcc
LD:=sdcc
HEXBIN?=hex2bin
HOST?=6128plus
#IP?=`nmblookup $(HOST) | awk '/^[0-9]+/ {print $$1}'`
IP?=192.168.2.87

ifeq ($(OS),Windows_NT)
    RM = del
else
    RM = rm -f
endif

OBJS = $(SRCS:.s=.rel)
.SUFFIXES: .c .s 

all: $(PROJ_NAME).BIN

$(PROJ_NAME).BIN: #$(OBJS)
	$(AS) -o $(SRCS:.s=.rel) $(SRCS)
	$(CC) -o $(SRCS:.s=.ihx) --no-std-crt0 -mz80 --verbose $(OBJS)
	$(HEXBIN) -e BIN $(SRCS:.s=.ihx)

.s.rel:
	$(AS) $(ASFLAGS) -o $@ $<

.S.rel:
	$(AS) $(ASFLAGS) -o $@ $<

.c.rel:
	$(CC) $(CFLAGS) $(INCDIR) -c $< -o $*.o

clean:
	$(RM) $(PROJ_NAME).rel
	$(RM) $(PROJ_NAME).ihx
	$(RM) $(PROJ_NAME).map
	$(RM) $(PROJ_NAME).noi
	$(RM) $(PROJ_NAME).lk	

distclean: clean
	$(RM) $(PROJ_NAME).BIN

# Transfer to computer
install: all
	cpcxfer -u $(IP) $(PROJ_NAME).BIN / 0
	cpcxfer -r $(IP)

