---
title: Shell
sidebar: picoruby_sidebar
permalink: Shell.html
folder: rbs_doc
---
## Singleton methods
### new

```ruby
Shell.new(?clean: bool) -> void
```
### next_executable

```ruby
Shell.next_executable-> {code: String, name: String}
```
## Instance methods
### run_irb

```ruby
run_irb-> void
```
### run_shell

```ruby
run_shell-> void
```
### setup_root_volume

```ruby
setup_root_volume(Symbol drive, ?label: String) -> void
```
### setup_system_files

```ruby
setup_system_files(?force: bool) -> void
```
### show_logo

```ruby
show_logo-> nil
```
### simple_question

```ruby
simple_question(String question) { (String answer) -> boolish } -> void
```
### start

```ruby
start(?:shell mode) -> nil
```
