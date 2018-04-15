# Capture and Convert Digital8 or DV tapes to mp4 (libx264)
I have lots of Digital 8 tapes all the way from 2000 and
I did not want to use one of those specialized dv to dvd converter devices. They are too time consuming and too manual. 
On top they do not have much control over when to create new file. Also using timestamp from DV recording to set proper
timestamp on created file is not possible. One would have to do lots of work by painstakingly go through video and set it
manually.

## Goal
1. Only manual action should be pop a tape in Digital8 or DV camcorder. Everything else up to creating mp4 files should be completely automated.
2. Run a command that will do following
  a. Capture recordings from tape and create separate files per recording.
  b. Control over how tinly or big file to be catures and created.
  c. Have proper recording time incorporated in the final files.
  d. Compress the DV format file to mp4 (libx264) for archival in resonable space.

## Setup
I did quick research and found that I can use dv capture card. Plug that to my Ubuntu desktop. Use ```dvgrab```
to capture recording from camcorder. Use ```ffmpeg``` to convert captured recording to mp4.

