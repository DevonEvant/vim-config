require('mini.misc').setup( -- No need to copy this inside `setup()`. Will be used automatically.
    {
        -- Array of fields to make global (to be used as independent variables)
        make_global = { 'put', 'put_text' },
    }
)

require('mini.cursorword').setup(
    {
        delay = 100,
    }
)

require('mini.surround').setup(
-- No need to copy this inside `setup()`. Will be used automatically.
    {
        -- Add custom surroundings to be used on top of builtin ones. For more
        -- information with examples, see `:h MiniSurround.config`.
        custom_surroundings = nil,

        -- Duration (in ms) of highlight when calling `MiniSurround.highlight()`
        highlight_duration = 500,

        -- Module mappings. Use `''` (empty string) to disable one.
        mappings = {
            add = 'gsa',    -- Add surrounding in Normal and Visual modes
            delete = 'gsd', -- Delete surrounding
            find = 'gsf',   -- Find surrounding (to the right)
            find_left = 'gsF', -- Find surrounding (to the left)
            highlight = 'gsh', -- Highlight surrounding
            replace = 'gsr', -- Replace surrounding
            update_n_lines = 'gsn', -- Update `n_lines`

            suffix_last = 'gsl', -- Suffix to search with "prev" method
            suffix_next = 'gsn', -- Suffix to search with "next" method
        },

        -- Number of lines within which surrounding is searched
        n_lines = 20,

        -- Whether to respect selection type:
        -- - Place surroundings on separate lines in linewise mode.
        -- - Place surroundings on each line in blockwise mode.
        respect_selection_type = false,

        -- How to search for surrounding (first inside current line, then inside
        -- neighborhood). One of 'cover', 'cover_or_next', 'cover_or_prev',
        -- 'cover_or_nearest', 'next', 'prev', 'nearest'. For more details,
        -- see `:h MiniSurround.config`.
        search_method = 'cover',

        -- Whether to disable showing non-error feedback
        silent = false,
    }
)

require('mini.indentscope').setup( -- No need to copy this inside `setup()`. Will be used automatically.
    {
        -- Draw options
        draw = {
            -- Delay (in ms) between event and start of drawing scope indicator
            delay = 100,

            -- Animation rule for scope's first drawing. A function which, given
            -- next and total step numbers, returns wait time (in ms). See
            -- |MiniIndentscope.gen_animation| for builtin options. To disable
            -- animation, use `require('mini.indentscope').gen_animation.none()`.
            -- animation = --<function: implements constant 20ms between steps>,

            -- Symbol priority. Increase to display on top of more symbols.
            priority = 2,
        },

        -- Module mappings. Use `''` (empty string) to disable one.
        mappings = {
            -- Textobjects
            object_scope = 'ii',
            object_scope_with_border = 'ai',

            -- Motions (jump to respective border line; if not present - body line)
            goto_top = '[i',
            goto_bottom = ']i',
        },

        -- Options which control scope computation
        options = {
            -- Type of scope's border: which line(s) with smaller indent to
            -- categorize as border. Can be one of: 'both', 'top', 'bottom', 'none'.
            border = 'both',

            -- Whether to use cursor column when computing reference indent.
            -- Useful to see incremental scopes with horizontal cursor movements.
            indent_at_cursor = true,

            -- Whether to first check input line to be a border of adjacent scope.
            -- Use it if you want to place cursor on function header to get scope of
            -- its body.
            try_as_border = false,
        },

        -- Which character to use for drawing scope indicator
        symbol = '╎',
    }
)

require('mini.align').setup(
-- No need to copy this inside `setup()`. Will be used automatically.
    {
        -- Module mappings. Use `''` (empty string) to disable one.
        mappings = {
            start = 'gb',
            start_with_preview = 'gb',
        },

        -- Modifiers changing alignment steps and/or options
        modifiers = {
            -- Main option modifiers
            -- ['s'] = --<function: enter split pattern>,
            -- ['j'] = --<function: choose justify side>,
            -- ['m'] = --<function: enter merge delimiter>,
            --
            -- -- Modifiers adding pre-steps
            -- ['f'] = --<function: filter parts by entering Lua expression>,
            -- ['i'] = --<function: ignore some split matches>,
            -- ['p'] = --<function: pair parts>,
            -- ['t'] = --<function: trim parts>,
            --
            -- -- Delete some last pre-step
            -- ['<BS>'] = --<function: delete some last pre-step>,
            --
            -- -- Special configurations for common splits
            -- ['='] = --<function: enhanced setup for '='>,
            -- [','] = --<function: enhanced setup for ','>,
            -- [' '] = --<function: enhanced setup for ' '>,
        },

        -- Default options controlling alignment process
        options = {
            split_pattern = '',
            justify_side = 'left',
            merge_delimiter = '',
        },

        -- Default steps performing alignment (if `nil`, default is used)
        steps = {
            pre_split = {},
            split = nil,
            pre_justify = {},
            justify = nil,
            pre_merge = {},
            merge = nil,
        },

        -- Whether to disable showing non-error feedback
        silent = false,
    })


-- require('mini.animate').setup(
-- -- No need to copy this inside `setup()`. Will be used automatically.
--     {
--         -- Cursor path
--         cursor = {
--             -- Whether to enable this animation
--             enable = true,
--
--             -- Timing of animation (how steps will progress in time)
--             -- timing = --<function: implements linear total 250ms animation duration>,
--
--             -- Path generator for visualized cursor movement
--             -- path = --<function: implements shortest line path>,
--         },
--
--         -- Vertical scroll
--         scroll = {
--             -- Whether to enable this animation
--             enable = true,
--
--             -- Timing of animation (how steps will progress in time)
--             -- timing = --<function: implements linear total 250ms animation duration>,
--
--             -- Subscroll generator based on total scroll
--             -- subscroll = --<function: implements equal scroll with at most 60 steps>,
--         },
--
--         -- Window resize
--         resize = {
--             -- Whether to enable this animation
--             enable = true,
--
--             -- Timing of animation (how steps will progress in time)
--             -- timing = --<function: implements linear total 250ms animation duration>,
--
--             -- Subresize generator for all steps of resize animations
--             -- subresize = --<function: implements equal linear steps>,
--         },
--
--         -- Window open
--         open = {
--             -- Whether to enable this animation
--             enable = true,
--
--             -- Timing of animation (how steps will progress in time)
--             -- timing = --<function: implements linear total 250ms animation duration>,
--
--             -- Floating window config generator visualizing specific window
--             -- winconfig = --<function: implements static window for 25 steps>,
--
--             -- 'winblend' (window transparency) generator for floating window
--             -- winblend = --<function: implements equal linear steps from 80 to 100>,
--         },
--
--         -- Window close
--         close = {
--             -- Whether to enable this animation
--             enable = true,
--
--             -- Timing of animation (how steps will progress in time)
--             -- timing = --<function: implements linear total 250ms animation duration>,
--
--             -- Floating window config generator visualizing specific window
--             -- winconfig = --<function: implements static window for 25 steps>,
--
--             -- 'winblend' (window transparency) generator for floating window
--             -- winblend = --<function: implements equal linear steps from 80 to 100>,
--         },
--     }
-- )
