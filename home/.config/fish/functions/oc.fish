function oc --wraps opencode --description "Run opencode with opus 4.6, no thinking"
    opencode run --model anthropic/claude-opus-4-6 --variant minimal $argv
end
