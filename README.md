SME Mode
========

[![License GPL 3][badge-license]]

SME Mode is a major mode for [GNU Emacs][]  which adds support for the
SAP [CPQ][] solution modeling language.  The SME is a solution modeling
environment provided by [SAP SE]. This mode supports SSC 2 and later.

This mode needs GNU Emacs 24.  It will **not** work with GNU Emacs 23 and below.
It has not been tested with other flavors of Emacs (e.g. Prelude).

Features
---------
1. Syntax highlighting
2. Indentation and alignment of expressions and statements
3. Tag navigation

Installation
--------------

Clone from Github:
```git clone https://github.com/mjj55409/sme-mode.git```

Add your your .emacs.d/init.el file:

```
(add-to-list 'load-path (<your-path-to-sme-mode>))
(require 'sme-mode)
```

Usage
------

The major mode is enabled automatically for SME files with the extension '.ssc'.

Support
-------
Feel free to ask question or make suggestions in our [issue tracker][].

Contribute
-----------
- [Issue tracker][]
- [Github][]

License
--------

SME Mode is free software: you can redistribute it and/or modify it under the
terms of the GNU General Public License as published by the Free Software
Foundation, either version 3 of the License, or (at your option) any later
version.

SME Mode is distributed in the hope that it will be useful, but WITHOUT ANY
WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
PARTICULAR PURPOSE.  See the GNU General Public License for more details.


[badge-license]: https://img.shields.io/badge/license-GPL_3-green.svg
[GNU Emacs]: https://www.gnu.org/software/emacs/
[Issue tracker]: https://github.com/mjj55409/sme-mode/issues
[Github]: https://github.com/mjj55409/sme-mode
[CPQ]: http://help.sap.com/saphelp_ssc200/helpdata/en/6a/9242f91caf457489cdfb1bf0ed5c3e/content.htm?frameset=/en/f4/ee271973864f48ad502c070b50ef8a/frameset.htm&current_toc=/en/a2/78d0b2f38d4684a4f5750eca31947a/plain.htm&node_id=8&show_children=false
[SAP SE]: https://en.wikipedia.org/wiki/SAP_SE
