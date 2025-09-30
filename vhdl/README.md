## VHDL

Intended as a minimal starting point for experimenting and debugging with VHDL. Add
design files to `rtl/` and list them in `filelist.f` to have them included in the build.

- Run `make smoke` to check that environment variables are set and that
  Xilinx and Altera simulation libraries can be found. Lists contents of simulaton libraries using `vdir`.
- Compiles all files listed in `rtl/filelist.f`. Requires that the `vlib`, `vcom`, et. al. are in `PATH`.
- Top level placeholder entity `top.vhd` to start with
- Use `make ctags` to generate an editor tags file from the sources under `rtl/`
