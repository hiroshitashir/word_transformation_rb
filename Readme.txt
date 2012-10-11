Word Transformation
===================

_____________________________________________________________________________________
Programming Challenge: Word Transformation 

A word puzzle found in many newspapers and magazines is the word transformation. By taking a starting word and successively substituting a single letter to make a new word, one can build a sequence of words which changes the original word to a given end word. For instance, the word "spice" can be transformed in four steps to the word "stock" according to the following sequence: spice, slice, slick, stick, stock. Each successive word differs from the previous word in only a single character position while the word length remains the same.

Given a dictionary of words from which to make transformations, plus a starting and ending word, your goal is to write a program to determine the sequence of words in the shortest possible transformation.

_____________________________________________________________________________________
Pre-requirement:
 - Install kanwei algorithm 
   1. change directory to kanwei
   2. gem install algorithms
  
_____________________________________________________________________________________
Input and Output

The program should be written in ruby, and be invoked with a command line of the following form:

ruby Main.rb DICTIONARYFILE STARTWORD ENDWORD

and it should produce as output only the series of words in the transformation, one per line, written to standard out. The program should then exit.

We have supplied two sample dictionary files, 850words.txt and 17words.txt. 

Sample Command Input/Output
  ruby Main.rb 17words.txt dip sap
  
  