# -*- coding: utf-8 -*-

import re
import base64
from urllib import quote as urlquote
from urlparse import urlsplit, urlunsplit
import xmlrpclib

from mercurial import ui, hg


def get_issue_id(node):
    # ブランチ名 = feature/<チケット番号>(-n)
    issue = node.branch()
    m = re.match(r'^feature/([0-9]+)(?:-[0-9]+)?$', issue)
    if m:
        issue = m.group(1)
    return issue


def build_uri(endpoint, username, password):
    scheme, netloc, path, query, frag = urlsplit(endpoint)
    if "@" in netloc:
        _, netloc = netloc.split("@", 1)
    netloc = "%s:%s@%s" % (urlquote(username), urlquote(password), netloc)
    return urlunsplit((scheme, netloc, path, query, frag))


def backlog(ui, repo, issue_or_rev=None, **opts):
    if issue_or_rev is None:
        issue_id = get_issue_id(repo.changectx("."))
    elif issue_or_rev.startswith("#"):
        issue_id = issue_or_rev[1:]
    else:
        node = repo.changectx(issue_or_rev)
        issue_id = get_issue_id(node)

    endpoint = ui.config('backlog', 'endpoint')
    project_key = ui.config('backlog', 'project_key')
    username = ui.config('backlog', 'username')
    password = ui.config('backlog', 'password')

    uri = build_uri(endpoint, username, password)
    server = xmlrpclib.ServerProxy(uri)

    data = server.backlog.getIssue("%s-%s" % (project_key, issue_id))
    subject = data['summary']
    status = data['status']['name']
    print (u"[%s] %s" % (status, subject)).encode('utf-8')
    print data['url']


cmdtable = {
    # "コマンド名": (関数, オプション, ヘルプ)
    "backlog": (backlog, [], "ticket_or_rev")
}


def main():
    repo = hg.repository(ui.ui(), ".")
    backlog(ui.ui(), repo)


if __name__ == '__main__':
    main()
