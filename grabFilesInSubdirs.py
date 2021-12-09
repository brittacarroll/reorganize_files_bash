import pdb
import os
import sys

numDirs = 20
numFiles = 20

# for directoryNum in range(numDirs+1):
#     dirToCreate = '/Users/Britta/Desktop/test{}'.format(directoryNum)
#     os.mkdir(dirToCreate)
#     for fileNum in range(numFiles+1):
#         fileName = 'test{}.jpg'.format(fileNum)
#         fileToCreate = os.path.join(dirToCreate, fileName)

#         open(fileToCreate, 'w')

directory = os.getcwd()
pdb.set_trace()
filesToGrab = []
for root, subdirectories, files in os.walk(directory):
    # for subdir in subdirectories:
    #     print(os.path.join(root, subdir))
    for file in sorted(files):
        if 'test' in file:
            filesToGrab.append(file)
            print(os.path.join(root, file))

print(len(filesToGrab))