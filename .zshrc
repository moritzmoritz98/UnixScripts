alias ll='ls -lah'
alias .='cd .. && ll'
alias maker='make -j4'
alias open='xdg-open'


xd() {
    [ "$1" ] && mkdir "$1" && cd "$1" || { echo "Error: No parameter specified" 1>&2; `exit 1`; }
}

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# Determines upgradable pip-Packages which are not under control of pacman.   #
# Prints those packages to stdout.                                            #
# @require `pip3`                                                             #
# @date 29.12.2018                                                            #
# @author Moritz Kirschte                                                     #
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
pipUpdate() {
    for pkg in `pip3 list --outdated --format=freeze | grep -v '^\-e' | cut -d = -f 1 | sed 's/-/_/g'`; do
      [[ -z `ls -1 /usr/lib/python3.7/site-packages/ | grep "^$pkg" | grep egg` ]] && echo $pkg
    done
}

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# Updates every GIT-Repository in every subdirectory (non-recursive).         #
# Prints an warning, if there is no git repository in a certian subdirectory  #
# @require `git`                                                              #
# @date 26.12.2017                                                            #
# @author Moritz Kirschte                                                     #
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
gitdir() {
    VC_DIR=".git"
    for d in */; do
        cd "$d"
        [ -d  $VC_DIR ] && git pull || echo "Warning: Ignoring invalid git Repository '$d'"
        cd "../"
    done
}

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# Converts an PHPMyAdmin SQL LaTeX Export to a valid LaTeX File.              #
# @param $1 filename: Specifies the PHPmyAdmin LaTeX Output.                  #
#                     Need to be accessable and an valid *.tex File, ow exit 1#
# @output filename_without_tex_extension.pdf                                  #
# @require `pdflatex`                                                         #
# @date 21.11.2017                                                            #
# @author Moritz Kirschte                                                     #
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
sql2pdf() {
    if [[ -r "$1" && "$1" =~ \.tex$ ]]; then
        filename="${1%.*}"
        pdflatex -jobname "$filename" \
                     "\\documentclass[a4paper]{scrartcl} \
                      \\author{Moritz Kirschte}          \
                      \\usepackage{longtable,lscape}     \
                      \\usepackage{examplep}             \
                      \\title{\\PVerb{$filename} - MySQL}\
                      \\subtitle{\\texttt{PHPMyAdmin} Export} \
                      \\date{\\today}                    \
                      \\nofiles                          \
                      \\setlength{\\parindent}{0pt}      \
                      \\usepackage[left=2cm,top=2cm,right=2cm,nohead,nofoot]{geometry} \
                      \\pdfpagewidth 210mm               \
                      \\pdfpageheight 297mm              \
                      \\begin{document}                  \
                        \\maketitle                      \
                        \\input{$1}                      \
                      \\end{document}                    "
        rm -rf "$filename".log
    else
        echo "Error: No valid parameter specified" 1>&2
        `exit 1`
    fi
}

#eval $(thefuck --alias)
date '+%D %T' | toilet -f term -F border --gay
cowsay $(fortune) | lolcat
[ -n "$XTERM_VERSION" ] && transset-df --id "$WINDOWID" >/dev/null

##############################################################################
### OH-MY-ZSH ##
##############################################################################
