#!/usr/bin/env bash
#:  * `receipt` <formula> [<formula>...]:
#:     Show the syntax-highlighted JSON install receipt for the specified formulae

function brew () {
    "${HOMEBREW_PREFIX}/bin/brew" "$@"
}

irfilename="INSTALL_RECEIPT.json"
pygmentize="$(which pygmentize)"
json_refmt="$(which json_reformat)"

if [[ ! -x $pygmentize ]]; then
    echo "* ERROR: The “pygmentize” command was not found"
    echo "* ERROR: Try installing the Python “pygments” package"
    return 1
fi
if [[ ! -x $json_refmt ]]; then
    echo "* ERROR: The “json_reformat” command was not found"
    echo "* ERROR: Try installing the “yajl” Homebrew formula"
    return 1
fi

for argument in "$@"; do
    if brew ls --versions $argument > /dev/null; then
        basedir="$(brew --prefix ${argument})"
        receipt="${basedir}/${irfilename}"
        if [[ ! -r $receipt ]]; then
            echo "* ERROR: can’t read install receipt for formula: ${argument}"
            echo "* ERROR: ${receipt}"
            return 1
        else
            cat "${receipt}" | "${json_refmt}" | "${pygmentize}" -l json -O "style=paraiso-dark"
            echo ""
        fi
    else
        echo "* ERROR: Formula ${argument} not installed"
        echo ""
    fi
done
