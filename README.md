rust-workspace-102
==

## References

* [Structuring larger Rust projects with Cargo Workspaces](https://youtu.be/S3c7NRS698A?si=7Gsx181KzqJqrFwe) - **Let's Get Rusty ** (YouTube)
* [Even Better TOML](https://marketplace.visualstudio.com/items?itemName=tamasfe.even-better-toml) - VS Code extension for syntax highlighting

## Usage

TODO

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

### Workspace

```toml
[workspace]

members = [
    "blog_api",
    "blog_web",
    "blog_shared"
]
```

### Create workspaces

* Create workspace so git 
* Using `--vcs none` so a git repo isn't created just for the child workspace

#### blog_api (binary)

```sh
cargo new --vcs none blog_api
```

* Ignore complaints about other workspace missing - will add soon

```

#### blog_web (binary)

```sh
cargo new --vcs none blog_web
```
#### blog_shared (lib)

```sh
cargo new --vcs none --lib blog_shared
```

### Tree View

* Can probably remove root src/main.rs

```sh
% tree -I "target"                      
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
├── blog_web
│   ├── Cargo.toml
│   └── src
│       └── main.rs
└── src
    └── main.rs
```