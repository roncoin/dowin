package=native_libdmg-hfsplus
$(package)_version=0.1
$(package)_download_path=https://github.com/theuni/libdmg-hfsplus/archive/
$(package)_file_name=libdmg-hfsplus-v$($(package)_version).tar.gz

$(package)_build_subdir=build

define $(package)_preprocess_cmds
  mkdir build
endef

define $(package)_config_cmds
  cmake -DCMAKE_INSTALL_PREFIX:PATH=$(build_prefix)/bin ..
endef

define $(package)_build_cmds
  $(MAKE) -C dmg
endef

define $(package)_stage_cmds
  $(MAKE) DESTDIR=$($(package)_staging_dir) -C dmg install
endef
