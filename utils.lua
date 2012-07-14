utils = {}
function utils.parse_input(s)
    local cmd
    local params = {}
    for w in string.gfind(s, '%w+') do
        if not cmd then
            cmd = w
        else
            table.insert(params, w)
        end
    end

    return cmd, params
end
