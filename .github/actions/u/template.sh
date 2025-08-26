#!/usr/bin/env bash

set -euo pipefail

outfile="${1}"
version="${2}"

cat <<EOF > ${outfile}
name: upload-artifact

inputs:
  path:
    type: string
  name:
    type: string


runs:
  using: composite
  steps:
    - uses: actions/upload-artifact@${version}
      with:
        name: \${{ inputs.name }}
        path: \${{ inputs.path }}
EOF

echo "wrote to: ${outfile}"
