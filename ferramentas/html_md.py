"""Converte o HTML simples dos blocos do mapa em Markdown legível."""
from html.parser import HTMLParser


class _Conv(HTMLParser):
    def __init__(self):
        super().__init__(convert_charrefs=True)
        self.out = []
        self.lists = []          # pilha de ('ol'|'ul', contador)
        self.link = None         # (href, classe, data-id, buffer)
        self.pending_bold = False

    def _w(self, s):
        if self.link is not None:
            self.link[3].append(s)
        else:
            self.out.append(s)

    def handle_starttag(self, tag, attrs):
        a = dict(attrs)
        if tag in ('ol', 'ul'):
            self.lists.append([tag, 0])
            self._w('\n')
        elif tag == 'li':
            kind = self.lists[-1] if self.lists else ['ul', 0]
            kind[1] += 1
            indent = '   ' * (len(self.lists) - 1)
            self._w(f'\n{indent}{kind[1]}. ' if kind[0] == 'ol' else f'\n{indent}- ')
        elif tag == 'a':
            self.link = (a.get('href', ''), a.get('class', ''), a.get('data-id', ''), [])
        elif tag == 'code':
            self._w('`')
        elif tag in ('strong', 'b'):
            self._w('**')
        elif tag in ('em', 'i'):
            self._w('*')
        elif tag == 'br':
            self._w('  \n')
        elif tag == 'p':
            self._w('\n\n')
        elif tag in ('h3', 'h4'):
            self._w('\n\n### ')

    def handle_endtag(self, tag):
        if tag in ('ol', 'ul'):
            if self.lists:
                self.lists.pop()
            self._w('\n')
        elif tag == 'a' and self.link is not None:
            href, cls, did, buf = self.link
            self.link = None
            text = ''.join(buf).strip()
            if 'ref' in cls.split() and did:
                self._w(f'**{did}**' if 'req' in cls.split() else f'→ {did}')
            elif href and not href.startswith('#'):
                self._w(f'[{text}]({href})')
            else:
                self._w(text)
        elif tag == 'code':
            self._w('`')
        elif tag in ('strong', 'b'):
            self._w('**')
        elif tag in ('em', 'i'):
            self._w('*')
        elif tag == 'p':
            self._w('\n')

    def handle_data(self, data):
        self._w(data)


def html_md(html):
    if not html:
        return ''
    c = _Conv()
    c.feed(html)
    c.close()
    text = ''.join(c.out)
    lines = [ln.rstrip() for ln in text.split('\n')]
    out, blank = [], 0
    for ln in lines:
        if ln.strip():
            out.append(ln); blank = 0
        else:
            blank += 1
            if blank == 1:
                out.append('')
    return '\n'.join(out).strip()
