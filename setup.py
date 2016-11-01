try:
    from setuptools import setup
except ImportError:
    from distutils.core import setup
from mathstudentsim import __version__

config = {
    'name': 'Math Student Simulator',
    'description': 'A project for learning math by implementing it in Python',
    'author': 'Andy Culbertson',
    'author_email': 'thinkulum@gmail.com',
    'url': 'https://github.com/thinkulum/math-student-sim',
    'download_url': 'https://github.com/thinkulum/math-student-sim/tarball/%s' % __version__,
    'version': __version__,
    'packages': ['mathstudentsim'],
    'install_requires': ['docutils', 'nose2'],
}

setup(**config)