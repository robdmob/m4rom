SRCS = M4ROM.s
PROJ_NAME = M4ROM
AS:=sdasz80
CC:=sdcc
LD:=sdcc
HEXBIN?=hex2bin.exe
HOST?=6128plus
#IP?=`nmblookup $(HOST) | awk '/^[0-9]+/ {print $$1}'`
IP=192.168.2.74

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
	rm *.rel
	rm *.ihx
	rm *.map
	rm *.noi
	rm *.lk	

distclean: clean
	rm $(PROJ_NAME).BIN

# Transfer to computer
install: all
	cpcxfer -u $(IP) $(PROJ_NAME).BIN / 0
	cpcxfer -r $(IP)

# Create the container able to build the ROM
# The aim of the contianer is to not install dependencies on the computer
docker_build_container:
	docker build -t m4 .

# Create the ROM inside the container
docker_build_rom: docker_build_container
	make distclean
	docker run --rm=true -v $$(pwd):/src/m4rom -t m4  make HEXBIN=hex2bin	
