# Markdown notes tagger

**IMPORTANT NOTES: Please backup all your raw note files before processing with the script. Hint: use `cp` with `-a` option can preserve the original timestamps, as [this answer and its comment indicated](https://superuser.com/a/114198).**

## Feature

- Only one feature: Insert metadata headers to markdown (with `.md` filename extension) files

For example, the file `some note.md` located under `/some/path/notes/ideas/some note.md` with following contents

```
# This is a test note

some note details
```

will become

```
---
tags: [Notebooks/ideas]
title: some note
created: '2019-12-05T10:34:30+01:00'
modified: '2019-12-05T10:34:30+01:00'
---

# This is a test note

some note details
```

Please note that the script will **preserve** the modified time of the original files and use this timestamp for both the added `created` and `modified` headers.

### Requirements and environments

- `realpath`

Has been tested under:

- Ubuntu 18.04
- GNU bash, version 4.4.20(1)-release (x86_64-pc-linux-gnu)

## Usage

Clone the repo and run the following command under the project path

```
./add-note-header.sh $NOTE_ROOT_PATH
```

where `$NOTE_ROOT_PATH` is the root path where note md files are stored.

e.g. (also as a test)

```
./add-note-header.sh ./testbed
```

## Why do I need this tagger?

To make some markdown note applications (like the awesome [Notable app](https://notable.md/)) can read the notes organized as plain markdown files in such a directory structure as the `testbed` in this project:

```
testbed/
├── english-中文 空格 hybrid-name-test.md
├── notebook
│   ├── english-中文 空格 hybrid-name-test.md
│   ├── some-other-test.md
│   ├── test-header.md
│   └── 中文标题.md
├── notebook 1
│   ├── english-中文 空格 hybrid-name-test.md
│   ├── some-other-test.md
│   ├── test-header.md
│   └── 中文标题.md
├── notebook 笔记本
│   ├── english-中文 空格 hybrid-name-test.md
│   ├── some-other-test.md
│   ├── test-header.md
│   └── 中文标题.md
├── some-other-test.md
├── test-header.md
├── 中文标题.md
├── 空目录
├── 笔记本
│   ├── english-中文 空格 hybrid-name-test.md
│   ├── some-other-test.md
│   ├── test-header.md
│   └── 中文标题.md
└── 笔记本 2
    ├── english-中文 空格 hybrid-name-test.md
    ├── some-other-test.md
    ├── test-header.md
    └── 中文标题.md
```

I wrote a simple bash script to insert the necesary headers into each markdown files. As of now, I think, this is the least aggressive way of reorganizing the existing note files. And it makes sense to me to add these tags as metadata.
