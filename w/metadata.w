Metadata
********

This section covers the app's metadata, information about the app itself.

First we'll set up the metadata test class.

@d TestMetadata
@{class TestMetadata(unittest.TestCase):
    """
    Class for testing the app's metadata.
    """

@<Version Number Test@>
@}

Version Number
==============

Let's make sure we've set the version number we expect.

@d Version Number Test
@{    def test_version_number(self):
        mathstudentsim.__version__ == '0.0.1'
@}

Now we'll set the version number for the package.

@d Version Number
@{__version__ = '0.0.1'
@}

For now that's all the metadata I'm defining in the .w files.

