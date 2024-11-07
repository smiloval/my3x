> This is a convenience project for re-compiling the 3x-ui and xray binaries by simply invoking `compile.sh` on a docker-powered host. 


## Usage
1. Checkout the consistent versions of sub-modules (3x-ui and Xray-core)
2. Modify the target platform details (including ubuntu/alpine in `FROM`) in the `Dockerfile` if needed
3. Invoke `compile.sh`
4. The 2 binaries will appear in the `out` dir
