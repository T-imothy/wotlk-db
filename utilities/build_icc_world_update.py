"""Create the ordered ICC world update file. Does not connect to a database."""
from pathlib import Path
import argparse
import hashlib

root = Path(__file__).resolve().parents[1]
parser = argparse.ArgumentParser(description=__doc__)
parser.add_argument('--output', type=Path, required=True)
args = parser.parse_args()
files = []
for number in range(5900, 5921):
    matches = sorted((root / 'Updates').glob(f'{number}_icc*.sql'))
    if len(matches) != 1:
        raise SystemExit(f'Expected exactly one ICC migration for {number}: {matches}')
    files.append(matches[0])
if args.output.exists():
    raise SystemExit('Output already exists; choose a new filename to preserve it.')
text = '-- ManTech ICC world update: apply to the WORLD database with Wrath stopped.\n'
text += '-- Requires the matching restored mantech-wotlk executable.\n'
for source in files:
    text += '\n-- SOURCE: Updates/' + source.name + '\n' + source.read_text(encoding='utf8') + '\n'
args.output.write_text(text, encoding='utf8')
print(args.output.resolve())
print('SHA256:', hashlib.sha256(args.output.read_bytes()).hexdigest())
print('Generated only; no database changes have been made.')
