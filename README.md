# Capture and Convert Digital8 or DV tapes to mp4 (libx264)
I have lots of old Digital 8 tapes all the way from 2000. Wanted to watch some old recording and was wondering if my old Handycam would still work. I was in luck, it worked but watching tapes on Handycam (and connect it to TV with RCA connectors) is a pain. Then I wanted to convert them to a video file so that I can watch them on modern devices like smart phone, computer etc. At the same time I did not want to use one of those specialized dv to dvd converter devices. They are too time consuming (lack of automation) and too manual.
On top they do not have much control over quality and maintaining file per recording in chronological order with record time timestamp. One would have to do lots of work by painstakingly go through video and split and set timestamp on converted files manually. There are so many other aspects one would like to tweak like quality of the final output, video format, better control over scene change and a file per scene. Scripts mentioned hear can be used (and tweaked) to achieve the same. 

## Goal
1. Only manual action I want to take is pop a tape in Digital8 or DV camcorder. Everything else up to creating mp4 files should be completely automated.
2. Execute dv grab and convert commands in bash shell that will do following
   * Capture recordings from tape and create separate files per recording.
   * Control over how tiny or big file to be captures and created.
   * Have proper recording time incorporated in the final files.
   * Compress (lossy) the DV format files to mp4 (libx264) for archival in less space and/or to upload to cloud.

## Getting ready
I did quick research and found that I can use dv capture card. Plug that to my Ubuntu desktop. Use ```dvgrab```
to capture recording from camcorder. Use ```ffmpeg``` to convert captured recording to mp4.

### Equipment
 1. Camcorder (Old [Sony Digital Handycam](https://esupport.sony.com/US/p/model-home.pl?mdl=DCRTRV510&LOC=3))
 2. Firewire card or machine which have firewire port. (I ordered this [Firewire card](https://www.amazon.com/Firewire-Expansion-Rosewill-RC-504-Controller/dp/B004F3DM6C). Note: This card has power input, no need to give power to it as Handycam is powered by it's own power source. Also it came with Firewire cable.)
 3. Desktop or Laptop (I used Dell 5 year old desktop, i7, 16GB RAM, 1TB HDD with ~500GB free space)
 4. Linux OS (Mine is Ubuntu 16.04.4 LTS)

### Setup
Installed Firewire card in to the Desktop. Hooked up Handycam's Firewire port to it with firewire cable, and that is it.


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
1. Type following command followed by event name, which have been recorded. I tend to put start date of the recording, but it's not necessary.
```
./grab.sh "2000_11_10_baby_neil_starts_walking"
```
This will create dir under
```dv/2000_11_10_baby_neil_starts_walking/```.
All captured recording go under it. Recording is done in raw dv format. 
1 Hr Digital 8 recording creates ~13GB of files.
## Convert
Use same event name mentioned for capture
```
./convert_dv_to_mp4.sh "2000_11_10_baby_neil_starts_walking"
```
All mp4 go under
```mp4/2000_11_10_baby_neil_starts_walking/```.
After conversion is done, total files size comes to ~1GB
## Capture and Convert in one shot
```
./grab_n_convert.sh "2000_11_10_baby_neil_starts_walking"
```
Note: I could have fed output of dvgrab to ffmpeg. That way I could have avoided to not split process in to a. grab then b. convert and save some space/time, however I choose to not do so. Reason is, I wanted to capture recording timestamp in the dv file name, then use it (timestamp in the filename) for setting file's last modified timestamp. This is essential in order to list captured and converted files in proper crolological order. That way if you upload these files in google photos or any other photo/video cloud solution then they will appear in the listing, by their recording time and not captured time. To achieve that goal first capture and then convert is the easiest way I found (not the only way). It takes another 10-18 minutes to convert, which in my opinion is not a big deal. Another advantage of splitting is, I can keep raw uncompressed dv recording  for future use.

## Result
Happiness of watching old memories

## License / Disclaimer and precaution
These tiny number of scripts have [Apache, v2.0 License](https://www.apache.org/licenses/LICENSE-2.0).
I have written these scripts really quick to convert Digital Video Tapes to mp4 files. Scripts are manually tested against happy path. Please use them at your own risk. 
