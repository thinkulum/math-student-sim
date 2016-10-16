#########
Interface
#########

Command line interface
**********************

Math Student Simulator will have an interactive command line interface using Python's cmd library, which does a lot of the work for us. All we need to do to start out with is import the module and subclass Cmd.

@o mathstudentsim/cli.py
@{import cmd

class CLI(cmd.Cmd):
    """
    Class for defining the command interface.
    """

@<q Command@>
@}

Then in the application launch script, we instantiate our subclass and call cmdloop(), which handles the interactive prompt.

To get to the CLI class, we'll just load the whole package.

@o app.py
@{import mathstudentsim

def main():
    cli = mathstudentsim.cli.CLI()
    cli.cmdloop()


if __name__ == '__main__':
    main()
@}

To make sure the cli module loads when we import the package, we'll list it in the package's __init__.py.

@o mathstudentsim/__init__.py
@{from . import cli
@}

Testing
*******

I'm viewing the testing framework as another interface for the program. We'll use the standard unittest library for the tests and `nose2 <https://github.com/nose-devs/nose2>`_ to run them.

We have to import unittest and the app's package. But to give us the freedom to import the latter from wherever we want, we'll import it from a separate module that will specify its location.

@o tests/test.py
@{import unittest
from context import mathstudentsim

@<TestCLI@>


@<If tests Run as Script@>
@}

In that context module, we'll edit sys.path so the first place Python looks for the package is the local package's parent directory. That way we don't have to install the package into site-packages every time we make changes and want to test them.

@o tests/context.py
@{import os
import sys
sys.path.insert(0, os.path.abspath('..'))

import mathstudentsim
@}

If test.py is run as a script, we'll have it run the tests using unittest's main() function.

@d If tests Run as Script
@{if __name__ == '__main__':
    unittest.main()
@}

Quitting
********

Now we can start adding commands. The first will be a basic function: quitting the application.

Let's start with a test to define the behavior we want. We'll put it in a class for testing the command line interface.

@d TestCLI
@{class TestCLI(unittest.TestCase):
    """
    Class for testing the command interface.
    """

@<q Command Test@>
@}

The command to quit will be ``q``. The command function will be self-contained rather than calling a function from elsewhere, and all we'll test is whether it returns True, which is how cmdloop() knows to end. We'll use Cmd's onecmd() function to send the command to the interface.

@d q Command Test
@{    def test_quit(self):
        cli = mathstudentsim.cli.CLI()
        cli.onecmd('q')
@}



@d q Command
@{    def do_q(self, arg):
        """Quit the application."""
        print('Bye!')
        return True
@}

.. include:: <xhtml1-lat1.txt>
.. include:: <xhtml1-special.txt>
.. include:: <xhtml1-symbol.txt>
.. include:: <isoamsa.txt>