/// @description Insert description here
// You can write your code in this editor
if (room != rm_entrada) {
	audio_stop_sound(snd_fire);
	exit;
}
if (!audio_is_playing(snd_fire) and global.CALDERA) audio_play_sound(snd_fire, 10, true);
if (!global.CALDERA) audio_stop_sound(snd_fire);

draw_self();