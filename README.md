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

### Workspace

```toml
[workspace]

members = [
    "blog_api",
    "blog_web",
    "blog_shared"
]
```





