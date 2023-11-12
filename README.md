# The quran package
Copyright © 2015-2023

The package is prepared for typesetting the holy Quran.
This work provides several macros for typesetting the whole or
any parts of the holy Quran based on its popular divisions.

## Sample Usage

```
\documentclass{article}

\usepackage{arabxetex}
\usepackage{quran}

\begin{document}

    \begin{arab}[utf]
        \quransurah
        \medskip
        \quransurah*[108]
    \end{arab}

\end{document}
```
![surah108](images/sample.png)

## Documentation
For more details, please refer to [this link](http://mirrors.ctan.org/macros/unicodetex/latex/quran/doc/quran-doc.pdf).


## License

[The LaTeX project public license (LPPL), version 1.3c](https://www.latex-project.org/lppl/lppl-1-3c/)

## Citation

```tex
@misc{quran,
  title={{quran}: An easy way to typeset any part of The Holy Quran},
  url={https://ctan.org/pkg/quran},
  note={Available at https://github.com/javadr/quran},
  author={Javad Razavian},
  year={2015},
}
```