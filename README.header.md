# code-skel

This repository is a collection of small language-specific skeleton projects, with a heavy emphasis on HDL designs.  
Each directory provides just enough structure (Makefiles, configs, placeholders) to let you:

- Open in an editor with language-server support already working
- Run a build or simulation with minimal setup
- Experiment or debug without re-wiring tools every time

The intent is not to be a one-stop framework, but to save time when starting small code fragments or tests.

# Prerequisites

The following third-party tools are commonly expected:

- Mentor Graphics QuestaSim or ModelSim
- Either `universal-ctags` or `exuberant-ctags`
- Precompiled Xilinx and Altera simulation libraries available at runtime

There is also an implicit dependency on tool locations defined by the
`TOOLS_ROOT` environment variable. For example, it is expected that locations
like `$TOOLS_ROOT/Xilinx/Vivado/$VIVADO_VERSION/settings.sh` can be found. If
your tool locations and layout vary from that, and it is quite likely they
will, edit the `tools.conf` as needed. In general, ECAD tools are very
sensitive to their enviroments, so some modification may be needed.

---

Each language directory includes its own `README.md` (starting with a section
header such as `## VHDL`) that documents setup and usage. The top-level README
can be rebuilt by concatenating those sub-readmes under this introduction.

# Languages
