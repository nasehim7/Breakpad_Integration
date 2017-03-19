# This file is generated by gyp; do not edit.

TOOLSET := target
TARGET := client_tests
DEFS_Debug := \
	'-DNO_HEAPCHECKER' \
	'-D_VARIADIC_MAX=10' \
	'-D_DEBUG'

# Flags passed to all source files.
CFLAGS_Debug := \
	-pthread \
	-fno-exceptions \
	-Wno-unused-parameter \
	-Wno-missing-field-initializers \
	-D_FILE_OFFSET_BITS=64 \
	-fvisibility=hidden \
	-fno-strict-aliasing \
	-O0 \
	-g

# Flags passed to only C files.
CFLAGS_C_Debug :=

# Flags passed to only C++ files.
CFLAGS_CC_Debug := \
	-frtti \
	-fno-threadsafe-statics \
	-fvisibility-inlines-hidden

INCS_Debug := \
	-Itesting/include \
	-Itesting/gtest/include \
	-Itesting/googletest/include \
	-Itesting/googletest \
	-Itesting/googlemock/include \
	-Itesting/googlemock \
	-Itesting \
	-I.

DEFS_Release := \
	'-DNO_HEAPCHECKER' \
	'-D_VARIADIC_MAX=10' \
	'-DNDEBUG' \
	'-DNVALGRIND' \
	'-DOFFICIAL_BUILD'

# Flags passed to all source files.
CFLAGS_Release := \
	-pthread \
	-fno-exceptions \
	-Wno-unused-parameter \
	-Wno-missing-field-initializers \
	-D_FILE_OFFSET_BITS=64 \
	-fvisibility=hidden \
	-fno-strict-aliasing \
	-O2 \
	-fno-ident \
	-fdata-sections \
	-ffunction-sections

# Flags passed to only C files.
CFLAGS_C_Release :=

# Flags passed to only C++ files.
CFLAGS_CC_Release := \
	-frtti \
	-fno-threadsafe-statics \
	-fvisibility-inlines-hidden

INCS_Release := \
	-Itesting/include \
	-Itesting/gtest/include \
	-Itesting/googletest/include \
	-Itesting/googletest \
	-Itesting/googlemock/include \
	-Itesting/googlemock \
	-Itesting \
	-I.

OBJS := \
	$(obj).target/$(TARGET)/client/windows/unittests/exception_handler_test.o \
	$(obj).target/$(TARGET)/client/windows/unittests/exception_handler_death_test.o \
	$(obj).target/$(TARGET)/client/windows/unittests/exception_handler_nesting_test.o \
	$(obj).target/$(TARGET)/client/windows/unittests/minidump_test.o \
	$(obj).target/$(TARGET)/client/windows/unittests/dump_analysis.o \
	$(obj).target/$(TARGET)/client/windows/unittests/crash_generation_server_test.o

# Add to the list of files we specially track dependencies for.
all_deps += $(OBJS)

# Make sure our dependencies are built before any of us.
$(OBJS): | $(obj).target/client/windows/unittests/libgtest.a $(obj).target/client/windows/unittests/libgmock.a $(obj).target/client/windows/libcommon.a $(obj).target/client/windows/crash_generation/libcrash_generation_server.a $(obj).target/client/windows/crash_generation/libcrash_generation_client.a $(obj).target/client/windows/handler/libexception_handler.a $(obj).target/client/windows/unittests/libprocessor_bits.a

# CFLAGS et al overrides must be target-local.
# See "Target-specific Variable Values" in the GNU Make manual.
$(OBJS): TOOLSET := $(TOOLSET)
$(OBJS): GYP_CFLAGS := $(DEFS_$(BUILDTYPE)) $(INCS_$(BUILDTYPE))  $(CFLAGS_$(BUILDTYPE)) $(CFLAGS_C_$(BUILDTYPE))
$(OBJS): GYP_CXXFLAGS := $(DEFS_$(BUILDTYPE)) $(INCS_$(BUILDTYPE))  $(CFLAGS_$(BUILDTYPE)) $(CFLAGS_CC_$(BUILDTYPE))

# Suffix rules, putting all outputs into $(obj).

$(obj).$(TOOLSET)/$(TARGET)/%.o: $(srcdir)/%.cc FORCE_DO_CMD
	@$(call do_cmd,cxx,1)

# Try building from generated source, too.

$(obj).$(TOOLSET)/$(TARGET)/%.o: $(obj).$(TOOLSET)/%.cc FORCE_DO_CMD
	@$(call do_cmd,cxx,1)

$(obj).$(TOOLSET)/$(TARGET)/%.o: $(obj)/%.cc FORCE_DO_CMD
	@$(call do_cmd,cxx,1)

# End of this set of suffix rules
### Rules for final target.
LDFLAGS_Debug := \
	-pthread \
	-Wl,-z,noexecstack \
	-rdynamic

LDFLAGS_Release := \
	-pthread \
	-Wl,-z,noexecstack \
	-Wl,--gc-sections

LIBS :=

$(builddir)/client_tests: GYP_LDFLAGS := $(LDFLAGS_$(BUILDTYPE))
$(builddir)/client_tests: LIBS := $(LIBS)
$(builddir)/client_tests: LD_INPUTS := $(OBJS) $(obj).target/client/windows/unittests/libgtest.a $(obj).target/client/windows/unittests/libgmock.a $(obj).target/client/windows/libcommon.a $(obj).target/client/windows/crash_generation/libcrash_generation_server.a $(obj).target/client/windows/crash_generation/libcrash_generation_client.a $(obj).target/client/windows/handler/libexception_handler.a $(obj).target/client/windows/unittests/libprocessor_bits.a
$(builddir)/client_tests: TOOLSET := $(TOOLSET)
$(builddir)/client_tests: $(OBJS) $(obj).target/client/windows/unittests/libgtest.a $(obj).target/client/windows/unittests/libgmock.a $(obj).target/client/windows/libcommon.a $(obj).target/client/windows/crash_generation/libcrash_generation_server.a $(obj).target/client/windows/crash_generation/libcrash_generation_client.a $(obj).target/client/windows/handler/libexception_handler.a $(obj).target/client/windows/unittests/libprocessor_bits.a FORCE_DO_CMD
	$(call do_cmd,link)

all_deps += $(builddir)/client_tests
# Add target alias
.PHONY: client_tests
client_tests: $(builddir)/client_tests

# Add executable to "all" target.
.PHONY: all
all: $(builddir)/client_tests

