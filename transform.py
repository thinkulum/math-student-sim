import sys
import os
from glob import glob
import unittest.mock
import pyweb
import docutils.core


def main():
    run_pyweb('mathstudentsim')
    rst2html()


def run_pyweb(package):
    """From the .w files, weave reStructuredText documentation files, and tangle 
    source code files. The .rst files are written to the w directory, and the 
    code files are written to the paths indicated in the .w files."""
    # Temporarily set the command line arguments for pyweb. It's looking for the 
    # input path.
    with unittest.mock.patch('sys.argv', ['', 'w/%s.w' % package]):
        # Configure the pyweb logger so it prints to the terminal.
        with pyweb.Logger(pyweb.log_config):
            # Process the .w files.
            pyweb.main()


def rst2html():
    """Convert the reStructuredText to HTML files. The HTML files are written to 
    the docs directory."""
    # Get the files to process.
    rst_paths = glob('w/*.rst')
    for path in rst_paths:
        # Get the root from the input path to use for the HTML filenames.
        fn_root = os.path.splitext(os.path.basename(path))[0]
        # Process the .rst file. The 'dump_pseudo_xml' setting disables printing 
        # the output to the terminal.
        docutils.core.publish_file(
            writer_name='html', 
            source_path='w/%s.rst' % fn_root, 
            destination_path='docs/%s.html' % fn_root, 
            settings_overrides={'dump_pseudo_xml': None})


if __name__ == '__main__':
    main()