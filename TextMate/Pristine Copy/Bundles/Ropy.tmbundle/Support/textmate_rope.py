#
#Copyright (C) 2008 Fabio Corneti <info@corneti.com>
#
"""Support module for the PythonDev TextMate bundle.

This module implements most of the command defined in the bundle.
"""

import os
import sys
import urllib

#TODO: check how to get the bundle home
bundlehome = os.environ.get('TM_BUNDLE_SUPPORT')

sys.path.append(bundlehome)

sys.path.append(os.environ.get('TM_SUPPORT_PATH') + '/lib')
from tmrope import utils
import dialog

TM_PROJECT_DIRECTORY = os.environ.get('TM_PROJECT_DIRECTORY', None)
TM_FILEPATH = os.environ.get('TM_FILEPATH')
TM_LINE_INDEX = int(os.environ.get('TM_LINE_INDEX', -1))
TM_CURRENT_LINE = os.environ.get('TM_CURRENT_LINE', None)
TM_LINE_NUMBER = int(os.environ.get('TM_LINE_NUMBER', -1))
TM_SCOPE = os.environ.get('TM_SCOPE', None)
TM_CURRENT_WORD = os.environ.get('TM_CURRENT_WORD', None)

#add_paths = os.path.join(bundlehome, '%s.%s' % sys.version_info[:2])
sys.path.append(TM_PROJECT_DIRECTORY)
#sys.path.append(os.path.join(bundlehome, add_paths))

from rope.base.project import Project
try:
    from rope.contrib import codeassist
except:
    from rope.ide.codeassist import PythonCodeAssist 

class TextMateRope(object):
    """Implementation of bundle commands"""
    def __init__(self):
        self.source = ''

    def goto_definition(self):
        """
        Tries to find the definition for the currently selected scope;

            * if the definition is found, returns a tuple containing the file path and the line number (e.g. ``('/Users/fabiocorneti/src/def.py', 23))``
            * if no definition is found, returns None

        """
        #TODO: support multiple matches
        if TM_PROJECT_DIRECTORY is None:
            return None
        project = Project(TM_PROJECT_DIRECTORY)
        caret_index = self.source.find(TM_CURRENT_LINE) + TM_LINE_INDEX
        resource, line = codeassist.get_definition_location(project, self.source, caret_index)
        if resource is not None:
            return 'txmt://open?url=file://%s&line=%d' % (urllib.quote(resource.real_path), line)
        else:
            return ''

    def complete(self):
        if TM_PROJECT_DIRECTORY is None:
            return ''
        #from rope.contrib import autoimport
        project = Project(TM_PROJECT_DIRECTORY)
        #autoimport = autoimport.AutoImport(project)
        resource = project.get_resource(TM_FILEPATH.replace(TM_PROJECT_DIRECTORY, '')[1:])
        #project.validate(self.project_path)
        caret_index = self.source.find(TM_CURRENT_LINE) + TM_LINE_INDEX
        try:
            proposals = codeassist.code_assist(project, self.source, caret_index, resource)
        except:
            ass = PythonCodeAssist(project)
            proposals = ass.assist(self.source, caret_index, resource)
        try:
            if len(proposals) == 0:
                return ''
        except:
            return ''
        if len(proposals) == 1:
            selection = proposals[0].name
        else:
            proposals = codeassist.sorted_proposals(proposals)
            #autoimport.generate_cache()
            #autoimport.generate_modules_cache(modules)
            #project.pycore.analyze_module(resource)
            names = [proposal.name for proposal in proposals]
            #if self.starting.strip() and '.' not in self.expression:
            #        import_assists = self.autoimport.import_assist(self.starting)
            #        names.extend(x[0] + ' : ' + x[1] for x in import_assists)

            #plist = "{ menuItems=(%s);}"
            selection = dialog.menu(names)
            if selection is None:
                return ''
        if TM_CURRENT_WORD is None:
            return selection
        else:
            return selection.replace(TM_CURRENT_WORD, '')

def main():
    if len(sys.argv) < 1:
        return
    textmate_rope = TextMateRope()
    textmate_rope.source = sys.stdin.read()
    command = sys.argv[1]
    command_method = getattr(textmate_rope, command, None)
    if command_method:
        sys.stdout.write(command_method())

if __name__ == '__main__':
    main()
