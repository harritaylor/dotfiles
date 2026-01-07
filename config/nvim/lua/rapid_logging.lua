
local function setup_rapid_logging()
    -- Function to handle smart indentation in insert mode
    local function smart_indent()
        local current_line = vim.fn.getline('.')
        local indent_level = #(current_line:match('^(%s*)'))
        local content = current_line:match('^%s*(.*)$')
        
        -- Check if the line starts with a dash
        if content:match('^-') then
            -- If it's a list item, increase indent
            vim.fn.setline('.', string.rep(' ', indent_level + 4) .. '- ' .. content)
            vim.cmd('normal! $')
        end
    end

    -- Function to toggle task state in normal mode
    local function toggle_task_state()
        local current_line = vim.fn.getline('.')
        local indent_level = #(current_line:match('^(%s*)'))
        local content = current_line:match('^%s*(.*)$')
        
        -- Define task states
        local task_states = {
            "TODO",
            "IN-PROGRESS",
            "WAITING",
            "DONE"
        }
        
        -- Check if the line is a list item
        if content:match('^-') then
            -- Check if already has a TODO state
            local current_state = content:match('^- (%w+)%s')
            local next_state = task_states[1]
            
            if current_state then
                -- Cycle through states
                for i, state in ipairs(task_states) do
                    if state == current_state then
                        next_state = task_states[(i % #task_states) + 1]
                        break
                    end
                end
                
                -- Replace the state
                local new_content = content:gsub('^- ' .. current_state .. '%s', '- ' .. next_state .. ' ')
                vim.fn.setline('.', string.rep(' ', indent_level) .. new_content)
            else
                -- Add TODO state
                vim.fn.setline('.', string.rep(' ', indent_level) .. '- TODO ' .. content:sub(3))
            end
        end
    end

    -- Keymappings
    -- In insert mode, Tab increases indent for list items
    vim.keymap.set('i', '<Tab>', function()
        if vim.fn.pumvisible() then
            return '<C-n>'
        else
            smart_indent()
            return '<C-t>'
        end
    end, { expr = true, noremap = true })

    -- In normal mode, Tab toggles task state
    vim.keymap.set('n', '<Tab>', toggle_task_state, { noremap = true, silent = true })
end

-- Call the setup function
setup_rapid_logging()
