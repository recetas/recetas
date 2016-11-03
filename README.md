# Recetas

Recetas is a git repository with food recipes. Most are low-carb, all are tasty.

#### How to open a terminal window
Commands shown below must be run in a terminal window. On a mac, this can be the Terminal or iTerm application.

#### Download Recetas
This only has to be done once. After opening a terminal window, run
```
cd ~
mkdir git
git clone https://github.com/recetas/recetas.git
```
This will install Recetas in ``${HOME}/git/recetas``. In the remainder of this document, we will assume that Recetas is installed in that directory.

#### Make sure your recetas are up-to-date
This should be done every time someone else has added or changed recipes.

In a terminal window, run
```
cd ~/git/recetas
git checkout master
git pull origin master
```

#### How to add a recipe
- Make sure you have downloaded Recetas, and that it is up-to-date (see above for instructions).
- Recipes are in the ``doc/source`` directory.
- Think of a name for your recipe, and use it to construct a *prefix* for the filenames. There will be one file with the text of the recipe, and zero or more files with photos. To keep everything organized, we use the same prefix for the text and all photos. It is recommended to not use uppercase letters or spaces in the prefix. For example, if your recipe is based on perch, you can use ``perch`` as a prefix.
- You can take an existing ``.rst`` recipe text file as a starting point, copy the file, and rename it to have start the prefix. You can open the ``.rst`` file in a editor such as TextEdit, and then change the text to describe the new recipe. See the ``*.rst`` files in ``doc/source`` as an example
- Images should be converted to .jpg. If they are in another format, place them in a directory and use a program such as ``mogrify`` to convert them to jpg. Make sure all filenames start with the prefix, and move them to the ``doc/source/_static`` directory.
- The ``.rst`` file should be added to ``index.rst``, so that the new recipe appears in the table of contents.

### Building the recipes

The recipes can be converted to ``html`` web format, or to ``epub`` book format. To do so, open a terminal window, then run

- for html:

    ```
    cd ~/git/recetas/doc
    make html
    open build/html/index.html
    ```

- for epub:

    ```
    cd ~/git/recetas/doc
    make epub
    open build/epub/Recetas.epub

- to update github pages:

    ```
    cd ~/git/recetas/doc
    make gh
    open https://recetas.github.io
    ```

### Adding the recipe to a git repository

- Before adding a new recipe to the repository, make sure it can be converted to html without problems, that all the images are present, and generally everything looks fine.
- Tell ``git`` about any the new files. For example, if your new recipe is ``garlic_sauce.rst`` and you also added images ``garlic_sauce01.jpg`` and ``garlic_sauce02.rst`` in the ``_static`` directory, you can run
    ```
    cd ~/git/recetas
    git add garlic_sauce.rst
    git add _static/garlic_sauce*.jpg
    ```
  If necessary, run ``git status`` to see which files have been added.
- It is also possible to update the contents of all files, by running
    ```
    git add -u
    ```
- When all changes have (``git status`` does not mention any untracked files), you can commit the changes using
    ```
    git commit -m 'NF: added new recipe for garlic sauce'
    ```
- Finally, to update the repository online (on github), run
    ```
    git push origin master
    ```
  If other people now run ``git pull origin master``, they will receive the changes you just made.


### Contact
Karen E. Cuculiza Mendoza, karen dot cuculiza at gmail dot com
Nikolaas N. Oosterhof, nikolaas dot oosterhof at unitn dot it

### License

(The MIT License)

Copyright (c) 2016 Karen E. Cuculiza Mendoza, Nikolaas N. Oosterhof

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction,
including without limitation the rights to use, copy, modify, merge,
publish, distribute, sublicense, and/or sell copies of the Software,
and to permit persons to whom the Software is furnished to do so,
subject to the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.


