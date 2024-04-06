rust-workspace-102
==

## Usage

```sh
make
```

```sh
PROJECT=blog_api make run
```

```sh
PROJECT=blog_web make run
```

```sh
make clean
```

## References

* [Cargo Workspaces](https://doc.rust-lang.org/book/ch14-03-cargo-workspaces.html)
* [rust-workspace-101](https://github.com/mitchallen/rust-workspace-101)
* [Structuring larger Rust projects with Cargo Workspaces](https://youtu.be/S3c7NRS698A?si=7Gsx181KzqJqrFwe) - **Let's Get Rusty ** (YouTube)
* [Even Better TOML](https://marketplace.visualstudio.com/items?itemName=tamasfe.even-better-toml) - VS Code extension for syntax highlighting



* * *

## Notes

### Setup 

* Differs from referenced video:

```sh
cargo new rust-workspace-102
ls -ls
cd rust-workspace-102
```

#### Root src

* Depending on the structure of your monorepo, it may or may not make sense to remove the root src folder.
* If there is no root src then the root Cargo.toml is referred to as a "virtual manifest"
* Otherwise the whole thing is a "package"
* Since we don't want to build a package, remove the root src folder and edit the Cargo.toml file (see below)

### Removed root src

```sh
rm -rf src
```

### Workspace

* Replace the contents of the root Cargo.toml with the workspace / members definition.

```toml
# [package]
# name = "rust-workspace-102"
# version = "0.1.0"
# edition = "2021"

[workspace]

members = [
    "blog_api",
    "blog_web",
    "blog_shared"
]

# See more keys and their definitions at https://doc.rust-lang.org/cargo/reference/manifest.html

# [dependencies]
```

### Create workspaces

* Create workspaces
* Using `--vcs none` so a git repo isn't created just for the child workspace

#### blog_api (binary)

```sh
cargo new --vcs none blog_api
```
* Ignore complaints about other workspace missing - will add soon

#### blog_web (binary)

```sh
cargo new --vcs none blog_web
```

#### blog_shared (lib)

```sh
cargo new --vcs none --lib blog_shared
```

### Tree View

* Remove root src/main.rs

```sh
% tree      
.
├── Cargo.lock
├── Cargo.toml
├── README.md
├── blog_api
│   ├── Cargo.toml
│   └── src
│       └── main.rs
├── blog_shared
│   ├── Cargo.toml
│   └── src
│       └── lib.rs
└── blog_web
    ├── Cargo.toml
    └── src
        └── main.rs
```

## Cargo build

```sh
cargo build
```

Each target will be created.

## Target specific packages

You can target an individual package with the `-p` flag:

```sh
cargo build -p blog_api
```
