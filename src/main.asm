;
; Copyright (c) 2012 Toni Spets <toni.spets@iki.fi>
;
; Permission to use, copy, modify, and distribute this software for any
; purpose with or without fee is hereby granted, provided that the above
; copyright notice and this permission notice appear in all copies.
;
; THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
; WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
; MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
; ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
; WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
; ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
; OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
;

[org 0x006ED220]

;_str_version: db "3.03p4 B6 ",0
_str_version: db "3.03p-iB1v1",0

;format_test_str  db 'SC%c%02d%c%c.INI',0
test_str  db "RUN1226M",0

%include "config.inc"
%include "imports.inc"
%include "string.inc"

; This should be included first to hopefully prevent the memory address of the byte flags from changing
%include "src/video_stretching_helpers.asm"

%ifdef USE_HIRES
%include "src/hires.asm"
%include "src/fix_savegame_resolution_sidebar.asm"
%include "src/multiplayer_print_is_aftermath_game.asm"
%include "src/extended_sidebar.asm"
%endif

; Version
%include "src/version.asm"

; macros
%include "src/macros.asm"

; loading code
%include "src/loading.asm"

; generic
%include "src/game_difficulty_speed_modifier_remove.asm"
%include "src/magic_build_fix.asm"
%include "src/infantry_range_check.asm" ; desyncs online with 3.03
;%include "src/ai_vessels.asm" probably desyncs online with 3.03
;%include "src/harvester_harvest_closest_ore.asm" ; same thing what pressing S on harvesters does, desyncs online and keeps mining new ore spawned by ore mines
%include "src/building_crew_impassable_terrain_fix.asm" ; desyncs online with 3.03
%include "src/multiplayer_allies_fix.asm"
;%include "src/build_off_ally.asm"
;%include "src/selectable_spawn_locations.asm"
;%include "src/tech_center_bug_fix.asm"
%include "src/special_colourscheme.asm"
%include "src/arguments.asm"
%include "src/image_keyword_fix.asm"
%include "src/singleplayer_custom_colours_countries.asm"
;%include "src/debug_printing.asm" ; Seems to cause crashes
%include "src/hotkeys.asm"
%include "src/extra_theaters.asm"
%include "src/extra_sounds.asm"
%include "src/evac_in_mp.asm"
%include "src/custom_paradrop_superweapon.asm"
%include "src/pkt_loading.asm"
%include "src/expansions.asm"
%include "src/music_loading.asm"
%include "src/movie_loading.asm"
%include "src/custom_missions.asm"
%include "src/ally_shroud_reveal.asm"
%include "src/ingame_chat_improvments.asm"
%include "src/extra_multiplayer_countries.asm"
%include "src/aftermath_fast_buildspeed_option.asm"
%include "src/optional_scorescreen.asm"
%include "src/zoom_out_radar_by_default.asm"
%include "src/load_ai_ini.asm" ; Changing AI settings desyncs online...
%include "src/ai_fixes.asm"
%include "src/fix_formation_glitch.asm"
%include "src/parabombs_multiplayer.asm"
%include "src/mousewheel_scrolling.asm"
%include "src/skirmish_savegames.asm"
%include "src/sidebar_cameo_icons_remap_colours.asm"
;%include "src/more_colour_remaps.asm" ; not done yet and needs a fix for a crash

%ifdef USE_NOCD
%include "src/nocd.asm"
%endif

%ifdef USE_EXCEPTIONS
%include "src/exception.asm"
%endif

%ifdef USE_BUGFIXES
;%include "src/invisible_explosions_fix.asm" ; Causes desync with 3.03
%include "src/engi_q_freeze_fix.asm"
%include "src/score_screen_print_colour_fix.asm"
%include "src/animate_score_objects_crash_fix.asm"
%include "src/submarine_decloak_skip_campaign.asm"
%include "src/what_weapon_should_i_use_crash_fix.asm"
%include "src/radar_dome_crash_fix.asm"
%include "src/fix_toinherit_keyword.asm"
%include "src/localise_draw_strings.asm"
%include "src/mouse_fixes.asm"
%include "src/cpu_affinity_freeze_crash.asm"
%include "src/max_units_bug.asm"
%include "src/fence_bug.asm"
%include "src/tags_bug.asm"
%include "src/savegame_bug.asm"
%include "src/credits_screen_cncddraw_fix.asm"
%include "src/fix_multiplayer_settings_saving.asm"
%include "src/cancel_network_join_menu_lag_fix.asm"
%include "src/skip_deleting_conquer_eng.asm"
%include "src/green_shadow_on_cloaked_units_fix.asm"
%include "src/always_load_building_icons.asm"
%include "src/movies2_loading_bug.asm"
%endif


%ifdef USE_NEW_MULTIPLAYER_DEFAULTS
%include "src/multiplayer_defaults.asm"
%endif

%ifdef USE_LOAD_MORE_MIX_FILES
%include "src/load_more_mix_files.asm"
%endif

%ifdef FOCUS_LOSS_KEEP_PLAYING_SOUND
%include "src/focus_loss_keep_playing_sound.asm"
%endif

%ifdef LOAD_FIX_OOS_INI
%include "src/fix_rules_oos.asm"
%endif
