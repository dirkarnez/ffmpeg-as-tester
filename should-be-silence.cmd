ffmpeg -i input.mp3 -af "pan=stereo|c0=-c0|c1=-c1" input_invert.mp3
ffmpeg -i input.mp3 -i input_invert.mp3  -filter_complex amix=inputs=2:duration=first:dropout_transition=3:normalize=0  &&^
ffmpeg -i combined.mp3 -acodec pcm_s16le -f s16le combined.pcm


