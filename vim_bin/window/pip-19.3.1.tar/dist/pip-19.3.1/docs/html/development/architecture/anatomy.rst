.. note::
    This section of the documentation is currently being written. pip
    developers welcome your help to complete this documentation. If you're
    interested in helping out, please let us know in the `tracking issue`_.

****************************************
Repository anatomy & directory structure
****************************************

``pip``’s codebase (`GitHub repository`_) is structured as a standard Python package.


Root and tools
==============

The ``README``, license, ``pyproject.toml``, ``setup.py``, and so on are in the top level.

* ``AUTHORS.txt``
* ``LICENSE.txt``
* ``MANIFEST.in``
* ``NEWS.rst``
* ``pyproject.toml``
* ``README.rst``
* ``setup.cfg``
* ``setup.py``
* ``tox.ini`` -- ``pip`` uses Tox, an automation tool, configured by this `tox.ini`_ file. ``tox.ini`` describes a few environments ``pip`` uses during development for simplifying how tests are run (complicated situation there). Example: ``tox -e -py36``. We can run tests for different versions of Python by changing “36” to “27” or similar.
* ``.appveyor.yml``
* ``.coveragerc``
* ``.gitattributes``
* ``.gitignore``
* ``.mailmap``
* ``.readthedocs.yml``
* ``.travis.yml``
* ``docs/`` *[documentation, built with Sphinx]*

  * ``html/`` *[sources to HTML documentation avail. online]*
  * ``man/`` has man pages the distros can use by running ``man pip``
  * ``pip_sphinxext.py`` *[an extension -- pip-specific plugins to Sphinx that do not apply to other packages]*

* ``news/`` *[pip stores news fragments… Every time pip makes a user-facing change, a file is added to this directory (usually a short note referring to a GitHub issue) with the right extension & name so it gets included in release notes…. So every release the maintainers will be deleting old files in this directory? Yes - we use the towncrier automation to generate a NEWS file, and auto-delete old stuff. There’s more about this in the contributor documentation!]*

  * ``template.rst`` *[template for release notes -- this is a file towncrier uses…. Is this jinja? I don’t know, check towncrier docs]*

* ``src/`` *[source; see below]*
* ``tasks/`` *[invoke is a PyPI library which uses files in this directory to define automation commands that are used in pip’s development processes -- not discussing further right now. For instance, automating the release.]*
* ``tests/`` -- contains tests you can run. There are instructions in :doc:`../getting-started`.

  * ``__init__.py``
  * ``conftest.py``
  * ``data/`` *[test data for running tests -- pesudo package index in it!  Lots of small packages that are invalid or are valid. Test fixtures.  Used by functional tests]*
  * ``functional/`` *[functional tests of pip’s CLI -- end-to-end, invoke pip in subprocess & check results of execution against desired result. This also is what makes test suite slow]*
  * ``lib/`` *[helpers for tests]*
  * ``scripts/`` *[will probably die in future in a refactor -- scripts for running all of the tests, but we use pytest now. Someone could make a PR to remove this! Good first issue!]*
  * ``unit/`` *[unit tests -- fast and small and nice!]*
  * ``yaml/`` *[resolver tests! They’re written in YAML. This folder just contains .yaml files -- actual code for reading/running them is in lib/yaml.py . This is fine!]*

* ``tools`` *[misc development workflow tools, like requirements files & Travis CI files & helpers for tox]*
* ``.azure-pipelines``
* ``.github``
* ``.tox``



src directory
=============

In the root directory, the ``src/`` directory contains pip's core
source code. Within ``src/pip/``, ``_internal/`` has the pip code
that's written by pip maintainers, and ``_vendor/`` is pip's
dependencies (code from other packages).

Within ``src/``:

* ``pip.egg-info/`` *[ignore the contents for now]*
* ``pip/``

  * ``__init__.py``
  * ``__main__.py``
  * ``__pycache__/`` *[not discussing contents right now]*
  * ``_internal/`` *[where all the pip code lives that’s written by pip maintainers -- underscore means private. Pip is not a library -- it’s a command line tool! A very important distinction! People who want to install stuff with pip should not use the internals -- they should use the CLI. There’s a note on this in the docs.]*

    * ``__init__.py``
    * ``build_env.py`` [not discussing now]
    * ``cache.py`` *[has all the info for how to handle caching within pip -- cache-handling stuff. Uses cachecontrol from PyPI, vendored into pip]*
    * ``cli/`` *[subpackage containing helpers & additional code for managing the command line interface. Uses argparse from stdlib]*
    * ``commands/`` *[literally - each file is the name of the command on the pip CLI. Each has a class that defines what’s needed to set it up, what happens]*
    * ``configuration.py``
    * ``download.py``
    * ``exceptions.py``
    * ``index.py``
    * ``locations.py``
    * ``models/`` *[in-process refactoring! Goal: improve how pip internally models representations it has for data -- data representation. General overall cleanup. Data reps are spread throughout codebase….link is defined in a class in 1 file, and then another file imports Link from that file. Sometimes cyclic dependency?!?! To prevent future situations like this, etc., Pradyun started moving these into a models directory.]*
    * ``operations/`` -- a bit of a weird directory….. ``Freeze.py`` used to be in there. Freeze is an operation -- there was an operations.freeze. Then “prepare” got added (the operation of preparing a pkg). Then “check” got added for checking the state of an env.] [what’s a command vs an operation? Command is on CLI; an operation would be an internal bit of code that actually does some subset of the operation the command says. ``install`` command uses bits of ``check`` and ``prepare``, for instance. In the long run, Pradyun’s goal: ``prepare.py`` goes away (gets refactored into other files) such that ``operations`` is just ``check`` and ``freeze``..... … Pradyun plans to refactor this. [how does this compare to ``utils``?]
    * ``pep425tags.py`` -- getting refactored into packaging.tags (a library on PyPI) which is external to pip (but vendored by pip). :pep:`425` tags: turns out lots of people want this! Compatibility tags for built distributions -> e.g., platform, Python version, etc.
    * ``pyproject.py`` -- ``pyproject.toml`` is a new standard (:pep:`518` and :pep:`517`). This file reads pyproject.toml and passes that info elsewhere. The rest of the processing happens in a different file. All the handling for 517 and 518 is in a different file.
    * ``req/`` *[*\ **A DIRECTORY THAT NEEDS REFACTORING. A LOT**\ *\ …… Remember Step 3? Dependency resolution etc.? This is that step! Each file represents … have the entire flow of installing & uninstalling, getting info about packages…. Some files here are more than 1,000 lines long! (used to be longer?!) Refactor will deeply improve developer experience.]*
    * ``resolve.py`` -- This is where the current dependency resolution algorithm sits. Pradyun is `improving the pip dependency resolver`_. Pradyun will get rid of this file and replace it with a directory called “resolution”. (this work is in git master…. There is further work that is going to be in a branch soon)
    * ``utils/`` *[everything that is not “operationally” pip ….. Misc functions and files get dumped. There’s some organization here. There’s a models.py here which needs refactoring. Deprecation.py is useful, as are other things, but some things do not belong here. There ought to be some GitHub issues for refactoring some things here. Maybe a few issues with checkbox lists.]*
    * ``vcs/`` *[stands for Version Control System. Where pip handles all version control stuff -- one of the ``pip install`` arguments you can use is a version control link. Are any of these commands vendored? No, via subprocesses. For performance, it makes sense (we think) to do this instead of pygitlib2 or similar -- and has to be pure Python, can’t include C libraries, because you can’t include compiled C stuff, because you might not have it for the platform you are running on.]*
    * ``wheel.py`` is a file that manages installation of a wheel file. This handles unpacking wheels -- “unpack and spread”. There is a package on PyPI called ``wheel`` that builds wheels -- do not confuse it with this.

  * ``_vendor/`` *[code from other packages -- pip’s own dependencies…. Has them in its own source tree, because pip cannot depend on pip being installed on the machine already!]*

.. _`tracking issue`: https://github.com/pypa/pip/issues/6831
.. _GitHub repository: https://github.com/pypa/pip/
.. _tox.ini: https://github.com/pypa/pip/blob/master/tox.ini
.. _improving the pip dependency resolver: https://github.com/pypa/pip/issues/988
