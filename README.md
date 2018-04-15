# Capture and Convert Digital8 or DV tapes to mp4 (libx264)
I have lots of Digital 8 tapes all the way from 2000 and
I did not want to use one of those specialized dv to dvd converter devices. They are too time consuming and too manual.
On top they do not have much control over when to create new file. Also using timestamp from DV recording to set proper
timestamp on created file is not possible. One would have to do lots of work by painstakingly go through video and set it
manually.

## Goal
1. Only manual action should be pop a tape in Digital8 or DV camcorder. Everything else up to creating mp4 files should be completely automated.
2. Run a command that will do following
   * Capture recordings from tape and create separate files per recording.
   * Control over how tiny or big file to be captures and created.
   * Have proper recording time incorporated in the final files.
   * Compress the DV format file to mp4 (libx264) for archival in reasonable space.

## Getting ready
I did quick research and found that I can use dv capture card. Plug that to my Ubuntu desktop. Use ```dvgrab```
to capture recording from camcorder. Use ```ffmpeg``` to convert captured recording to mp4.

### Equipment
 1. 20 year Old [Sony Digital Handycam](https://esupport.sony.com/US/p/model-home.pl?mdl=DCRTRV510&LOC=3)
 2. Ordered this [Firewire card](https://www.amazon.com/Firewire-Expansion-Rosewill-RC-504-Controller/dp/B004F3DM6C). Note: no need to give power to this card as my Handycam is powered by it's power cord. Also it came with Firewire cable.
 3. Dell 5 year old Ubuntu desktop. i7, 16GB RAM, 1T HDD

### Setup
Added Firewire card in to the Desktop. Hooked up Handycam's Firewire port to it and that is it.


## Software prerequisite

In Ubuntu terminal get ```dvgrab``` and ```ffmpeg``` if not present
```
$sudo apt install dvgrab ffmpeg
```

## Clone this repo
```
git@github.com:saswade/convertdv.git
cd convertdv
```

## Dir structure
All dv files go under ```dv``` sub dir

All mp4 files go under ```mp4``` sub dir

## Capture
1. Make sure that all equipments are connected and powered. 
1. Handycam have tape inside
```
./grab.sh some_event_name
```
This will create dir under
```dv/some_event_name/```
All captured recording will go under it.

## Convert
Use same event name mentioned for capture
```
./convert_dv_to_mp4.sh some_event_name
```
All mp4 go under
mp4/some_event_name/

## Capture and Convert in one shot
```
./grab_n_convert.sh some_event_name
```
## Result
Happiness of watching old memories
