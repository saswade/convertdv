# Capture and Convert Digital8 or DV tapes to mp4 (libx264)
I have lots of old Digital 8 tapes all the way from 2000. Wanted to take a look at them and was wondering if my old Handycam would still work. I was in luck, it worked but watching tapes on Handycam (and connect it to TV with RCA connectors) is pain. I wanted to convert them to a video file so that I can watch them on modern devices like smart phone, computer etc. At the same time I did not want to use one of those specialized dv to dvd converter devices. They are too time consuming and too manual.
On top they do not have much control over quality and maintaining file per recording in chronological order with record time timestamp. One would have to do lots of work by painstakingly go through video and split and set timestamp on converted files manually. There are so many other aspects one would like to tweak like quality of the final output, video format, create file on when new recording plays etc. Scripts mentioned hear can be used (and tweaked) to achieve the same. 

## Goal
1. Only manual action I want to take is pop a tape in Digital8 or DV camcorder. Everything else up to creating mp4 files should be completely automated.
2. Run a command that will do following
   * Capture recordings from tape and create separate files per recording.
   * Control over how tiny or big file to be captures and created.
   * Have proper recording time incorporated in the final files.
   * Compress the DV format file to mp4 (libx264) for archival in reasonable space.

## Getting ready
I did quick research and found that I can use dv capture card. Plug that to my Ubuntu desktop. Use ```dvgrab```
to capture recording from camcorder. Use ```ffmpeg``` to convert captured recording to mp4.

### Equipment
 1. Old [Sony Digital Handycam](https://esupport.sony.com/US/p/model-home.pl?mdl=DCRTRV510&LOC=3)
 2. Ordered this [Firewire card](https://www.amazon.com/Firewire-Expansion-Rosewill-RC-504-Controller/dp/B004F3DM6C). Note: This card has power input, no need to give power to it as Handycam is powered by it's own power source. Also it came with Firewire cable.
 3. Dell 5 year old desktop, Ubuntu, i7, 16GB RAM, 1TB HDD with ~500GB space.

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
```dv/some_event_name/```.
All captured recording go under it. Recording is done in raw dv format. 
1 Hr Digital 8 recording creates ~13GB of files.
## Convert
Use same event name mentioned for capture
```
./convert_dv_to_mp4.sh some_event_name
```
All mp4 go under
```mp4/some_event_name/```.
After conversion is done, total files size comes to ~1GB
## Capture and Convert in one shot
```
./grab_n_convert.sh some_event_name
```
## Result
Happiness of watching old memories

## License / Disclaimer and precautio
These tiny number of scripts have [Apache, v2.0 License](https://www.apache.org/licenses/LICENSE-2.0).
I have written this really quick to convert Digital Video Tapes to mp4 files. Scripts are manually tested against happy path. Please use them at your own risk. 
