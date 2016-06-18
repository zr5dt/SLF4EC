#################################################################################
#            ___________      .__.__  .__  .__               __                 #
#            \__    ___/______|__|  | |  | |__|____    _____/  |_               #
#              |    |  \_  __ \  |  | |  | |  \__  \  /    \   __\              #
#              |    |   |  | \/  |  |_|  |_|  |/ __ \|   |  \  |                #
#              |____|   |__|  |__|____/____/__(____  /___|  /__|                #
#                                                  \/     \/                    #
#                                         Networks Inc.                         #
# File:    makeRules.mk                                                         #
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

#################################################################################
# Built-in suffix rules
#################################################################################

# Disable built-in rules to help speed things up.
MAKEFLAGS += --no-builtin-rules -r
SUFFIXES :=
.SUFFIXES:

#################################################################################
# Built-in variables
#################################################################################
# These variables come from https://www.gnu.org/software/make/manual/html_node/Implicit-Variables.html

AR			:=
AS			:=
CC			:=
CXX			:=
CPP			:=
FC			:=
M2C			:=
PC			:=
CO			:=
GET			:=
LEX			:=
YACC		:=
LINT		:=
MAKEINFO	:=
TEX			:=
TEXI2DVI	:=
WEAVE		:=
CWEAVE		:=
TANGLE		:=
CTANGLE		:=
RM			:=

ARFLAGS		:=
ASFLAGS		:=
CFLAGS		:=
CXXFLAGS	:=
COFLAGS		:=
CPPFLAGS	:=
FFLAGS		:=
GFLAGS		:=
LDFLAGS		:=
LDLIBS		:=
LFLAGS		:=
YFLAGS		:=
PFLAGS		:=
RFLAGS		:=
LINTFLAGS	:=

#################################################################################
# Re-instate Trilliant default rules
#################################################################################

include $(abspath $(dir $(lastword $(MAKEFILE_LIST))))/compiler.mk