#################################################################################
#            ___________      .__.__  .__  .__               __                 #
#            \__    ___/______|__|  | |  | |__|____    _____/  |_               #
#              |    |  \_  __ \  |  | |  | |  \__  \  /    \   __\              #
#              |    |   |  | \/  |  |_|  |_|  |/ __ \|   |  \  |                #
#              |____|   |__|  |__|____/____/__(____  /___|  /__|                #
#                                                  \/     \/                    #
#                                         Networks Inc.                         #
# File:    cortex-m4.mk                                                         #
#                                                                               #
# Author:  Jérémie Faucher-Goulet                                               #
#                                                                               #
#   www.trilliantinc.com                                                        #
#                                                                               #
# The MIT License (MIT)                                                         #
#                                                                               #
# Copyright (c) 2015 Trilliant                                                  #
#                                                                               #
# Permission is hereby granted, free of charge, to any person obtaining a copy  #
# of this software and associated documentation files (the "Software"), to deal #
# in the Software without restriction, including without limitation the rights  #
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell     #
# copies of the Software, and to permit persons to whom the Software is         #
# furnished to do so, subject to the following conditions:                      #
#                                                                               #
# The above copyright notice and this permission notice shall be included in    #
# all copies or substantial portions of the Software.                           #
#                                                                               #
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR    #
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,      #
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE   #
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER        #
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, #
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN     #
# THE SOFTWARE.                                                                 #
#################################################################################

IAR_LICENSE_SERVER ?= [PUT YOUR LICENSE SERVER FQDN HERE]

#################################################################################
# Constants
#################################################################################

ARCH ?= cortex-m4

#################################################################################
# Cross compiler
#################################################################################
ifeq ($(COMPILER),$(IAR_COMPILER))
    CROSS_COMPILE := $(ARM_IAR_HOME)\bin
    CC := "$(CROSS_COMPILE)\iccarm.exe"
    AR := "$(CROSS_COMPILE)\iarchive.exe"
else ifeq ($(COMPILER),$(GCC_COMPILER))
    CROSS_COMPILE := $(ARM_GCC_HOME)/bin/arm-none-eabi-
    CC := "$(CROSS_COMPILE)gcc"
    OBJCOPY := "$(CROSS_COMPILE)objcopy"
    OBJDUMP := "$(CROSS_COMPILE)objdump"
    SIZE := "$(CROSS_COMPILE)size"
    AR := "$(CROSS_COMPILE)ar"
endif

#################################################################################
# Compiler options
#################################################################################

ifeq ($(COMPILER), iar)
    CFLAGS += --cpu=Cortex-M4 --cpu_mode=thumb
else
    CFLAGS += -mabi=aapcs -mthumb -march=armv7e-m -mtune=cortex-m4 -mlong-calls -mno-unaligned-access
    LDFLAGS += -march=armv7e-m -mtune=cortex-m4 -mthumb -lm -mabi=aapcs
endif

#################################################################################
# Dependency checks
#################################################################################

# Check for availability of ARM Toolchain for cross-compiation
ifeq ($(COMPILER),$(GCC_COMPILER))
ifndef ARM_GCC_HOME
    $(error ARM_GCC_HOME must point to the ARM Toolchain to support cross-compilation)
endif
else ifeq ($(COMPILER),$(IAR_COMPILER))
ifndef ARM_IAR_HOME
    $(error ARM_IAR_HOME must point to the ARM Toolchain to support cross-compilation)
endif
ifneq ($(OS),Windows_NT)
    $(error $(COMPILER) is only supported on Windows)
endif
else
    $(error $(COMPILER) is not supported!)
endif

#################################################################################
# Configure IAR License manager
#################################################################################

# Check for availability of ARM IAR Toolchain
ifeq ($(COMPILER),$(IAR_COMPILER))
    ifndef IAR_LICENSE_MGR_HOME
        $(error IAR_LICENSE_MGR_HOME must point to the directory where the IAR License Manager is located for IAR compilation)
    endif
endif

# Configure IAR license
ifeq ($(COMPILER),$(IAR_COMPILER))
    $(info IAR License configuration: $(shell $(IAR_LICENSE_MGR_EXEC) -s $(IAR_LICENSE_SERVER) -p ARM.EW))
endif
