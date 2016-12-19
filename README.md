# uncons

Somewhat naive, thread-safe head|tail destructuring for Luca Ongaro's Immutable library.

It's a toy implementation that adds path copying to the 'left side' of the hybrid trie 
implemented by Luca. It fits my need for a proper 'uncons' mechanism but I would 
not recommend using it against really big data structures.

If you are interested in persistent data structures, I would recommend researching 
balanced binary trees and reading any publication by Chris Okasaki.

## Installation

Add this to your application's `shard.yml`:

```yaml
dependencies:
  uncons:
    github: fusion/uncons.cr
```


## Usage

```crystal
require "uncons"
```

You get, for Vector only: `uncons` `head` `head?` `tail` `tail?`

## Contributing

1. Fork it ( https://github.com/fusion/uncons/fork )
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request

## Contributors

- [fusion](https://github.com/fusion) Chris F Ravenscroft - creator, maintainer
