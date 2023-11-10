@REM ffmpeg -i input.mp3 -af "pan=stereo|c0=-c0|c1=-c1" input_invert.mp3
@REM ffmpeg -i input.mp3 -i input_invert.mp3  -filter_complex amix=inputs=2:duration=first:dropout_transition=3:normalize=0 combined.pcm &&^
@REM ffmpeg -i combined.mp3 -acodec pcm_s16le -f s16le combined.pcm

set PATH=%USERPROFILE%\Downloads\ffmpeg-6.0-full_build-shared\ffmpeg-6.0-full_build-shared\bin;
ffmpeg -i 440.wav -af "aeval=-val(0)|-val(1)" 440_invert.wav
ffmpeg -i 440.wav -i 440_invert.wav -filter_complex amix=inputs=2:duration=first:dropout_transition=3:normalize=0 combined.wav
@REM ffmpeg -i combined.wav -acodec pcm_s16le -f s16le combined.pcm
@REM ffmpeg -i combined.wav -af volumedetect -vn -sn -f null NUL 

@REM ffmpeg -i combined.wav  -af ebur128=peak=true -f null -
ffmpeg -i combined.wav -af "pan=1c|c0=c1,silencedetect=noise=-18dB:d=0.5" -f null -

pause

