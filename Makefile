# Default target executed when no arguments are given to make.
default: build

# Sets the Rust toolchain to use. Override by setting RUST_TOOLCHAIN in your environment.
RUST_TOOLCHAIN ?= stable
CARGO = cargo +$(RUST_TOOLCHAIN)

# Project-specific variables
BLOG_API = blog_api
BLOG_WEB = blog_web

.PHONY: build test run clean release build-blog_api build-blog_web

# Build all projects
build: 
	$(CARGO) build

# Test all projects
test:
	$(CARGO) test

# Run a specific project (e.g., make run PROJECT=blog_web)
run:
	$(CARGO) run -p $(PROJECT)

# Clean up the project
clean:
	$(CARGO) clean

# Release builds (optimized)
release:
	$(CARGO) build --release

# Build blog_api specifically
build-blog-api:
	$(CARGO) build -p $(BLOG_API)

# Build blog_web specifically
build-blog-web:
	$(CARGO) build -p $(BLOG_WEB)