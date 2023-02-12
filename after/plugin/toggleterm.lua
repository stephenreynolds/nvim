require("toggleterm").setup {
    size = 20,
    open_mapping = [[<c-\>]],
    hide_numbers = true,
    shade_filetypes = {},
    shade_terminals = true,
    shading_factor = 2,
    start_in_insert = true,
    insert_mappings = true,
    persist_size = false,
    direction = "float",
    close_on_exit = true,
    shell = vim.o.shell,
    float_opts = {
        border = "curved",
        winblend = 0,
        highlights = {
            border = "Normal",
            background = "Normal"
        }
    }
}

local function get_buf_size()
    local cbuf = vim.api.nvim_get_current_buf()
    local bufinfo = vim.tbl_filter(function(buf)
            return buf.bufnr == cbuf
        end, vim.fn.getwininfo(vim.api.nvim_get_current_win()))[1]
    if bufinfo == nil then
        return { width = -1, height = -1 }
    end
    return { width = bufinfo.width, height = bufinfo.height }
end

local function get_dynamic_terminal_size(direction, size)
    size = size or 20

    if direction ~= "float" and tostring(size):find(".", 1, true) then
        size = math.min(size, 1.0)
        local buf_sizes = get_buf_size()
        local buf_size = direction == "horizontal" and buf_sizes.height or buf_sizes.width
        return buf_size * size
    else
        return size
    end
end

function exec_toggle(opts)
    local Terminal = require("toggleterm.terminal").Terminal
    local term = Terminal:new { cmd = opts.cmd, count = opts.count, direction = opts.direction }
    term:toggle(opts.size, opts.direction)
end

function add_exec(opts)
    vim.keymap.set({ "n", "t" }, opts.keymap, function()
        exec_toggle { cmd = opts.cmd, count = opts.count, direction = opts.direction, size = opts.size() }
    end, { desc = opts.label, noremap = true, silent = true })
end

function init()
    local execs = {
        { nil, "<M-1>", "Horizontal Terminal", "horizontal", 0.3 },
        { nil, "<M-2>", "Vertical Terminal",   "vertical",   0.4 },
        { nil, "<M-3>", "Float Terminal",      "float",      nil }
    }

    for i, exec in pairs(execs) do
        local direction = exec[4] or "float"

        local opts = {
            cmd = exec[1],
            keymap = exec[2],
            label = exec[3],
            count = i + 100,
            direction = direction,
            size = function()
                return get_dynamic_terminal_size(direction, exec[5])
            end
        }

        add_exec(opts)
    end
end

init()
