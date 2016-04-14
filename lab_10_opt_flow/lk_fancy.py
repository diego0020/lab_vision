#!/usr/bin/env python

'''
Lucas-Kanade tracker
====================

Lucas-Kanade sparse optical flow demo. Uses goodFeaturesToTrack
for track initialization and back-tracking for match verification
between frames.

Usage
-----
lk_track.py [<video_source>]


Keys
----
ESC - exit
'''
import sys
sys.path.append(r"open_cv_samples")
import numpy as np
import cv2
import video
from common import  draw_str
from collections import deque
from time import clock
# Python Image Library
from PIL import ImageFilter, Image
# Scikit Image
from skimage import transform

lk_params = dict( winSize  = (15, 15),
                  maxLevel = 2,
                  criteria = (cv2.TERM_CRITERIA_EPS | cv2.TERM_CRITERIA_COUNT, 10, 0.03))

feature_params = dict( maxCorners = 500,
                       qualityLevel = 0.3,
                       minDistance = 7,
                       blockSize = 7 )

class App:
    def __init__(self, video_src):
        self.track_len = 10
        self.detect_interval = 5
        self.tracks = []
        self.cam = video.create_capture(video_src)
        self.frame_idx = 0
        self.last_event = clock()
        self.filter = 1
        self.min_interval = 5
        self.slow_frame=0
        self.sin_transform=None

    def apply_filter(self,img):
        if self.filter == 0:
            return img
        elif self.filter == 1:
            img = cv2.Laplacian(img,cv2.CV_8UC3)
            return img
        elif self.filter == 2:
            img = np.array(Image.fromarray(img).filter(ImageFilter.GaussianBlur()))
            return img
        elif self.filter == 3:
            if self.sin_transform is None:
                h, w = img.shape[:2]
                flow = np.zeros((h,w,2),np.float32)
                flow[:,:,0] += np.arange(w) + np.sin(np.arange(w)/(2*np.pi*5))*10
                flow[:,:,1] += np.arange(h)[:,np.newaxis]
                self.sin_transform = flow
            res = cv2.remap(img, self.sin_transform, None, cv2.INTER_LINEAR)
            return res
        else:
            out1 = transform.swirl(img, rotation=0, strength=5, radius=200)
            return out1
            

    def detect_direction(self,tracks):
        xy_mov=np.array([t[-1][0]-t[0][0] for t in tracks])
        xy_mean = np.mean(xy_mov[np.abs(xy_mov)>10])
        c=clock()
        if c - self.last_event < self.min_interval:
            return
        #print xy_mean
        if xy_mean < -20:
            print("left")
            self.last_event=c
            self.filter = (self.filter - 1)%5
            self.slow_frame=self.frame_idx
            return
        if xy_mean > 20:
            print("right")
            self.last_event=c
            self.filter = (self.filter + 1)%5
            self.slow_frame=self.frame_idx
            return

    def run(self):
        while True:
            ret, frame = self.cam.read()
            frame = frame[:,::-1,:]
            frame_gray = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)
            vis = self.apply_filter(frame.copy())

            if len(self.tracks) > 0:
                img0, img1 = self.prev_gray, frame_gray
                p0 = np.float32([tr[-1] for tr in self.tracks]).reshape(-1, 1, 2)
                p1, st, err = cv2.calcOpticalFlowPyrLK(img0, img1, p0, None, **lk_params)
                p0r, st, err = cv2.calcOpticalFlowPyrLK(img1, img0, p1, None, **lk_params)
                d = abs(p0-p0r).reshape(-1, 2).max(-1)
                good = d < 1
                new_tracks = []
                for tr, (x, y), good_flag in zip(self.tracks, p1.reshape(-1, 2), good):
                    if not good_flag:
                        continue
                    tr.append((x, y))
                    new_tracks.append(tr)
                    cv2.circle(vis, (x, y), 2, (0, 255, 0), -1)
                self.tracks = new_tracks
                cv2.polylines(vis, [np.int32(tr) for tr in self.tracks], False, (0, 255, 0))
                draw_str(vis, (20, 20), 'track count: %d' % len(self.tracks))
                self.gesture = self.detect_direction(self.tracks)

            if self.frame_idx % self.detect_interval == 0:
                mask = np.zeros_like(frame_gray)
                mask[:] = 255
                for x, y in [np.int32(tr[-1]) for tr in self.tracks]:
                    cv2.circle(mask, (x, y), 5, 0, -1)
                p = cv2.goodFeaturesToTrack(frame_gray, mask = mask, **feature_params)
                if p is not None:
                    for x, y in np.float32(p).reshape(-1, 2):
                        self.tracks.append(deque([(x, y)],self.track_len))


            self.frame_idx += 1
            self.prev_gray = frame_gray
            cv2.imshow('lk_track', vis)

            ch =  cv2.waitKey(1)
            if (ch == 2424832):            
                self.filter = (self.filter - 1)%5
            elif (ch == 2555904):
                self.filter = (self.filter + 1)%5
            elif ch == 27:
                break

def main():
    import sys
    try:
        video_src = sys.argv[1]
    except:
        video_src = 0

    print(__doc__)
    App(video_src).run()
    cv2.destroyAllWindows()

if __name__ == '__main__':
    main()
