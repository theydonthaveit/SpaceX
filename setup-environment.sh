if type rakudobrew &>/dev/null; then
    echo "rakudobrew is installed"
else
    git clone https://github.com/tadzik/rakudobrew ~/.rakudobrew;
    echo 'export PATH=~/.rakudobrew/bin:$PATH' >> ~/.bashrc;
    source ~/.bashrc;
fi

if type moar &>/dev/null; then
    echo "moar is installed"
else
    rakudobrew build moar;
fi

if type zef &>/dev/null; then
    echo "zef is installed"
else
    rakudobrew build zef;
fi

sudo zef install Task::Star;