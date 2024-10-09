# ==> Functions <==
# extract:  Extract most know archives with one command
extract () {
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)   tar xjf $1     ;;
            *.tar.gz)    tar xzf $1     ;;
            *.bz2)       bunzip2 $1     ;;
            *.rar)       unrar e $1     ;;
            *.gz)        gunzip $1      ;;
            *.tar)       tar xf $1      ;;
            *.tbz2)      tar xjf $1     ;;
            *.tgz)       tar xzf $1     ;;
            *.zip)       unzip $1       ;;
            *.Z)         uncompress $1  ;;
            *.7z)        7z x $1        ;;
            *)     echo "'$1' cannot be extracted via extract()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

# ldiff: Diff, but only returns differing lines
ldiff () {
    diff $1 $2 | egrep -v "^[-<>]"
}

# dsub: Direct running of CMD file on node with no queue, e.g., DS boxes
dsub () {
    PID=$RANDOM
    chmod u+x "$1".cmd
    nohup ./"$1".cmd >& "$1".p$PID &
}

# Count the number of files matching given extension in directory
cxt () {
    num=$(ls -l *"$1" | wc -l)
    echo -n "Files matching extension '"; echo -n $1; echo -n "': "; echo $num
}

psiapi() {
    if [ $# -eq 0 ]; then
        local psi4_build_path=.
    else
        local psi4_build_path=$1
    fi
    eval $($psi4_build_path/stage/bin/psi4 --psiapi)
}

rm_psiapi() {
    # need to remove any path with psi4 from PYTHONPATH and PATH
    export PYTHONPATH=$(echo $PYTHONPATH | tr ':' '\n' | grep -v psi4 | tr '\n' ':')
    export PATH=$(echo $PATH | tr ':' '\n' | grep -v psi4 | tr '\n' ':')
}

# ==> Common Aliases <==
alias ls='ls -G --color=always'
alias grep='grep --color=auto'
alias ..='cd ../'                           # Go back 1 directory level
alias ...='cd ../../'                       # Go back 2 directory levels
alias ....='cd ../../../'                   # Go back 3 directory levels
alias vi='vim'
alias c='clear'
alias src='source ~/.bash_profile'
alias coffee='grep 'coffee' *.out'
alias ncoffee='grep 'coffee' *.out | wc -l'
alias beer='grep 'beer' *.out | wc -l'
alias gitlog="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative"
alias open='xdg-open'
alias cleanfirefox='rm -rf /theoryfs2/ds/$USER/.mozilla/firefox/*.default/.parentlock'
alias nv='nvim'
alias ta='tmux attach'
alias dotfile='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# ==> Terminal Prompt <==
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ \1/'
}
git_prompt () {
  # Grab working branch name
  git_branch=$(git branch 2>/dev/null| sed -n '/^\*/s/^\* //p')
  if [ -z "${git_branch}" ]; then
    return 0
  fi

  # Clean or dirty branch
#   if git diff --quiet 2>/dev/null >&2; then
#     git_color="$(tput setaf 76)"
#   else
#     git_color="$(tput setaf 208)"
#   fi
  echo " $(tput bold)$(tput setaf 203)($git_branch)"
}

export TERM=xterm-256color
# PS1="\[$(tput setaf 147)$(tput bold)\]\u\[$(tput sgr0)$(tput setaf 147)\]@\h:\[$(tput setaf 39)$(tput bold)\]\w\[$(tput sgr0)\]\$(git_prompt) \[$(tput setaf 76)\]❯\[$(tput sgr0)\] "
PS1="\[$(tput setaf 39)$(tput bold)\]\w\[$(tput sgr0)\]\$(git_prompt) \[$(tput setaf 76)\]❯\[$(tput sgr0)\] "
export PROMPT_DIRTRIM=3

# ==> Pathing <==
export PATH="/theoryfs2/ds/cdsgroup/psi4-install/Python-2.7.6/bin:$PATH"
export PATH="/theoryfs2/common/software/Python-2.7.6:$PATH"
export PATH="/theoryfs2/ds/cdsgroup/scripts/bin:$PATH"
export PATH="/usr/local/bin:$PATH"
export PATH="$PATH:/sbin:/bin:/usr/sbin:/usr/bin:/usr/X11R6/bin"
export PATH="/theoryfs2/ds/sherrill/bin:$PATH"
export PATH="$HOME/go/bin/:$PATH"
export PATH="$HOME/bin:$PATH"
export PATH="/theoryfs2/common/software/pymol:$PATH"
export PATH="/theoryfs2/ds/jadeny/ase/bin:$PATH"
export TEXHOME="~sherrill"
export TEXINPUTS="../:./:$TEXHOME/TeX//:"
export BIBINPUTS="../:./:$TEXHOME/cdsgroup/papers/dsdb/:$TEXHOME/TeX//:"
export BSTINPUTS="../:./:$TEXHOME/cdsgroup/papers/dsdb/:$TEXHOME/TeX//:"
# export PYTHONPATH="/theoryfs2/ds/jadeny/ase:$PYTHONPATH"
# export PYTHONPATH="$PYTHONPATH:/theoryfs2/ds/jadeny/gits"

# assign PSI environment variables
if [ -d "/fastscratch/jadeny" ]; then
  export SCRATCH="/fastscratch/jadeny"
  export PSI_SCRATCH="/fastscratch/jadeny"
else
  export SCRATCH="/scratch/jadeny"
  export PSI_SCRATCH="/scratch/jadeny"
fi

# ==> Other Environment Vars <==
export EDITOR='nvim'

# source /theoryfs2/common/software/intel2019/bin/compilervars.sh intel64


# ==> Program Aliases <==
# PyMOL
alias pymol="~cdsgroup/miniconda/envs/pymol3env/bin/pymol"

# Jmol
alias jmol="/theoryfs2/common/software/jmol-11.0.1/jmol"

# Orca
# export PATH="/theoryfs2/ds/glick/orca:$PATH"
# export LD_LIBRARY_PATH="/theoryfs2/ds/glick/orca:$LD_LIBRARY_PATH"

# Maestro
export SCHRODINGER="/theoryfs2/ds/csargent/maestro/free032023"
export SCHRODINGER_SCRATCH="/scratch/jadeny"

# need to check if terminal is kitty
if [ "$TERM" = "xterm-kitty" ]; then
    alias ssh="kitty +kitten ssh"
fi

# ==> Unused Aliases <==
# alias calc='awk "BEGIN{ print \!* }"'
# alias ds-cle='/theoryfs2/ds/sherrill/Gits/CrystaLattE/crystalatte/crystalatte.py' #this has no automatic determination of cif or monomer cutoff
# alias ds-cle-autosize='/theoryfs2/ds/glick/gits/GroupCrystaLattE/crystalatte/crystalatte.py' #this has automatic determination of cif and monomer cutoff
# alias ds-cle-noerror='~/chem/CrysaLattE-no-mc-error/crystalatte/crystalatte.py' #this has auto det and no error message for 1/2 the shortest
# alias psithonyzer='/theoryfs2/ds/glick/gits/GroupCrystaLattE/crystalatte/psithonyzer.py'
# alias psithonyzer='/theoryfs2/ds/sherrill/Gits/CrystaLattE/crystalatte/psithonyzer.py'
# alias mypsiclean='rm -f timer.dat; rm -f s4machinefile-*; rm -f /scratch/sherrill/psi.*; rm -f core.*; rm -f psi.*.clean; rm -f *.o[0-9]*; rm -f *.cmd; rm -f *.xml_*'
# alias maestro="$SCHRODINGER/maestro &"
# alias mp2-ds='bash dissociation-energy-geomenergyfreq-xyz.sh mp2 6 182 ds'
# alias fp-ds='bash dissociation-energy-geomenergyfreq-xyz.sh fp 6 182 ds'
# alias fpe-ds='bash dissociation-energy-geomenergyfreq-xyz.sh fpenergy 6 182 ds'
# alias mp2-hive='bash dissociation-energy-geomenergyfreq-xyz.sh mp2 24 182 hive'
# alias fp-hive='bash dissociation-energy-geomenergyfreq-xyz.sh fp 24 182 hive'
# alias fpe-hive='bash dissociation-energy-geomenergyfreq-xyz.sh fpenergy 24 182 hive'
# alias fp-har='bash dissociation-energy-geomenergyfreq-xyz.sh fphar 24 182 hive'
# alias fp-anh='bash dissociation-energy-geomenergyfreq-xyz.sh fpanh 24 182 hive'
# alias mp2-har='bash dissociation-energy-geomenergyfreq-xyz.sh mp2har 24 182 hive'
# alias mp2-anh='bash dissociation-energy-geomenergyfreq-xyz.sh mp2anh 24 182 hive' 


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/theoryfs2/ds/jadeny/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/theoryfs2/ds/jadeny/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/theoryfs2/ds/jadeny/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/theoryfs2/ds/jadeny/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

conda activate dlpno_memtest

PATH="/theoryfs2/ds/jadeny/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/theoryfs2/ds/jadeny/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/theoryfs2/ds/jadeny/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/theoryfs2/ds/jadeny/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/theoryfs2/ds/jadeny/perl5"; export PERL_MM_OPT;
