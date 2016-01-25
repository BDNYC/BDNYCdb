#! /usr/bin/env python
# -*- coding: utf-8 -*-

try:
    from setuptools import setup, find_packages
    setup
except ImportError:
    from distutils.core import setup
    setup

from codecs import open
from os import path

setup(
    name='BDNCYdb',
    version='1.0.0',
    description='Version controlled data releases of the BDNYC Database',
    url='https://github.com/BDNYC/BDNYCdb.git',
    author='Joe Filippazzo',
    author_email='bdnyc.group@gmail.com',
    license='MIT',
    classifiers=[
        'Development Status :: 4 - Beta',
        'Intended Audience :: Science/Research',
        'License :: OSI Approved :: MIT License',
        'Programming Language :: Python',
    ],
    keywords='astrophysics',
    packages=find_packages(exclude=['contrib', 'docs', 'tests*']),
    install_requires=[],

)