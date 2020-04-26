# Project Structure
| Directory            | Description                              |
| -------------------- | ---------------------------------------- |
| contacts             | Test microservice                        |
| customer_info_server | Test microservice                        |
| hello                | Ruby project template                    |
| hello_rails          | Rails project template                   |
| login_test           | Test microservice                        |
| micromanage          | Engine for exposing microservice API     |
| panel                | Control panel for apps with Micromanage  |

# Setting up your environment
You only need to install 2 dependencies:

## Installing Nix
Nix is a package manager that works by having instructions on how to build a program from scratch.

The simplist way to install it is by installing it from your operating system's package manager or executing `curl https://nixos.org/nix/install | sh` in order to get the latest version.

## Installing direnv
Direnv is a program which managers environmental variables. Direnv is able to load environmental variables when you enter a directory and unload them when you leave a directory. Direnv is used so that all the dependencies you need will be available once you enter any of the subprojects.

You should be able to install direnv from your operating system's regular package manager. Make sure that your version is >= 2.18.2. You can check this by executing `direnv --version` after installing it. After installing direnv follow https://direnv.net/docs/hook.html in order to integrate it with your shell.

# Using your environment
After getting your environment setup all you have to do is change into the project directory. For the first time you do this and after anytime the environment changes it will need to rebuild the environment. The first time this happens will take extra long since it needs to download all the needed resources. On the first time you enter a direnv directory there will be a warning that says that loading .envrc has been blocked. To get pass this you must run `direnv allow` so that it can run the commands to setup the environment.

Alternatively, if you can not get direnv working you can still work on the project by manually invoking nix-shell. By default it will look for a shell.nix to load. You can also manually specify the location of the shell.nix to use. Since there are different shells for different projects it is recommended to stick with direnv.

# Adding a dependency
Add the dependency to the Gemfile file and then run `bundix -l`. You will then need to rebuild your environment. This will happen after you execute a command in the environment or leave and reenter it.

# Running project
$ cd panel

$ rails s

# Setting Up Your Own nixpkgs
The nixpkgs repository contains instructions on how to build numerous packages including packages this project uses like Ruby and Node.JS. The nixpkgs-version.json file contains a link to the repository along with the revision. The nixpkg repository used needs to have the 8210ea3d606310a7f4595e7f5218ca71185f9ef4 commit cherry picked in. This commit makes Nix less pure, but allows for using the engine gem as a library in the microservices. If you want to update to the latest version of packages you can pull from [upstream](https://github.com/nixos/nixpkgs).
