import unittest
from context import mathstudentsim

class TestCLI(unittest.TestCase):
    """
    Class for testing the command interface.
    """

    def test_quit(self):
        cli = mathstudentsim.cli.CLI()
        cli.onecmd('q')




if __name__ == '__main__':
    unittest.main()

