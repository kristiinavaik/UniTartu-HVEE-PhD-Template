#!/usr/bin/env python3
"""Build the template in temporary copies and check final LaTeX logs."""
import argparse
from pathlib import Path
import re
import shutil
import subprocess
import sys
import tempfile

ROOT = Path(__file__).resolve().parents[1]
IGNORE = shutil.ignore_patterns(
    '.git', '.github', '.DS_Store', 'build', '__pycache__',
    '*.aux', '*.bbl', '*.blg', '*.fdb_latexmk', '*.fls', '*.log',
    '*.lof', '*.lot', '*.out', '*.synctex*', '*.toc', '*.xdv', 'main.pdf',
)
LOG_PROBLEMS = (
    r'Overfull \\[hv]box',
    r'There were undefined (?:references|citations)',
    r'Label\(s\) may have changed',
    r'destination with the same identifier',
    r'(?:LaTeX|Package \w+) (?:Error|Warning):[^\n]*undefined',
)


def build(mode, engine, output_dir):
    label = mode.lower()
    with tempfile.TemporaryDirectory(prefix='hvee-' + label + '-') as temporary:
        work = Path(temporary) / 'template'
        shutil.copytree(ROOT, work, ignore=IGNORE)
        main = work / 'main.tex'
        text, count = re.subn(
            r'(?m)^\\ThesisType\{(?:MONOGRAPH|COLLECTION)\}',
            lambda _: '\\ThesisType{' + mode + '}', main.read_text(),
        )
        if count != 1:
            raise RuntimeError('Expected exactly one active ThesisType setting.')
        main.write_text(text)
        command = (
            ['latexmk', '-pdf', 'main.tex'] if engine == 'latexmk' else
            ['tectonic', '--untrusted', '--keep-logs', '--keep-intermediates', 'main.tex']
        )
        print('Building ' + label + ' with ' + engine + '...', flush=True)
        result = subprocess.run(command, cwd=work, text=True,
                                stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
        if output_dir:
            destination = output_dir / label
            destination.mkdir(parents=True, exist_ok=True)
            for name in ('main.pdf', 'main.log', 'main.blg', 'main.aux', 'main.toc', 'main.out'):
                if (work / name).exists():
                    shutil.copy2(work / name, destination / name)
            (destination / 'build-output.txt').write_text(result.stdout)
        if result.returncode:
            print(result.stdout, file=sys.stderr)
            raise RuntimeError(label + ': compilation failed.')
        log = (work / 'main.log').read_text(errors='replace')
        problems = [pattern for pattern in LOG_PROBLEMS
                    if re.search(pattern, log, re.IGNORECASE)]
        if problems:
            print(result.stdout, file=sys.stderr)
            raise RuntimeError(label + ': final log check failed: ' + ', '.join(problems))
        bibliography_log = work / 'main.blg'
        if bibliography_log.exists() and re.search(
                r'There (?:was|were) [1-9]\d* error messages?',
                bibliography_log.read_text(errors='replace')):
            raise RuntimeError(label + ': BibTeX reported errors.')
        if not (work / 'main.pdf').is_file():
            raise RuntimeError(label + ': no PDF was generated.')
        # These are intentional semantics of the supplied examples, not just
        # successful compilation: appendix references contain A, not "Appendix A".
        auxiliary = (work / 'main.aux').read_text(errors='replace')
        for key, expected in (('app:example', 'A'), ('eq:example', '1')):
            match = re.search(
                r'\\newlabel\{' + re.escape(key) + r'\}\{\{([^{}]*)\}',
                auxiliary,
            )
            if not match or match.group(1) != expected:
                actual = match.group(1) if match else 'missing'
                raise RuntimeError(
                    label + ': reference ' + key + ' should be ' +
                    expected + ', got ' + actual + '.'
                )
        print(label + ': compilation, log and reference checks passed.', flush=True)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--type', choices=('MONOGRAPH', 'COLLECTION'), nargs='+',
                        default=['MONOGRAPH', 'COLLECTION'])
    parser.add_argument('--engine', choices=('latexmk', 'tectonic'), default='latexmk')
    parser.add_argument('--output-dir', type=Path,
                        help='Optionally keep PDFs and logs, e.g. build/checks.')
    args = parser.parse_args()
    if not shutil.which(args.engine):
        parser.error(args.engine + ' is not installed or is not on PATH.')
    output_dir = args.output_dir.resolve() if args.output_dir else None
    if output_dir and (output_dir == ROOT or
                       (ROOT in output_dir.parents and
                        output_dir.relative_to(ROOT).parts[0] != 'build')):
        parser.error('Inside the repository, put check output under build/.')
    try:
        for mode in args.type:
            build(mode, args.engine, output_dir)
    except (OSError, RuntimeError) as error:
        parser.exit(1, str(error) + '\n')


if __name__ == '__main__':
    main()
