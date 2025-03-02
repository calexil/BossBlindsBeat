--- STEAMODDED HEADER
--- MOD_NAME: Boss Blinds Beat
--- MOD_ID: BossBlindsBeat
--- MOD_AUTHOR: [calexil]
--- MOD_DESCRIPTION: Quickly view your completed boss blinds from the run info menu!
----------------------------------------------
------------MOD CODE -------------------------


function G.UIDEF.blind_states
    local store_blind_state = {
    if blind_states['Boss'] 
    and
    G.GAME.round_resets.blind_states.Boss == 'Defeated' 
    then blind_matrix = {
        {x}, ...
    }

function G.UIDEF.boss_blinds_beat()
    local blind_matrix = {
        {},{},{}, {}, {}, {}
      }
      local blind_tab = {}
      for k, v in pairs(G.P_BLINDS) do
        blind_tab[#blind_tab+1] = v
      end
    
      table.sort(blind_tab, function (a, b) return a.order < b.order end)
    
      local blinds_to_be_alerted = {}
      for k, v in ipairs(blind_tab) do
        local discovered = v.discovered
        local temp_blind = AnimatedSprite(0,0,1.3,1.3, G.ANIMATION_ATLAS['blind_chips'], discovered and v.pos or G.b_undiscovered.pos)
        temp_blind:define_draw_steps({
          {shader = 'dissolve', shadow_height = 0.05},
          {shader = 'dissolve'}
        })
        if k == 1 then 
          G.E_MANAGER:add_event(Event({
            trigger = 'immediate',
            func = (function()
              G.CONTROLLER:snap_to{node = temp_blind}
                return true
            end)
          }))
        end
        temp_blind.float = true
        temp_blind.states.hover.can = true
        temp_blind.states.drag.can = false
        temp_blind.states.collide.can = true
        temp_blind.config = {blind = v, force_focus = true}
        if discovered and not v.alerted then 
          blinds_to_be_alerted[#blinds_to_be_alerted+1] = temp_blind
        end
        temp_blind.hover = function()
          if not G.CONTROLLER.dragging.target or G.CONTROLLER.using_touch then 
              if not temp_blind.hovering and temp_blind.states.visible then
                temp_blind.hovering = true
                temp_blind.hover_tilt = 3
                temp_blind:juice_up(0.05, 0.02)
                play_sound('chips1', math.random()*0.1 + 0.55, 0.12)
                temp_blind.config.h_popup = create_UIBox_blind_popup(v, discovered)
                temp_blind.config.h_popup_config ={align = 'cl', offset = {x=-0.1,y=0},parent = temp_blind}
                Node.hover(temp_blind)
                if temp_blind.children.alert then 
                  temp_blind.children.alert:remove()
                  temp_blind.children.alert = nil
                  temp_blind.config.blind.alerted = true
                  G:save_progress()
                end
              end
          end
        temp_blind.stop_hover = function() temp_blind.hovering = false; Node.stop_hover(temp_blind); temp_blind.hover_tilt = 0 end
      end
        blind_matrix[math.ceil((k-1)/5+0.001)][1+((k-1)%5)] = {n=G.UIT.C, config={align = "cm", padding = 0.1}, nodes={
          (k==6 or k ==16 or k == 26) and {n=G.UIT.B, config={h=0.2,w=0.5}} or nil,
          {n=G.UIT.O, config={object = temp_blind, focus_with_object = true}},
          (k==5 or k ==15 or k == 25) and {n=G.UIT.B, config={h=0.2,w=0.5}} or nil,
        }}
      end

--Overwrite Current Run Info Tabs--
function G.UIDEF.run_info()
    return create_UIBox_generic_options({contents ={create_tabs(
      {tabs = {
            {
              label = localize('b_poker_hands'),
              chosen = true,
              tab_definition_function = create_UIBox_current_hands,
          },
          {
            label = localize('b_blinds'),
            tab_definition_function = G.UIDEF.current_blinds,
          },
          {
              label = localize('b_vouchers'),
              tab_definition_function = G.UIDEF.used_vouchers,
          },
          {
            label = localize ('b_bosses'),
            tab_definition_function = G.UIDEF.boss_blinds_beat,
          },
          G.GAME.stake > 1 and {
            label = localize('b_stake'),
            tab_definition_function = G.UIDEF.current_stake,
          } or nil,
      },
      tab_h = 8,
      snap_to_nav = true})}})
  end
  


----------------------------------------------
------------MOD CODE END----------------------