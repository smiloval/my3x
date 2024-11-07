> This is a convenience project for re-compiling the 3x-ui and xray binaries by simply invoking `compile.sh` on a docker-powered host. 


## Usage
0. Clone this repo
1. Run `git submodule init` + `git submodule update` to pull submodules' files
   * Checkout other consistent versions of submodules (`3x-ui` and `Xray-core`) if needed
2. Modify the target platform details (including ubuntu/alpine in `FROM`) in the `Dockerfile` if needed
3. Invoke `compile.sh`
4. The 2 binaries will appear in the `out` dir
