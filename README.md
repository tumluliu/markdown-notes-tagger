# Markdown notes tagger

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

Please note that the script will *reserve* the modified time of the original files and use this timestamp for both the added `created` and `modified` headers.

## Usage

Has been tested under:

- Ubuntu 18.04
- GNU bash, version 4.4.20(1)-release (x86_64-pc-linux-gnu)

run the following command

```
./add-note-header.sh NOTE_ROOT_PATH
```

e.g. (also as a test)

```
./add-note-header.sh ./testbed
```

## Why do I need this tagger?

To make some markdown note applications (like the awesome Notable) can read the notes organized as plain markdown files in such a directory structure as the `testbed` in this project:

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
